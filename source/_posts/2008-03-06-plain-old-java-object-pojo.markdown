---
author: 'Ikenna Okpala'
comments: true
date: 2008-03-06 08:02:00
layout: post
slug: plain-old-java-object-pojo
title: Plain Old Java Object (POJO)
wordpress_id: 35
categories:
- JAVA
- JPA
---

POJO is YAA (yet another acronym) for Plain Old Java Object, and is favoured by advocates of the idea that the simpler the design, the better. Nowadays POJO’s are everywhere. The name was coined by Martin Fowler, Rebecca Parsons and Josh MacKenzie in September 2000. Most of our development today is done using POJOs.

In Chris Richardson’s (author) words -
<!--more-->

The simplicity of POJOs is attractive, especially to those working with the older Enterprise Java Beans (EJB) specification. The topic assumes a simple axiom: The simpler a framework’s design, the more extensible it is to programmers. For example, in an open letter to the Java community, Linda DeMichiel and Craig Russell talk briefly about adopting POJOs for both Java Data Objects (JDO) API 2.0 and the new EJB 3.0 specification, pronouncing the need for a single, simple persistence model. As the FAQ notes, this API “is an evolution of the work started in the JSR 220 Expert Group, which has been expanded to include several members of the JSR 243 (JDO 2.0) Expert Group.” JSR 220 covers the creation of the EJB 3.0 specification, with a stated mandate “to improve the EJB architecture by reducing its complexity from the developer’s point of view.”

The term continues the pattern of older terms for technologies that do not use fancy new features, such as POTS (Plain Old Telephone Service) in telephony, and PODS (Plain Old Data Structures) that are defined in C++ but use only C language features.

The term has most likely gained widespread acceptance because of the need for a common and easily understood term that contrasts with complicated object frameworks. A JavaBean is a POJO that is serializable, has a no-argument constructor, and allows access to properties using getter and setter methods. An Enterprise JavaBean is not a single class but an entire component model (again, EJB 3 reduces the complexity of Enterprise JavaBeans).

The concept of a POJO predates the term POJO as it simply refers to the natural condition of an object class. The term serves as a reminder that simpler designs can be better, rather than incorporating a complicated framework in the architecture of a system without sufficient reason. As designs using POJOs have become more commonly-used, systems have arisen that give POJOs some of the functionality used in frameworks and more choice about which areas of functionality are actually needed. Hibernate and Spring are examples.
