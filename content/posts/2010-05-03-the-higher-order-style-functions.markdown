---
author: 'Ikenna Okpala'
comments: true
date: 2010-05-03 23:47:31
layout: post
slug: the-higher-order-style-functions
title: The Higher Order Style.. (Functions)
wordpress_id: 131
categories:
- JAVA
- JVM
- SCALA
---

These past days have been a revealing period, as i wondered into [Scala](http://scala-lang.org) land to behold it's features that have made it such a hot topic....

My background in programming is largely imperative.. until earlier this year when i started  trying out some functional programming languages (Haskell, F#, Scala.. etc).

<!--more-->
One feature of functional languages that i found very interesting were Higher Order Functions.

Higher order functions are notably a vital part, if not the most important part of functional languages.

A higher order function  accepts a function as a parameter or can return  a function back.

An example:

In an imperative language like JAVA looping through characters to find a lowercase value could be:

{% highlight java %}

private boolean hasLowerCase = false;
for(int i = 0; i = title.length(); i++){
if (Character.isLowerCase(title.charAt(i))){
hasLowerCase = true;
break;
}
}

{% endhighlight %}


In [Scala](http://scala-lang.org) this can be achieve thus:

{% highlight scala %}

val hasLowerCase = title.exists(_.isLowerCase)
or
val hasLowerCase = title.exists(title => title.isLowerCase)

{% endhighlight %}


In [Scala](http://scala-lang.org) this is possible because [Scala](http://scala-lang.org) functions are values, this means you can take a function and explicitly set it to a variable.

{% highlight scala %}

val areaOfTriangle = (l:Int, b:Int) => l * b / 2
areaOfTriangle(2,3) = 3


{% endhighlight %}


This qualifies it to be passed as a parameter to another function.

[Scala](http://scala-lang.org) allows it's users to define and use Higher order functions, this as shown makes code concise, putting to good use higher levels of abstractions, which to me is awesome:

In [Scala](http://scala-lang.org) playing or looping through Lists appears to be trivial as shown below:

{% highlight scala %}


List(3.5, 2.5, 1.5).map((a:Double) => a * 2)
or
List(3.5, 2.5, 1.5).map(a => a * 2)
or
List(3.5, 2.5, 1.5).map(_* 2)

{% endhighlight %}

Above the code multiplies the members of the List by 2.. The last two functions rely on the implicit typing capability of the [Scala](http://scala-lang.org) language. This makes the code even less noisy, gives us little to type and gives a similar feel of regular dynamic scripting language as the compiler does all the hard work of type inferencing.

Programming with higher order functions, like the `map or exists function makes it;`




  * Expressively clear, ease to grasp what the program does and the intention of the programmer.


  * Functions that accept Functions as arguments are more reusable than other functions.


  * Higher order function gives us the needed syntactic sugar to build big functionalites out of tiny bits of code.


