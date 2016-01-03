---
author: 'Ikenna Okpala'
comments: true
date: 2010-05-30 01:19:45
layout: post
slug: populating-jsf-combo-box-with-database-values
title: Populating JSF Combo Box with Database values. (or drop down list)...
wordpress_id: 242
categories:
- JAVA
- JSF
- NETBEANS
- PRIMEFACES
- SPRING
- WEB DEVELOPMENT
- WICKET
---

I am presently working on my AISD project, and i am using jsf([primefaces](http://www.primefaces.org)) spring and jpa to build the system.

I would like to commend the efforts of the brains behind [jsf](http://www.javaserverfaces.org/specification/expert-group) 2.0 and [primefaces](http://www.primefaces.org) (1.* and 2.*) :) in particular for making the life of java web devs much easier.

I remember back in the days the first versions of [jsf](http://www.javaserverfaces.org/specification/expert-group) were simply nightmares, which lead my cohorts and i  to move to frameworks like [wicket](http://wicket.apache.org/) :).


<!--more-->

This blog post seeks to show how to populate a [jsf](http://www.javaserverfaces.org/specification/expert-group) Combo box with values from a database table and also you would notice that the implementation for this case includes both jsf 1.* and jsf 2.*. I assume some familiarity with spring jpa and [jsf](http://www.javaserverfaces.org/specification/expert-group).

Most relational database records have a primary key to uniquely identify it. This key appears on other tables as foreign keys. In my application i needed to display one or more of the attributes of a record from a table on a form and persist its unique identifier .

Below i provide some sample code that gives some hint on how this can be achieved using plain old java objects..

First lets paint the screen.. For JSF 1.*:


{% highlight xml %}

<html xmlns="http://www.w3.org/1999/xhtml"
xmlns:h="http://java.sun.com/jsf/html"
xmlns:f="http://java.sun.com/jsf/core"
xmlns:p="http://primefaces.prime.com.tr/ui">
<head>
<p:resources />
</head>
<body>
<h:form prependId="false" styleClass="cmxform">
<fieldset>
  <legend> </legend>
<p:panel id="panel" header="Combo Box Example">
<h:panelGrid columns="2"  columnClasses="label,value" styleClass="grid">
<h:outputLabel for="cb" value="comboItem" />
<h:selectOneMenu id="selectOneCb" value="#{pageBean.model.modelid}">
<f:selectItem itemLabel="Select Model" itemValue="" />
<f:selectItems value="#{pageBean.myModelValues}" />
</h:selectOneMenu>
</h:panelGrid>
</p:panel>
</fieldset>
</h:form>
</body>
</html>

{% endhighlight %}

For JSF 2.* this is even easier (thanks to [Çağatay Çivici](http://cagataycivici.wordpress.com/) the [primefaces](http://www.primefaces.org) lead for pointing this out to me :)):


{% highlight xml %}

<html xmlns="http://www.w3.org/1999/xhtml"
xmlns:h="http://java.sun.com/jsf/html"
xmlns:f="http://java.sun.com/jsf/core"
xmlns:p="http://primefaces.prime.com.tr/ui">
<head>
<p:resources />
</head>
<body>
<h:form prependId="false" styleClass="cmxform">
<fieldset>
  <legend> </legend>
<p:panel id="panel" header="Combo Box Example">
<h:panelGrid columns="2"  columnClasses="label,value" styleClass="grid">
<h:outputLabel for="cb" value="comboItem" />
<h:selectOneMenu id="selectOneCb" value="#{pageBean.model.modelid}">
<f:selectItem itemLabel="Select Model" itemValue="" />
<f:selectItems value="#{pageBean.mlist}" var="model" itemLabel="#{model.modelvalue}" itemValue="#{model.modelId}"/>
</h:selectOneMenu>
</h:panelGrid>
</p:panel>
</fieldset>
</h:form>
</body>
</html>

{% endhighlight %}

Next lets define the backing page bean... For JSF 1.* this is ok :


{% highlight java %}

@Component("pageBean")
@Scope("request")
public class PageBean implements Serializable {
private model = new Model();
private ModelService modelService;
private Map<String, String> myModelValues = new HashMap<String, String>();
private List<Model> mList;
public PageBean(){
}

 @Autowired
public PageBean(ModelService modelService){
this. modelService = modelService;
        mList = modelService.findAll();
        for (Model m : mList) {
            myModelValues.put(m.getmyModelValue(), m.getmyModelId());
     }
}
public Map<String, String> getMyModelValues() {
return myModelValues;
    }
public void setMyModelValues(Map<String, String> myModelValues) {
this.myModelValues= myModelValues;
 }
public Model getModel() {
return model;
}
public void setModel(Model model) {
this.model = model;
}
}

{% endhighlight %}

For JSF 2.* it is even better => You don't need  use a Map or Hash Map as the case may be above (thanks to [Çağatay Çivici](http://cagataycivici.wordpress.com/) the [primefaces](http://www.primefaces.org) lead for pointing this out ):


{% highlight java %}

@Component("pageBean")
@Scope("request")
public class PageBean implements Serializable {
private model = new Model();
private ModelService modelService;
private List<Model> list;
public PageBean(){
}

@Autowired
public PageBean(ModelService modelService){
        this. modelService = modelService;
        list = modelService.findAll();
}

public List<Model> getList() {
	return list;
}
public Model getModel() {
return model;
}
public void setModel(Model model) {
this.model = model;
}
}

{% endhighlight %}

Below is a service interface to define the the findAll method:


{% highlight java %}
public interface ModelService {

public List< Model> findAll();
}
{% endhighlight %}

Next the implementation for the Model Service Interface:


{% highlight java %}


@Service("modelService")
public ModelServiceImpl implements ModelService  {
private ModelDAO modeldao;
@Autowired
public ModelServiceImpl(ModelDAO modeldao) {
        this. modeldao = modeldao;
    }
    @Transactional(readOnly = true)
    public List<Model> findAll() {
        return modeldao.findAll();
    }
}
{% endhighlight %}

The Data Access object interface:


{% highlight java %}
public interface ModelDAO {

public List< Model> findAll();
}
{% endhighlight %}

The Data Access object implementation proper:


{% highlight java %}
@Repository
public class ModelDAOImpl implements ModelDAO {

    @PersistenceContext
    protected EntityManager entityMgr;

    public EntityManager getEntityMgr() {
        return entityMgr;
    }

    public void setEntityMgr(EntityManager entityMgr) {
        this.entityMgr = entityMgr;
    }

    public List<Model> findAll() {
        Query query = entityMgr.createNamedQuery("Model.findAll");
        return query.getResultList();
    }
}
{% endhighlight %}

Finally lets define the jpa model object:


{% highlight java %}
@Entity
@Table(name = "MODEL")
@NamedQuery(name = "Model.findAll", query = "SELECT m FROM Model m") // this query returns distinct values from the database.
public class Model implements Serializable {

    @Id
    @Basic(optional = false)
    @Column(name = "MODEL_ID")
    private String modelId;
    @Basic(optional = false)
    @Column(name = "MODEL_VALUE")
private String modelValue;
 public Model() {
    }
 public Model(String modelId, String modelValue) {
this.modelId = modelId;
this.model = modelValue;
}
 public String getModelId() {
        return modelId;
    }

    public void setModelId(String modelId) {
        this.modelId = modelId;
    }

    public String getModelValue() {
        return modelValue;
    }

    public void setModelValue(String modelValue) {
        this. modelValue = modelValue;
    }
    }
{% endhighlight %}

The code above steps through it all... Ciao for now..
