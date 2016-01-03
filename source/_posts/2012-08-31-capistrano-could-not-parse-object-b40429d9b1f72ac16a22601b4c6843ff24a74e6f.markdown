---
author: 'Ikenna Okpala'
comments: true
date: 2012-08-31 02:36:31
layout: post
slug: capistrano-could-not-parse-object-b40429d9b1f72ac16a22601b4c6843ff24a74e6f
title: Capistrano – Could not parse object "b4042..."
wordpress_id: 1470
categories:
- CAPISTRANO
- RUBY
---

The above titled error gave a friend some troubles.

The thing is that we found out that Capistrano was failing because apparently it had lost track of the commit SHA, hence the error message:

<!--more-->

"Could not parse object ’b4042...′"

We found deleting the “cached-copy” inside the shared directory, to have made this go away at least for now.

 
