---
author: 'Ikenna Okpala'
comments: true
date: 2007-07-03 16:57:00
layout: post
slug: a-c-i-d-model
title: A.C.I.D MODEL
wordpress_id: 14
categories:
- DATABASE
---

The ACID model has been a crucial aspect of database modeling and theory for a very long time.
It  revolves around four  objectives that every database management system must strive to achieve, these are:

  * **Atomicity (A).****
**
  * **Consistency (C).**
  * **Isolation (I).**
  * **Durability (D)**.

<!--more-->
**Atomicity  **stipulates that database transactions must follow an all or nothing rule.Each transaction is said to be atomic.If one part of the transaction fails, the entire transaction fails.This is easy to do because of the singular purpose served by the transaction. This is also referred to as the "all or nothing" approach. It is critical that the database management system maintain the atomic nature of transactions in spite of any DBMS, operating system or hardware failure.

**Consistency **states that only valid data will be written to the database. If, for some reason, a transaction is executed that violates the database’s consistency rules, the entire transaction will be rolled back and the database will be restored to a state consistent with those rules. On the other hand, if a transaction successfully executes, it will take the database from one state that is consistent with the rules to another state that is also consistent with the rules. To help out with this, we use rules, keys, normalization, etc all help to maintain data integrity. All of these things combined helps to ensure our data always exists in a consistent state.

**Isolation**  occurs when transactions to your data must be isolated from other concurrent transactions. No concurrent transaction (Transaction A) should see any data being modified by anotheroncurrent transaction (Transaction B) while it is in an intermediate state. Transaction A should see the data as it existed prior to being modified by Transaction B, or after Transaction B has completed and committed its changes. it requires that multiple transactions occurring at the same time not interrupting each other’s execution. For example, if  Mr. A issues a transaction against a database at the same time that Mr. B  issues a different transaction, both transactions should operate on the database in an isolated manner. The database should either perform Mr. A ’s entire transaction before executingMr. B ’s or vice-versa.This prevents Mr. A ’s transaction from reading intermediate data produced as a side effect of part of Mr. B ’s transaction that will not eventually be committed to the database. Note that the isolation property does not ensure which transaction will execute first, merely that they will not interfere with each other.

**Durability**  after ("all said and done") a transaction has successfully completed and committed it changes, the data is permanently in place in the database, even in the event of hardware or software failures. Durability is ensured through the use of database backups and transaction logs that facilitate the restoration of committed transactions in spite of any subsequent software or hardware failures.
