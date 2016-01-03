---
author: 'Ikenna Okpala'
comments: true
date: 2011-01-03 03:31:05
layout: post
slug: converting-java-list-to-scala-list
title: Converting Java List to Scala List
wordpress_id: 725
categories:
- SCALA
---

I am currently playing around with some legacy Java libraries and at some point i needed to convert a Java List to a Scala List, because, i have come to prefer using Scala's very rich set of functions like filter(), find(), foreach(), foldLeft(), flatMap() and map(), which are very handy and concise. :)

As you may know already or according to the documentations,  [Java's List is an interface](http://download.oracle.com/javase/1.4.2/docs/api/java/util/List.html) which is conceptual or abstract in nature, while Scala's List is an implementation of a sequence of elements that follow insertion order and do allow random access to elements within.

<!--more-->

I mostly have used Java's ArrayList, as they are mutable via the add(e) method which alters the existing contents of the list and has constant-time random access.

Scala's List is an explicit implementation of a sequence. It is imported by default into scope as an immutable linked list i.e.  it's state cannot be modified after it has been instantiated and operations requiring random access take linear time.

Based on the above Scala's List is not similar to Java's List or ArrayList and as such can't serve as a replacement for them.

After a little while on the REPL and going through documentations:


{% highlight bash %}

scala> var jList = new java.util.ArrayList[String]()
jList: java.util.ArrayList[String] = []

scala> jList.add("Ikenna"); jList.add("okpala"); jList.add("kengimel"); jList.add("Scala"); jList.add("Java")

scala> println(jList)
[Ikenna, okpala, kengimel, Scala, Java]

scala> val slist = scala.collection.JavaConversions.asBuffer(jList)
slist: scala.collection.mutable.Buffer[String] = Buffer(Ikenna, okpala, kengimel, Scala, Java)

scala> println(slist.toList)

List(Ikenna, okpala, kengimel, Scala, Java)            #However, i noticed that this implicitly converts the Java List  to a mutable buffer, as you may have noticed on line 12, i used the toList function to convert it to a Scala List.

scala> println(jList)
[Ikenna, okpala, kengimel, Scala, Java]


{% endhighlight %}
One of Scala's goal is to make code as concise and functional as possible. Included in Scala 2.8 library are already baked Java to Scala conversions.
These implicit functions are found in the scala.collection.JavaConversions package to assist the conversion of Java's List to Scala.List. All that is required is importing this package into scope and you are already benefiting from these silent actors.


{% highlight scala %}
import scala.collection.JavaConversions._
{% endhighlight %}
Also in this mode, i observed that this converts the Java List  to a Buffer (i.e. scala.collection.mutable.Buffer) that extends Seq[A], as you may have noticed on line 12 above, i used the toList function to convert it to a proper Scala List, this may be an option that you may consider in your program.

Prior to Scala 2.8 version(2.7.*) this was achieved by an implicit conversion:


{% highlight scala %}

implicit def toScalaListFromJavaList[T](jList: java.util.List[T]) : Seq[T] =
new BufferWrapper[T]() { def underlying = jList }

{% endhighlight %}

There appears to be more grounds to cover, feel free to provide your views on this post.

CIAO for now.


