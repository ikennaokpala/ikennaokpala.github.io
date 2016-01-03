---
author: 'Ikenna Okpala'
comments: true
date: 2007-12-26 07:53:00
layout: post
slug: object-oriented-design-patterns
title: OBJECT ORIENTED DESIGN PATTERNS.
wordpress_id: 30
categories:
- DESIGN PATTERNS
---

When I first encountered the term “DESIGN PATTERNS” it seamed a little strange to me. But, in actuality, design patterns are expedient ways of reusing object-oriented code between developers. The concept of design patterns is basic collection of common interactions between objects that software developers over time found useful.
<!--more-->

Design patterns dates back to the early 1980s. Then, languages like Smalltalk were the most common OO language and C++ was still in its burgeoning stage and structured programming was the lead concept and OO programming was not yet as widely supported. The idea of programming frameworks was acknowledged however, and as frameworks developed, some of what we now called design patterns began to materialize.

The Model-View-Controller framework for Smalltalk which separated and provided three interface parts. The parts were referred to as a data model which contain the primary domain parts of the program, the view, which presented the user interface, and the controller, which interacted between the user and the view.

Every one of these segments is a separate object and each has its own convention for managing its data. Communication between the user, the GUI and the data should be carefully controlled and this separation of functions accomplished that very nicely. Three objects talking to each other using this restrained set of connections is an example of a powerful design pattern.

Design patterns portray how objects communicate without being entangled in each other’s data models and methods. Maintaining this partition has at all times been an objective of good OO programming, and if you have been trying to make objects mind their own business, you are probably using some of the common design patterns already. Captivatingly enough, the MVC pattern has reappeared now and we find it used in Java EE 5.0 and Ruby etc.

Design patterns began to be renowned more formally in the early 1990s as a result of discussions, a number of technical meetings and the publishing of the book Design Patterns Elements of Reusable Software, by Gamma, Helm, Johnson and Vlissides. This book, commonly referred to as the Gang of Four or “GoF” book, has had an influential impact on those seeking to understand how to use design patterns and has become an all time best seller.

Design patterns can be at many levels from very low level specific solutions to broadly generalized system issues. Hundreds of patterns exist today  in the literature. They have been discussed in articles, blog and at conferences of all levels of granularity.

 The process of looking for these patterns is termed “pattern mining,” and can be said to be another research study.

The design patterns selected for inclusion in the GoF Design Patterns book were ones which had several known applications and which were on the focal point level of generality, where they could easily cross
application areas and encompass several objects.

Design Patterns are divided into three types creational, structural and behavioral.

* Creational patterns construct objects, than having the developer instantiate objects directly. This gives the developer’s program more flexibility in deciding which objects need to be created for a given situation.

* Structural patterns makes up groups of objects into larger structures, such as multifaceted user interfaces or financial data.

* Behavioral patterns define the communication between objects in the system and how the flow is controlled in a composite program.
