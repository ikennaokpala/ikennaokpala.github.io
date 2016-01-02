---
author: 'Ikenna Okpala'
comments: true
date: 2009-09-08 14:18:00
layout: post
slug: using-the-wicket-framework-to-update-html-style-tag
title: Using the Wicket Framework to Update style tag.
wordpress_id: 47
categories:
- CSS
- JAVA
- NETBEANS
- WEB DEVELOPMENT
- WICKET
---

In this post,  [Wicket](http://wicket.apache.org/) Framework is used to update the embedded style tag.

An already working sample can be found [here](http://wicket1.ikennaokpala.staxapps.net/).

<!--more-->
Let's begin by configuring the web application (i.e. web.xml)
{% highlight xml %}

<web-app xmlns="http://java.sun.com/xml/ns/j2ee" xsi="http://www.w3.org/2001/XMLSchema-instance" schemalocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd" version="2.4">

<display-name>CSS and Wicket</display-name>
<filter>
<filter-name>css_wicket</filter-name>
<filter-class>org.apache.wicket.protocol.http.WicketFilter</filter-class>
<init-param>
<param-name>applicationClassName</param-name>
<param-value>com.jw.ike.pages.CssApplication</param-value>
</init-param>
</filter>

<filter-mapping>
<filter-name>css_wicket</filter-name>
<url-pattern>/*</url-pattern>
</filter-mapping>

</web-app>


{% endhighlight %}

The wicket  application class go as follows:

{% highlight java %}

public class CssApplication extends WebApplication {

public CssApplication() {
}

public Class getHomePage() {
return CssDemo.class;
}

}


{% endhighlight %}

The getHomePage() method returns this Page:

{% highlight java %}

public class CssDemo extends WebPage implements Serializable {
	private String uStyle;

	public CssDemo() {
		add(new Label("style"));
		add(new CssForm("addform"));

	}

	public CssDemo(String userStyle) {
		this.uStyle = userStyle;
		this.add(new Label("style", new PropertyModel(this, "uStyle")));
add(new CssForm("addform"));

	}

}

{% endhighlight %}

And the accompanying HTML web page is:

{% highlight html %}

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="../css/style/style.css">
<title>Wicket Updating Style Sheet</title>
<style type="text/css" wicket:id="style"></style>
</head>
<body>

<div id="bmain">
<form wicket:id="addform">
<h2>Update Style Sheet...</h2>

<span>Select Pre-Defined CSS Rules </span>

<select wicket:id="combo">

</select>

<textarea id="ta" wicket:id="txta" rows="20" cols="60"> rich text </textarea>

<input id="btn" type="submit" value="::Post Style Sheet::"></form>
<a href="http://wicket.apache.org/" >
<img id="logo" alt="Wicket" src="../images/wicket-logo.png" border="0" width='111' height="155"/></a>

</div>

<div id="side">

<h1>Change Me @!#%.</h1>

 </div>
</body>
</html>


{% endhighlight %}

And then the Form Class:

{% highlight java %}


public class CssForm extends Form {

private String style1 = "Choose a style";
private String style2 = "h1{ font-size: 4.0em; font-family: Mistral; color: #dc512b; border:10px solid #bb342d; background-color: #098762;text-align: center;}";
private String style3 = "h1{ font-size: 5.0em; font-family: Comic Sans MS; color: #0066CC; border:10px solid #330066; background-color: green;text-align: center;}";
private String style4 = "h1{ font-size: 6.0em; font-family: Curlz MT; color: #CCFFFF; border:10px solid #445698; background-color: #6666CC;text-align: center;}";

private static String css;
private List cssList;
private String selectedCss = style1;
private DropDownChoice dropDownMenu;
private TextArea textArea;

public CssForm(String componentid) {
super(componentid);

cssList = Arrays.asList(new String[]{style1, style2, style3, style4});

dropDownMenu = new DropDownChoice("combo", new PropertyModel(this, "selectedCss"),
     cssList) {

 @Override
 protected void onSelectionChanged(Object newSelection) {

     textArea.setModelObject(newSelection);

 }

 @Override
 protected boolean wantOnSelectionChangedNotifications() {

     return true;
 }

};
add(dropDownMenu);

textArea = new TextArea("txta", new PropertyModel(this, "css"));

add(textArea);

}

@Override
protected void onSubmit() {
String definedCssRule =  textArea.getModelObject().toString();
definedCssRule = "\n\n\n" + definedCssRule + "\n\n\n";
setResponsePage(new CssDemo(definedCssRule));
textArea.setModelObject(null);
}
}


{% endhighlight %}

The External Style Sheet :

{% highlight css %}

body {
	background-image: url("../images/cl.jpg");
	background-repeat: no-repeat;
}

h1 {
	font-size: 4.5em;
	color: #4088b8;
	margin: -300px 0 0 0;
	position: relative;
	left: -20px;
	top: 10px;
	position: relative
}

h2 {
	color: #4088b8;
}

span {
	font-size: 1.0em;
	color: #4088b8;
	padding:0 33px 0 2px;
}

#logo {
	position: relative;
	left: 0px;
	top: 50px;
	z-index: 1;
}
select {

	position: relative;
	left: 0px;
	bottom: 2px;
	width: 230px;
}

#jw {
	position: relative;
	left: 900px;
	top: -50px;
	z-index: 1;
}

#bmain {
	width: 510px;
	margin: 10px 0 0 0;
	position: inherit;
}

#side {
	float: right;
	width: 600px;
	margin: -150px 0 0 0;
	padding: 1px 0 0 0;
}

#ta {
	padding: 0 20px 0 0;
}

#btn {
	background-color: #4088b8;
	border-color: 4088b8;
	color: white;
	position: relative;
	left: 180px;
	top: 50px;
}

{% endhighlight %}