---
author: 'Ikenna Okpala'
comments: true
date: 2007-09-29 16:12:00
layout: post
slug: persistence-and-entity-beans
title: Persistence and Entity Beans
wordpress_id: 18
categories:
- EJB 3.0
- JAVA
- JPA
---

Persistence is a higher-level abstraction above JDBC. The persistence layer maps objects to database storage so that they can be queried, loaded, updated, or removed without having to go through a verbose API such as JDBC. In older versions of EJB, persistence was part of the EJB platform. Starting with EJB 3.0, persistence has been spun off to its own specification, called the Java Persistence API.
<!--more-->

The Java Persistence API defines a way to map regular, plain old Java objects (sometimes referred to as POJOs) to a database. These plain Java objects are called entity beans. Entity beans are like any other Java class, except that they have been mapped, using Java Persistence metadata, to a database. Therefore, they may be inserted and loaded from a database without the developer writing any JDBC connection code or reading from result sets. The Java Persistence API also defines a query language that has features that parallel those in SQL, but is tailored to work with Java objects rather than a raw relational schema.

In the EJB 2.1 specification, entity beans were very "heavyweight" and dependent on the application server and the entire Java EE runtime environment. In Java Persistence, entity beans are regular Java objects that are managed by a persistence service. Unlike their EJB 2.1 counterparts, entities in Java Persistence are not required to implement any special spec-defined interfaces or classes. Another weakness of the older specification was that it left individual vendors to decide how an object should be mapped to a particular database representation. This made EJB 2.1 entity beans mostly nonportable between vendors. The new Java Persistence specification defines a complete object to relational mapping (ORM) so that entity beans can be ported easily from vendor to vendor. Furthermore, because entity beans are now plain Java objects, they are not just portable between application servers; they can be used in regular Java applications outside of an application server and can even be used to transfer data between a client and a server. This makes designs simpler and more compact.
