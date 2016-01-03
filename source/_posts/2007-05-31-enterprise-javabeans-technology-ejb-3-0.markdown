---
author: 'Ikenna Okpala'
comments: true
date: 2007-05-31 17:20:00
layout: post
slug: enterprise-javabeans-technology-ejb-3-0
title: Enterprise JavaBeans Technology (EJB 3.0)
wordpress_id: 11
categories:
- EJB 3.0
- JAVA
- JPA
---

**Enterprise Java Beans** is a component architecture for the development and deployment of object-oriented, distributed, enterprise-level applications. Applications written using the Enterprise JavaBeans architecture are scalable, transactional, multi-user and secure.

**EJB** is designed to support application portability and reusability across any vendor’s enterprise middleware services.

<!--more-->

**EJB** is a standard for developing and deploying server-side distributed components in Java. It defines an agreement (contract) between components and application servers that enables any component to run in any compliant application server.

Despite the rich features, the complexity of the **EJB** architecture has hindered its wide adoption. Various component technologies have taken over the **EJB** arena. For example Toplink and the open-source Hibernate framework have overtaken **EJB** as a better and easier choice for developing persistence solutions.

**EJB 3.0** brings us closer to the dream of creating enterprise beans like regular objects. It reduces the number of programming artifacts for developers, eliminates or minimizes callback methods required to be implemented, and reduces the complexity of the entity bean programming model and O/R mapping model. With **EJB 3.0**, J2EE now Java EE seems accessible to a much wider audience.

In this article, we first briefly discuss the pitfalls of **EJB 2.1.** Next, we describe how **EJB 3.0** provides solution to these difficulties by describing the significant changes.

**Pitfalls of EJB 2.1.**

_EJBs with EJB 2.1 hasn't been the easiest thing to do. The reasons are easy to find:_





  * _To create a single EJB you need to create a multitude of XML deployment descriptors. _


  * _A set of three source files must be created. _


  * _Multiple callback methods must be implemented that usually are never used._


  * _You have to throw and catch several types of unnecessary exceptions. _


  * _Yet another complaint is that the EJBs are completely untestable outside the context of the container since components like container-managed entity beans are abstract classes._


  * _Finally, EJB-QL in its current form is limited in functionality and difficult to use. These limitations force developers to use straight JDBC and SQL, or to use other persistence frameworks such as Toplink and Hibernate. _


_The sheer verbosity of the API has been one big annoyance, and EJB 3.0 makes a significant attempt to address most issues. This article covers the important aspects of this specification._

The two most significant changes in the proposed EJB 3.0 specification are the use of the program annotation facility introduced in Java 5 and the new O/R mapping model based on Hibernate's pattern.

Java SE 5 has introduced a new program annotation facility to the language. With this facility, you can define custom annotations and then annotate fields, methods, classes, etc., with these annotations. Annotations do not directly affect program semantics, but tools (compile time or runtime) can inspect these annotations to generate additional constructs (like a deployment descriptor) or enforce desired runtime behavior (like an EJB component's stateful nature).

Annotations can be inspected through source parsing (e.g., compilers or IDE tools) or by using the additional reflection APIs added in Java 5. Annotations can be defined to be available only at the source code level, at the compiled class level, or at runtime. All annotations proposed in the EJB 3.0 early draft have a RetentionPolicy of RUNTIME.

This increases the class's memory footprint marginally, but makes the life of container provider and tool provider much easier.This brings to an end the configuration of XML deployment descriptors was a major bottleneck in the path to simplifying development of EJBs. Therefore one of the primary goals of the EJB 3.0 specification was to shield the developer from having to work with XML files.

This is accomplished by the use of metadata annotations that have been added to JDK 5.0 as part of the JSR 175 JCP specification. Annotations are a kind of attribute-oriented programming and are similar to XDoclet.

However, unlike XDoclet, which requires pre-compilation, annotations are compiled into the classes by the Java compiler at compile-time. From the developer's point of view, annotations are modifiers like public/private and can be used in classes, fields, or methods.

Hibernate is a popular, open source O/R mapping framework for Java environments, meant to shield developers from most common data-persistence-related programming tasks. It also has a specific Hibernate Query Language (HQL), imprints of which can be seen in the new EJB QL. Hibernate offers facilities for data retrieval and update, connection pooling, transaction management, declarative entity relationship management, and declarative and programmatic queries.

The new entity beans are also just POJOs with a few annotations and are not persistent entities by birth. An entity instance becomes persistent once it is associated with an EntityManager and becomes part of a persistence context. A persistence context is loosely synonymous with a transaction context; in strict words, it implicitly coexists with a transaction's scope.

The entity relationships are also defined through annotations। In addition, O/R mapping is also done through annotations, and support for several database-specific operations is provided.

With EJB 2.1, developers used their own design patterns or employed nonportable techniques (for example, auto key generation strategies).

The main aim of the **EJB 3.0** is to provide an improved **EJB** architecture by reducing its complexity from enterprise application developer's point of view.

**EJB 3.0** is focused on the following goals:




  * Definition of the Java language metadata annotations that can be used to annotate EJB applications. These metadata annotations are targeted at simplifying the developer’s task, at reducing the number of program classes and interfaces the developer is required to implement, and at eliminating the need for the developer to provide an EJB deployment descriptor.


  * Specification of programmatic defaults, including for metadata, to reduce the need for the
developer to specify common, expected behaviors and requirements on the EJB container. A “configuration by exception” approach is taken whenever possible.


  * Encapsulation of environmental dependencies and JNDI access through the use of annotations,
dependency injection mechanisms, and simple lookup mechanisms.


  * Simplification of the enterprise bean types.


  * Elimination of the requirement for EJB component interfaces for session beans. The required business interface for a session bean can be a plain Java interface rather than an EJBObject, EJBLocalObject, or java.rmi.Remote interface.


  * Elimination of the requirement for home interfaces for session beans.


  * Simplification of entity persistence through the Java Persistence API. Support for light-weight
domain modeling, including inheritance and polymorphism.


  * Elimination of all required interfaces for persistent entities.


  * Specification of Java language metadata annotations and XML deployment descriptor elements for the object/relational mapping of persistent entities.


  * A query language for Java Persistence that is an extension to EJB QL, with addition of projection, explicit inner and outer join operations, bulk update and delete, subqueries, and
group-by. Addition of a dynamic query capability and support for native SQL queries.


  * An interceptor facility for session beans and message-driven beans.


  * Reduction of the requirements for usage of checked exceptions.


  * Elimination of the requirement for the implementation of callback interfaces.


