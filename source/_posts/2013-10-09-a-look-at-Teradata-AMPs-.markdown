---
author: 'Ikenna Okpala'
comments: true
date: 2013-10-09 02:22:18
layout: post
slug: a-look-at-teradata-amps
title: A Look At Teradata AMPs
published: true
categories:
- TERADATA
- DATABASE
- BIG DATA
tags:
- DATABASE
- BIG DATA
- TERADATA
---

If you are from a music background and may be reading/hearing this for the first time, then 'NO', this article is not about measuring the change over individual spatial periods (sound amplification).

This article 'YES' seeks to share my own notes on Teradata's Access Module Processor or AMP for short.

AMP is a Virtual processor that exist within the confines of the parallel-processing environment of the Teradata Database.
<!--more-->

AMP manages communication through Boardless BYNET interface, performs database (Output data conversion, Manage Disk space, Accounting, Journaling, Locking, Joining, Sorting, Agreegation) disk subsytem manipulation and database file subsytem task management.

An individual AMP instance within teradata takes charge of access and manipulation of data. In this respect, an AMP is allocated a portion of the database as an area of operation, this includes physical disk for storing its tables. Teradata's AMP acquires some space in the disk through its association with a virtual disk (vdisk).

This then allows it to read and write to disk, these then make-up the AMP steps to physical blocks of data that were queried. It takes handles the accessing, processing and manipulation of the data. More than one AMP may exist in one node, communicating with themselves through BYNET.

AMPs offers basic SQL query parallelism to data blocks/jobs in Teradata. The parallel processing through occurs after, Teradata has pre-defined the number of AMP nodes be used. This is highly influenced by indexes and how many data blocks that can be derived from the query.

Teradata divides these to the defined AMPs using hash functions to enable subquery-level parallel processing.

Base on this teradata's query transaction executes in a parallel manner across the defined AMPs, with associated chunks of data processed independently though in a simultaneous manner.

