---
author: 'Ikenna Okpala'
comments: true
date: 2007-07-20 14:46:00
layout: post
slug: database-modelling-using-normalization
title: DATABASE MODELLING USING NORMALIZATION
wordpress_id: 16
categories:
- DATABASE
---

**Key purposes of normalization are as follows:**
****
1. Avoid duplication of data in your data structure.

2. Avoid redundancy of data in your data structure.

**A PRACTICAL APPROACH TO NORMALIZATION**
****
1. List all attributes (from forms, files, reports collected during system analysis and design).
<!--more-->

2. Group all related attributes to create entities.

3. Introduce primary key to each entity to enforce uniqueness.

4. Relate entities introducing foreign key – introducing data integrity.

Hint: degrees of relationship.Break down many-to-many into 2 one-to-many relationships.

5. Further extract related attributes to create new entities.

6. Repeat 3 to 5 until cannot extract related attributes (you are at the 3rd normal form).

_**ALWAYS REMEMBER:**_
Database models are driven by the business process ,the forms, reports and files collected during system analysis.

Watch out for business rules and processes, could lead to new entity creation and/or look-up tables or static data.
