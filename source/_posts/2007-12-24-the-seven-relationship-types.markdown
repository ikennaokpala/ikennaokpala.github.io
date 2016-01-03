---
author: 'Ikenna Okpala'
comments: true
date: 2007-12-24 14:34:00
layout: post
slug: the-seven-relationship-types
title: The Seven Relationship Types.
wordpress_id: 29
categories:
- DATABASE
- JPA
---

Seven types of relationships can exist between entity beans. There are four types of cardinality: one-to-one, one-to-many, many-to-one, and many-to-many. In addition, each relationship can be either unidirectional or bidirectional. These options seem to yield eight possibilities, but if you think about it, you'll realize that one-to-many and many-to-one bidirectional relationships are actually the same thing. Thus, there are only seven distinct relationship types.
<!--more-->

To understand relationships, it helps to think about some simple examples:

One-to-one unidirectional

One-to-one bidirectional

One-to-many unidirectional

One-to-many bidirectional

Many-to-one unidirectional

Many-to-many unidirectional

Many-to-many bidirectional

Note that these relations represent the navigability of your domain model.

Once again, the associations defined in the metadata represent the domain object navigation only.
