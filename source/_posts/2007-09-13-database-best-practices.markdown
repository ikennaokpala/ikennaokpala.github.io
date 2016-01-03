---
author: 'Ikenna Okpala'
comments: true
date: 2007-09-13 14:36:00
layout: post
slug: database-best-practices
title: Database Best Practices
wordpress_id: 17
---

**These "best practices" for evolutionary/ database development are:**

**Database refactoring.**  A database refactoring is a small change to your database schema which improves its design without changing its semantics (e.g. you don't add anything nor do you break anything).  The process of database refactoring is the evolutionary improvement of your database schema so as to improve your ability to support the new needs of your customers.
<!--more-->

**Data modeling**.  With an evolutionary approach to data modeling you model the data aspects of a system iteratively and incrementally.  With an agile approach you do so in a highly collaborative manner.  You will envision the initial requirements and architecture early in the project at a high-level and then model storm the details on a just in time (JIT) basis when and if they're needed -- no more "big up front modeling (BMUF)".
**
Database regression testing.**
You should ensure that your database schema actually meets the requirements for it, and the best way to do that is via testing.  With a test driven development (TDD) approach you write a unit test before you write production database schema code, the end result being that you have a 100% regression test for your database schema.  Testing provides the concrete feedback that you need to ensure data quality.

**Configuration management of database artifacts.**  Your data models, database tests, test data, and so on are important project artifacts which should be configuration managed just like any other artifact.

**Developer sandboxes**.  Developers need their own working environments, called sandboxes, where they can modify the portion of the system which they are building and get it working before they integrate their work with that of their teammates.

**Data normalization.**  Data normalization is a process in which data attributes within a data model are organized to increase the cohesion of entity types.  In other words, the goal of data normalization is to reduce and even eliminate data redundancy, an important consideration for application developers because it is incredibly difficult to stores objects in a relational database that maintains the same information in several places.

**Set a realistic primary key strategy.**  The fact is that sometimes it makes sense to use natural keys and sometimes surrogate keys.  As a professional you need to understand when to apply each strategy, and to be prepared to refactor if you discover that you've made the wrong choice.
**
Database encapsulation.**
A database encapsulation layer hides the implementation details of your database(s), including their physical schemas, from your business code.  In effect it provides your business objects with persistence services – the ability to read data from, write data to, and delete data from – data sources.  Ideally your business objects should know nothing about how they are persisted, it just happens.  Database encapsulation layers aren’t magic and they aren’t academic theories; database encapsulation layers are commonly used practice by both large and small applications as well as in both simple and complex applications.  Database encapsulation layers are an important technique that every agile software developer should be aware of and be prepared to use.

**Train developers in basic data skills.**  This enables developers to both improve their data-oriented work and to interact with data professionals more effectively.  Fundamental skills include: relational database fundamentals, data modeling, mapping objects to RDBs (O/R mapping), working with legacy data, XML, referential integrity and shared business logic, how to retrieve objects from an RDB, how to implement reports, security access control, and transactions and concurrency control.

**Train DBAs in basic development skills.**  Similarly, DBAs need to gain an understanding of application development so that they can play active roles on the team(s) which they support.

**Common development guidelines.**  Having a common, usable set of development standards which are easy to understand and to comply to can greatly improve the quality of the systems that you develop.  These guidelines may include, but not be limited to, programming guidelines, modeling style guidelines, and data naming conventions.

**Lean data governance.**  The goal of data governance is to ensure the quality, availability, integrity, security, and usability within an organization.  The way that you go about this is up to you.  Many traditional approaches to data governance seem to struggle in practice, I suspect in part because of the cultural impedance mismatch but also in part because traditional IT governance struggles in general. The command and control approach typical of traditional governance strategies is a lot like herding cats, you do a lot of work but nothing much gets accomplished in the long run.  Lean governance, on the other hand, is focused on enabling people and motivating them to do the right things.  A lean data governance approach promotes a healthy, collaborative relationship between data professionals and the teams that they're supporting.
**
**
