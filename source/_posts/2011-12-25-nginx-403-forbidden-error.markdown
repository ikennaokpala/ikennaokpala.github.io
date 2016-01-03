---
author: 'Ikenna Okpala'
comments: true
date: 2011-12-25 01:27:18
layout: post
slug: nginx-403-forbidden-error
title: 'Nginx: 403 Forbidden (Error)'
wordpress_id: 1020
categories:
- BASH
- NGINX
- UNIX
---

{% highlight bash %}
2011/12/25 21:07:03 [error] 23#0: *2 directory index of "/path/to/public/" is forbidden, client: 8.1.7.22, server: xxx.com, request: "GET / HTTP/1.1", host: "xxx.com"
{% endhighlight %}

This is not the first time i hit this kinda error and i go ok i will check my permissions settings.

<!--more-->
And Oops!, that does not seem to be the issue. Then i go ok need to check and modify access rights of the user www-data and group www-data in the nginx.conf. But No!.

An then as usual i go hunting in the dark not knowing what i am really up against. For me this happens.. :(

But in this case i was shocked to  find out that the actual issue was with the mod passenger definition in the various conf files i had created.

I came to realise that i was configuring the very wrong way:

This appears not to work.

{% highlight bash %}
server {
  listen 80;
  server_name xxx.com;
  access_log  /var/log/access.log;
  passenger_enabled on;

  location / {
    root /path/to/public;
    index index.html index.htm;
  }
}
 or
server {
    listen 80 default;
    server_name localhost;
    location / {
        root /usr/share/nginx/html/;
        expires 1d;
    }
}
{% endhighlight %}

While this seems right:
{% highlight bash %}
server {
  listen 80;
  server_name xxx.com;
  access_log  /var/log/access.log;
  passenger_enabled on;
}

{% endhighlight %}
