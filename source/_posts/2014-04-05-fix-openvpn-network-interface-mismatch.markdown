---
author: 'Ikenna Okpala'
comments: true
date: 2014-04-05 04:35:09
layout: post
slug: fix-openvpn-network-interface-mismatch
title: Fix OPENVPN Network Interface Mismatch
published: true
categories:
- OPENVPN
- VPN
tags:
- OPENVPN
- VPN
---

Getting VPN clients-to-server connected should be a piece of cake right. Simply dropping the client.conf (.ovpn) file and certificates (i.e crt and .key files) in the /etc/openvpn directory should do the trick.

Today, after a bit of housekeeping on my client box, connecting to the OPENVPN server seemed a big ask.

{% codeblock openvpn lang:bash %} 
  $: service openvpn restart
  Stopping virtual private network daemon:/etc/init.d/openvpn: 98: kill: No such process

   client server.
  Starting virtual private network daemon: client server.
  Stopping virtual private network daemon:/etc/init.d/openvpn: 98: kill: No such process

   client server.
 {% endcodeblock %}
<!--more-->
After a bit of debugging the VPN client.conf: 

{% codeblock openvpn lang:bash %}
	openvpn --config client.conf
{% endcodeblock %}

The result were as follows: 

{% codeblock error lang:bash %}
  OPTIONS IMPORT: timers and/or timeouts modified
  OPTIONS IMPORT: --ifconfig/up options modified
  OPTIONS IMPORT: route-related options modified
  Note: Cannot ioctl TUNSETIFF tap0: Device or resource busy (errno=16)
  do_ifconfig, tt->ipv6=0, tt->did_ifconfig_ipv6_setup=0
  /sbin/ifconfig  198.xxx.xxx.xxx netmask 255.255.254.0 mtu 1500 broadcast 198.xxx.xxx.xxx
  SIOCSIFADDR: No such device
  : ERROR while getting interface flags: No such device
  SIOCSIFNETMASK: No such device
  SIOCSIFMTU: No such device
  S  IOCSIFBRDADDR: No such device
  : ERROR while getting interface flags: No such device
  Linux ifconfig failed: external program exited with error status: 255
  Exiting
{% endcodeblock %}

As you may have observed above the network interface appeared to be busy or take over by some other service or simply not available.

{% codeblock brctl lang:bash %} 
	$: brctl show
	bridge name	bridge id		STP enabled	interfaces
vmbrx		xxxxxxxx			no		ethx
vmbry		xxxxxxxx			no		ehtx
										tap0
{% endcodeblock %}

A query on the available network interfaces on the client showed that tap0 was actually available but already taken up.

A way of getting the vpn client to reconnect without interupting the activity on tap0 is to create up.sh and down.sh just for the VPN client, having them to use another tap interface.

{% codeblock up-client.sh lang:bash %} 
	#!/bin/sh
	/sbin/ifconfig vmbrx promisc
	/sbin/ifconfig tapxx up promisc
	/sbin/brctl addif vmbrxx tapxx
{% endcodeblock %}

{% codeblock down-client.sh lang:bash %} 
	#!/bin/sh
	/sbin/brctl delif vmbrxx tapxx
	/sbin/ifconfig tapxx down -promisc
	/sbin/ifconfig vmbrxx -promisc
{% endcodeblock %}

Now on testing the VPN client connection again all should be well.
