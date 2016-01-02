---
author: 'Ikenna Okpala'
comments: true
date: 2013-04-03 15:44:38
layout: post
slug: fix-ubuntu-virtual-box-windows-full-screen-problem
title: Fix ubuntu virtual box (windows) full screen problem
wordpress_id: 1528
categories:
- UBUNTU
- VIRTUAL-BOX
- VIRTUAL-MACHINES
tags:
- UBUNTU
- VIRTUAL-BOX
---

NOTE the 4.2.0 version of virtual box does not support the 3d graphic libraries for 12.11

You need to download the latest guest additions iso from here http://download.virtualbox.org/virtualbox/

<!--more-->
Secondly mount it on by clicking Devices -> CD/DVD Devices and then run the installation process.

After this restart and your VM should be able to render in full screen mode properly.
