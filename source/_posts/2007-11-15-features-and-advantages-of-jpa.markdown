---
author: 'Ikenna Okpala'
comments: true
date: 2007-11-15 14:43:00
layout: post
slug: features-and-advantages-of-jpa
title: 'Features and Advantages of JPA:'
wordpress_id: 25
categories:
- JPA
---

Java Persistence API is the standard API used for the management of the persistent data and object/relational mapping.

Java Persistence API were added in Java EE 5 platform.

Every application server compatible with Java EE 5 supports the Java Persistent APIs.
Java Persistence API ensures the management of persistence and object/relational mapping.
<!--more-->

These are helpful while using the JPA in the development of applications using the platform for Java EE 5. It provides O-R mapping facility to manage relational data in java application.

The Java Persistence API contains the following areas:

Java Persistence API
O-R mapping metadata
The query language

Java Persistence API is a lightweight framework based on POJO for object-relational mapping. Java language metadata annotations and/or XML deployment descriptor is used for the mapping between Java objects and a relational database. It allows the SQL-like query language that works for both static as well as dynamic queries. It also allows the use of the pluggable persistence API. Java Persistence APIs are mainly depends on metadata annotations.

API includes:

Java Persistence API
Metadata annotations
Java Persistence query language


The Java Persistence API is build upon the best ideas from the persistence technologies like TopLink, JDO and Hibernate. Java Persistence API is compatible with Java SE environment as well as Java EE and allows developers to take advantages of the standard persistence API.

Persistence of data is not so easy for most of the enterprise applications because for this they require access to the relational database like Oracle 10g. It is your responsibility to update and retrieve the database by writing the code using SQL and JDBC.

While several object-relational (O-R) frameworks such as JBoss Hibernate and OracleTopLink make persistence challenges simpler and became popular. They let the java developer free from writing JDBC code and to concentrate only on the business logic.

In EJB 2.x, container manage persistence (CMP) try to solve the persistence challenges but not successful completely.
