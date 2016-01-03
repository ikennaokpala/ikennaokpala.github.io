---
author: 'Ikenna Okpala'
comments: true
date: 2010-05-21 15:57:47
layout: post
slug: configuring-spring-security
title: Configuring Spring Security..
wordpress_id: 196
categories:
- JAVA
- MAVEN
- SPRING
- WEB DEVELOPMENT
---

Over the years web application security has continued to be a critical issue. This area of concern is a major source of worry for most enterprise application developers.

We as software developers, are faced with the task of securing valuable data that exist within our applications. This data could vary from  email account secured with a username / password pair or a brokerage account secured with a trading PIN, protecting an application is a important aspect of most applications, if not all.  (Walls C., 2007).

<!--more-->

According to [Craig Walls](http://www.jroller.com/habuma/) (2007, pg 248), Security is a concern that transcends an application’s functionality. For the most part, an application should play no part in securing itself. Although you could write security functionality directly into your application’s code (and that’s not uncommon), it is better to keep security concerns separate from application concerns.

One of the popular options for the enterprise java world is spring's security framework (formerly Acegi).

[Craigs Walls](http://www.jroller.com/habuma/) in his spring in action book defined spring security as  _"a security framework that provides declarative security for your Spring-based applications."_

In this blog post, I intend to share my personal experience configuring spring security.

Firstly there are a few requirements (jars). you will need to define the following in your maven pom.xml file.


{% highlight xml %}
<dependency>
 <groupId>org.springframework.security</groupId>
 <artifactId>spring-security-core</artifactId>
 <version>2.0.4</version>
 </dependency>
 <dependency>
 <groupId>org.springframework.security</groupId>
 <artifactId>spring-security-core-tiger</artifactId>
 <version>2.0.4</version>
 </dependency>
 <dependency>
 <groupId>org.springframework.security</groupId>
 <artifactId>spring-security-taglibs</artifactId>
 <version>2.0.4</version>
 </dependency>
 <dependency>
 <groupId>org.springframework.security</groupId>
 <artifactId>spring-security-acl</artifactId>
 <version>2.0.4</version>
 </dependency>
<dependency>
 <groupId>org.aspectj</groupId>
 <artifactId>aspectjrt</artifactId>
 <version>1.5.4</version>
 </dependency>
{% endhighlight %}


Next task is configuring the Web.xml file:


{% highlight xml %}

 <context-param>
 <param-name>contextConfigLocation</param-name>
 <param-value>
 classpath:applicationContext.xml
 </param-value>
 </context-param>

 <listener>
 <listener-class> org.springframework.web.context.ContextLoaderListener</listener-class>

 </listener>

 <filter>
 <filter-name>springSecurityFilterChain</filter-name>
 <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
 </filter>

 <filter-mapping>
 <filter-name>springSecurityFilterChain</filter-name>
 <url-pattern>/*</url-pattern>
 </filter-mapping>
{% endhighlight %}

Every Spring application requires an applications context, this is a primary requirement of all spring based applications, this is a trimmed down version focusing on the topic of this blog post.


{% highlight xml %}
<?xml version="1.0" encoding="MacRoman"?>
<beans xmlns="http://www.springframework.org/schema/beans"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:context="http://www.springframework.org/schema/context"
xmlns:tx="http://www.springframework.org/schema/tx"
xmlns:security="http://www.springframework.org/schema/security"
xmlns:lang="http://www.springframework.org/schema/lang"
xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.5.xsd
http://www.springframework.org/schema/tx
http://www.springframework.org/schema/tx/spring-tx-2.0.xsd
http://www.springframework.org/schema/context
http://www.springframework.org/schema/context/spring-context-2.5.xsd
http://www.springframework.org/schema/security
http://www.springframework.org/schema/security/spring-security-2.0.xsd
http://www.springframework.org/schema/lang
http://www.springframework.org/schema/lang/spring-lang-2.5.xsd">
<context:component-scan base-package="com.example" />
<security:http auto-config='false'>
<security:intercept-url pattern="/includes/**" access="IS_AUTHENTICATED_ANONYMOUSLY" filters="none" />
<security:intercept-url pattern="/favicon.ico" access="IS_AUTHENTICATED_ANONYMOUSLY" filters="none" />
<security:intercept-url pattern="/login.jsp" filters="none"/>
<security:intercept-url pattern="/**" access="ROLE_USER" filters="none" />
<security:form-login login-page="/login.jsp" authentication-failure-url="/login.jsp?login_error=1" />
<security:concurrent-session-control max-sessions="1"/>
<security:logout logout-url="/logout" logout-success-url="/"/>
</security:http>
<security:authentication-provider>
<security:password-encoder hash="md5" />
<security:user-service>
<security:user name="ikenna" password="3d801aa532c1cec3ee82d87a99fdf63f" authorities="ROLE_USER" />
<security:user name="admin" password="21232f297a57a5a743894a0e4a801fc3" authorities="ROLE_USER" />
<security:user name="test" password="098f6bcd4621d373cade4e832627b4f6" authorities="ROLE_USER" />
</security:user-service>
</security:authentication-provider>
</beans>
{% endhighlight %}

Finally the login.jsp page. This page hold the form tags and should be placed in the root of the webapps foilder.


{% highlight html %}

<%@page contentType="text/html" pageEncoding="MacRoman"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt' %>
<%@ page import="org.springframework.security.ui.AbstractProcessingFilter" %>
<%@ page import="org.springframework.security.ui.webapp.AuthenticationProcessingFilter" %>
<%@ page import="org.springframework.security.AuthenticationException" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title> Login Page</title>
 <link href="<c:url value="includes/stylesheets/main.css" />" media="screen"  rel="Stylesheet" type="text/css" />
 <link href="<c:url value="includes/stylesheets/calendar.css" />" media="screen" rel="Stylesheet" type="text/css" />
 <link href="<c:url value="includes/stylesheets/forms.css" />" media="screen" rel="Stylesheet" type="text/css" />
 </head>
 <body>
 <h1>Login </h1>
<c:if test="${not empty param.login_error}">
 <font color="red">
 Your login attempt was not successful, try again.<br/><br/>
 Reason: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>.
 </font>
 </c:if><br><br>
 <form name="f" action="<c:url value='j_spring_security_check'/>" method="POST">
 <fieldset>
 <legend>Log In Form</legend> <hr>
 <ol>
 <li><label for="login">Username:</label>
 <input type='text' name='j_username' value='<c:if test="${not empty param.login_error}"><c:out value="${SPRING_SECURITY_LAST_USERNAME}"/></c:if>'/>
 </li>
 <li>
 <label for="password">Password:</label>
 <input type='password' name='j_password'/>
 </li>
 <li>
 <label for="remember_me">Remember me:</label>
 <input type="checkbox" name="_spring_security_remember_me">
 </li>
 </ol>
 <div>
 <input name="reset" type="reset" value="Reset"  onclick="return confirm('Are you sure you want to Clear or Reset this form');">
 <input name="submit" type="submit" value="Log In">
 </div>
 </fieldset>
 </form
 </div>
</body>
</html>

{% endhighlight %}

One thing though, I struggled with is spring security not by passing the resources (*.js, *.css, and images etc..) declared the head section of my login.jsp file.

I noticed Spring security takes into account all the resources that are declared in the *.jsp pages and will atempt to display the last resource it remembered (declared in the login.jsp page).Also modern browsers request for the favicon.ico file from the web pages, I notice spring security required me to let it know that the resources should not be a priority to it.

I would suggest copying all your *.js, *.css, and images etc.. in to one folder (includes) and then declare the folder as IS_AUTHENTICATED_ANONYMOUSLY also setting the filters off.


{% highlight xml %}

<security:intercept-url pattern="/includes/**" access="IS_AUTHENTICATED_ANONYMOUSLY" filters="none" />
<security:intercept-url pattern="/favicon.ico" access="IS_AUTHENTICATED_ANONYMOUSLY" filters="none" />
{% endhighlight %}

REFERENCE:
Walls C., Breidenbach R. 2007. Spring in Action Second Edition, Manning Publishers.
