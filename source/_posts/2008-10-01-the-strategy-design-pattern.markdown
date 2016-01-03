---
author: 'Ikenna Okpala'
comments: true
date: 2008-10-01 07:13:00
layout: post
slug: the-strategy-design-pattern
title: The Strategy Design Pattern
wordpress_id: 38
categories:
- DESIGN PATTERNS
---

[![](http://exciton.cs.rice.edu/javaresources/DesignPatterns/Strategy.jpg)](http://exciton.cs.rice.edu/javaresources/DesignPatterns/Strategy.jpg)



The Strategy Design Pattern (also refered to as the **policy pattern**) basically consists of decoupling an algorithm from its parent, and encapsulating the algorithm into a separate class. Simply put, an object and its behaviour are separated and put into two different classes. This allows you to switch the algorithm that you are using at any time.


<!--more-->

There are several advantages to doing this. First, if you have several different behaviours that you want an object to perform, it is much simpler to keep track of them if each behaviour is a separate class, and not buried in the body of some method. Should you ever want to add, remove, or change any of the behaviours, it is a much simpler task, since each one is its own class. Each such behaviour or algorithm encapsulated into its own class is called a Strategy.

When you have several objects that are basically the same, and differ only in their behaviour, it is a good idea to make use of the Strategy Pattern.. Using Strategies, you can reduce these several objects to one class that uses several Strategies. The use of strategies also provides a nice alternative to subclassing an object to achieve different behaviours. When you subclass an object to change its behaviour, that behaviour that it executes is static. If you wanted to change what it does, you'd have to create a new instance of a different subclass and replace that object with it. With Strategies, however, all you need to do is switch the object's strategy, and it will immediately change how it behaves. Using Strategies also eliminates the need for many conditional statements. When you have several behaviours together in one class, it is difficult to choose among them without resorting to conditional statements. If you use Strategies you won't need to check for anything, since whatever the current strategy is just executes without asking questions.




Reference Antonio García
