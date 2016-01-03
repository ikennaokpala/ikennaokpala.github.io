---
author: 'Ikenna Okpala'
comments: true
date: 2007-10-23 13:16:00
layout: post
slug: ejb-3-0s-concurrency-control
title: EJB 3.0's Concurrency Control.
wordpress_id: 19
categories:
- EJB 3.0
- JAVA
- JPA
---

Concurrency control is a necessary part of distributed systems  it house's the basics of collisions and type of collisions that can occur.  The EJB Container provides supports for various types of concurrency controls. For now we will concentrate on collision and then techniques to resolve these collisions.
<!--more-->

A collision can occur when two or more transactions tries to change the entities within a system of records. There are three causes  which  interfere:
Dirty read
Non Repeatable read
Phantom read

Mainly two mechanism are used to control the concurrency.
Optimistic Locking
Pessimistic Locking
