---
author: 'Ikenna Okpala'
comments: true
date: 2007-10-27 13:37:00
layout: post
slug: dependency-injection
title: Dependency injection
wordpress_id: 20
categories:
- JPA
- SPRING
---

Dependency injection is the mechanism through which the container injects the requested environmental entry to make available to the bean instance before any bean instance is invoked on that particular instance. Then the container injects these entries into bean variables or methods.
<!--more-->

It is a form of push configuration; the container "pushes" dependencies into application objects at runtime. This is the opposite of traditional pull configuration, in which the application object "pulls" dependencies from its environment. Thus, Dependency Injection objects never load custom properties or go to a database to load configuration — the framework is wholly responsible for actually reading configuration.

Dependency Injection is based on Java language constructs, rather than the use of framework-specific interfaces. Instead of application code using framework APIs to resolve dependencies such as configuration parameters and collaborating objects, application classes expose their dependencies through methods or constructorsthat the framework can call with the appropriate values at runtime, based on configuration.

It is bean provider's duty to tell the container that which method or variables should be injected at runtime. The bean provider can do this by using the deployment descriptor or annotations. Bean methods used for dependency injection should follow the java naming convention(JavaBeans) for properties in that they should follow the setXYZ() convention.

Consider the situations like dependency injection fails due to some reasons, the container can not make available the environmental entries due to which the bean is functioning properly, in such situations the container discards the bean instances and creates new instances.
