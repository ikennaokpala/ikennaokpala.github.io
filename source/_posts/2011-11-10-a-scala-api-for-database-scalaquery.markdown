---
author: 'Ikenna Okpala'
comments: true
date: 2011-11-10 01:37:56
layout: post
slug: a-scala-api-for-database-scalaquery
title: A Scala API for database proceedings (ScalaQuery)
wordpress_id: 907
categories:
- DATABASE
- JVM
- SCALA
---

Back in the days making calls or connections to a database with jdbc took this much:

(Below is an excerpt code i wrote in 2005... :()


<!--more-->
{% highlight java %}
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "dblocal";
String driver = "com.mysql.jdbc.Driver";
String user = "dbuser";
String pass = "dbuser";
try {
  Class.forName(driver);
  con = DriverManager.getConnection(url + db, user, pass);
  System.out.println("jdbc driver for mysql : " + driver);
  System.out.println("Connection url : " + url + db);
  System.out.println("Connection is established...");
  con.close();
  System.out.println("Connection is closed...");
} catch (Exception e) {
System.out.println(e);
}
{% endhighlight %} 
The level of abstraction here is very low.
Then came ORM's with some abstraction but also giving us leaving us with the mountain to climb whilst leaving us with the [vietnam war of the impedance mis-match.](http://www.codinghorror.com/blog/2006/06/object-relational-mapping-is-the-vietnam-of-computer-science.html)

 The capability of OOP (imperative) programming languages to tackle  high-level concepts like relational algebra has been questioned, this obviously has given room for Functional programming languages to shine.

One of such i recently have found within the JVM space is [ScalaQuery](http://scalaquery.org). I stumble across [this](http://scalaquery.org/doc/ScalaQuery_Commerzbank_2011.pdf) on twitter, and began to look closer, though being a Scala fan and community member i had heard of ScalaQuery in it's early days, but did not take any real interest.

With the API in question connection to a database is more concise with named/default arguments (parameters) from scala land:

{% highlight scala %}
import org.scalaquery.session._
import org.scalaquery.session.Database.threadLocalSession

val db = Database.forURL(
  "jdbc:mysql://localhost:3306/",
  driver = "com.mysql.jdbc.Driver",
  user="dbuser",
  password="dbuser"
)
{% endhighlight %}

ScalaQuery takes a better object oriented approach when mapping objects to tables:


{% highlight scala %}
import org.scalaquery.ql.extended.{ExtendedTable => DBTable}
import org.scalaquery.ql.TypeMapper._
import org.scalaquery.ql._

case class Country (id:Int, name:String)
val Country = new DBTable[(Int, String)]("countries") {
    def id = column[Int]("id", O.NotNull, O.PrimaryKey, O.AutoInc)
    def name = column[String]("name", O.NotNull, O.DBType "varchar(50)")
    def * = id ~ name
  }

OR

object country extends new DBTable[(Int, String)]("countries") {
    def id = column[Int]("id", O.NotNull, O.PrimaryKey, O.AutoInc)
    def name = column[String]("name", O.NotNull, O.DBType "varchar(50)")
    def * = id ~ name
  }


{% endhighlight %}

Now one of the uses of case classes i love the most is using it as a value object, because with a case class we get the equals, hash and toString methods for free.


{% highlight scala %}
case class Country (id:Int, name:String)
val countries = List(
    Country(1, "Nigeria"),
    Country(2, "United Kingdom"),
    Country(3, "United States of America"),
    Country(4, "Canada"),
    Country(5, "France"),
  )

{% endhighlight %}

With the above playing with a dataset from the database becomes fun, as scala provides a collection library that is pack with goodness..

The following Query with for comprehensions.


{% highlight scala %}
val nigeria = for {c <- countries if c.id == 1}yield c.id ~ c.name
{% endhighlight %}

happy days... only now i have to look for some project to use it in.

[ScalaQuery Slides 2011 by Stefan Zeiger](http://ikennaokpala.files.wordpress.com/2011/11/scalaquery_commerzbank_2011.pdf)
