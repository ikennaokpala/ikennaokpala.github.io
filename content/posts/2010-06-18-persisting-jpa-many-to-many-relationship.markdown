---
author: 'Ikenna Okpala'
comments: true
date: 2010-06-18 16:13:43
layout: post
slug: persisting-jpa-many-to-many-relationship
title: Persisting many to many Relationship (JPA and Spring Strategy)
wordpress_id: 313
categories:
- DATABASE
- JAVA
- JSF
- NETBEANS
- PRIMEFACES
- SPRING
- WICKET
---

This post is inspired by the ["Netbeans Generate Entity Class From Database" ](http://wiki.netbeans.org/TS_65_Entity_Classes_From_Database)feature which literally spits out vanilla JPA Entity classes for you while you have some coffee. For many to many relationship types Netbeans reads and generates an JPA Entity class for the join table and an extra class which holds the Primary key values for the two tables involved in a many to many relationship. This class is annotated with the @Embeddable JPA annotation. This i found very cool.

In this post i would like to show how to persist data from the respective tables to the join table.

<!--more-->
The database create statement for the chosen table goes as follows:

[![](http://ikennaokpala.files.wordpress.com/2010/06/m_m1.png?w=300)](http://ikennaokpala.files.wordpress.com/2010/06/m_m1.png)


{% highlight sql %}
create table Author (author_id int(10) not null auto_increment, name varchar(55) not null, email varchar(55) not null, primary key (author_id));
create table Book (book_id int(10) not null auto_increment, name varchar(55) not null, publisher varchar(55) not null, primary key (book_id));
create table Author_Book (author_id int(10) not null, book_id int(10) not null, primary key (author_id, book_id));
alter table Author_Book add index FKAuthor_Boo670752 (author_id), add constraint FKAuthor_Boo670752 foreign key (author_id) references Author (author_id);
alter table Author_Book add index FKAuthor_Boo981679 (book_id), add constraint FKAuthor_Boo981679 foreign key (book_id) references Book (book_id);
{% endhighlight %}

Netbeans generates the following for you.. No skin pain :)

Class Author Entity


{% highlight java %}
@Entity
@Table(name = "Author")
@NamedQueries({
    @NamedQuery(name = "Author.findAll", query = "SELECT a FROM Author a"),
    @NamedQuery(name = "Author.findByAuthorId", query = "SELECT a FROM Author a WHERE a.authorId = :authorId"),
    @NamedQuery(name = "Author.findByName", query = "SELECT a FROM Author a WHERE a.name = :name"),
    @NamedQuery(name = "Author.findByEmail", query = "SELECT a FROM Author a WHERE a.email = :email")})
public class Author implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "author_id")
    private Integer authorId;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;

    public Author() {
    }

    public Author(Integer authorId) {
        this.authorId = authorId;
    }

    public Author(Integer authorId, String name, String email) {
        this.authorId = authorId;
        this.name = name;
        this.email = email;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (authorId != null ? authorId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Author)) {
            return false;
        }
        Author other = (Author) object;
        if ((this.authorId == null && other.authorId != null) || (this.authorId != null && !this.authorId.equals(other.authorId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.testing.jsf.Author[authorId=" + authorId + "]";
    }

}
{% endhighlight %}

Class For Book Entity..


{% highlight java %}
@Entity
@Table(name = "Book")
@NamedQueries({
    @NamedQuery(name = "Book.findAll", query = "SELECT b FROM Book b"),
    @NamedQuery(name = "Book.findByBookId", query = "SELECT b FROM Book b WHERE b.bookId = :bookId"),
    @NamedQuery(name = "Book.findByName", query = "SELECT b FROM Book b WHERE b.name = :name"),
    @NamedQuery(name = "Book.findByPublisher", query = "SELECT b FROM Book b WHERE b.publisher = :publisher")})
public class Book implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "book_id")
    private Integer bookId;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "publisher")
    private String publisher;

    public Book() {
    }

    public Book(Integer bookId) {
        this.bookId = bookId;
    }

    public Book(Integer bookId, String name, String publisher) {
        this.bookId = bookId;
        this.name = name;
        this.publisher = publisher;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bookId != null ? bookId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Book)) {
            return false;
        }
        Book other = (Book) object;
        if ((this.bookId == null && other.bookId != null) || (this.bookId != null && !this.bookId.equals(other.bookId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.testing.jsf.Book[bookId=" + bookId + "]";
    }

}
{% endhighlight %}

Class for the join Table Author_Book


{% highlight java %}
@Entity
@Table(name = "Author_Book")
@NamedQueries({
    @NamedQuery(name = "AuthorBook.findAll", query = "SELECT a FROM AuthorBook a"),
    @NamedQuery(name = "AuthorBook.findByAuthorId", query = "SELECT a FROM AuthorBook a WHERE a.authorBookPK.authorId = :authorId"),
    @NamedQuery(name = "AuthorBook.findByBookId", query = "SELECT a FROM AuthorBook a WHERE a.authorBookPK.bookId = :bookId")})
public class AuthorBook implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected AuthorBookPK authorBookPK;

    public AuthorBook() {
    }

    public AuthorBook(AuthorBookPK authorBookPK) {
        this.authorBookPK = authorBookPK;
    }

    public AuthorBook(int authorId, int bookId) {
        this.authorBookPK = new AuthorBookPK(authorId, bookId);
    }

    public AuthorBookPK getAuthorBookPK() {
        return authorBookPK;
    }

    public void setAuthorBookPK(AuthorBookPK authorBookPK) {
        this.authorBookPK = authorBookPK;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (authorBookPK != null ? authorBookPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AuthorBook)) {
            return false;
        }
        AuthorBook other = (AuthorBook) object;
        if ((this.authorBookPK == null && other.authorBookPK != null) || (this.authorBookPK != null && !this.authorBookPK.equals(other.authorBookPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.testing.jsf.AuthorBook[authorBookPK=" + authorBookPK + "]";
    }

}
{% endhighlight %}

Below we have the class that holds the primary key values of the participating tables, also generated for you by netbeans:


{% highlight java %}
@Embeddable
public class AuthorBookPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "author_id")
    private int authorId;
    @Basic(optional = false)
    @Column(name = "book_id")
    private int bookId;

    public AuthorBookPK() {
    }

    public AuthorBookPK(int authorId, int bookId) {
        this.authorId = authorId;
        this.bookId = bookId;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) authorId;
        hash += (int) bookId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AuthorBookPK)) {
            return false;
        }
        AuthorBookPK other = (AuthorBookPK) object;
        if (this.authorId != other.authorId) {
            return false;
        }
        if (this.bookId != other.bookId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.testing.jsf.AuthorBookPK[authorId=" + authorId + ", bookId=" + bookId + "]";
    }

}
{% endhighlight %}

At this point in order to persist, we require a component, service and repository (DAO) objects to do this.
For the view component, what ever is your web framework of choice, be it jsf, spring mvc, gwt or wicket, etc all you need to do is inject the service and call the respective method for saving that you have defined in your service object. the below is based on JSF.

Note: at this point you need to persist both sides of the divide at the same time (the join table entity in this case AuthorBook and anyone of the participating sides). For the AuthorBook Entity you instantiate the constructor for the join table entity class that accepts the ids of the participating table (for this example this is achieved by passing to the constructor the get method for retrieving the ids for the participating tables for the join table.) Like this


{% highlight java %}

authorBookService.save(new AuthorBook(book.getBookId(), author.getAuthorId())); {% endhighlight %}

The code for this goes as follows:


{% highlight java %}
@Component
@Scope("request")
public class ComponentBean implements Serializable {

    private AuthorBook authorbook = new AuthorBook();
    private Author author = new Author();
    private Book book = new Book();
    private AuthorService authorSerivce;
    private AuthorBookService authorbookSerivce;

    @Autowired
    public ComponentBean(AuthorService authorSerivce, AuthorBookService authorbookSerivce) {
        this.authorSerivce = authorSerivce;
        this.authorbookSerivce = authorbookSerivce;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }
public void setAuthorbook(AuthorBook authorbook) {
        this.authorbook = authorbook;
    }
 public AuthorBook getAuthorbook() {
 return authorbook;
 }

 public void setBook(Book book) {
 this.book = book;
 }
public Book getBook() {
        return book;
    }
public void save(ActionEvent actionEvent) {
 authorService.save(author);
 authorBookService.save(new AuthorBook(book.getBookId(), author.getAuthorId())); // you instantiate the constructor for the join table entity  class and pass it the get method for retrieving the ids for the participating tables for the join table

 }
}
{% endhighlight %}

Service interface to define the the save operation:


{% highlight java %}
public interface AuthorBookService {

public void save(AuthorBook authorBook);
}
{% endhighlight %}

Next the implementation for the AuthorBookService Service Interface:


{% highlight java %}

@Service("authorBookService")
public AuthorBookServiceImpl implements AuthorBookService  {
private AuthorBookDAO authorbookdao;
@Autowired
public ModelServiceImpl(AuthorBookDAO authorbookdao) {
        this. authorbookdao = authorbookdao;
    }
    @Transactional
    public void save(AuthorBook authorBook) {
        authorbookdao.persist(AuthorBook authorBook);
    }
}
{% endhighlight %}

The Data Access object interface:


{% highlight java %}
public interface AuthorBookDAO {

public void persist(AuthorBook authorBook);
}
{% endhighlight %}

The Data Access object implementation proper:


{% highlight java %}
@Repository
public class AuthorBookDAOImpl implements ModelDAO {

    @PersistenceContext
    protected EntityManager entityMgr;

    public EntityManager getEntityMgr() {
        return entityMgr;
    }

    public void setEntityMgr(EntityManager entityMgr) {
        this.entityMgr = entityMgr;
    }

    public void persist(AuthorBook authorBook) {

      this.entityMgr.persist(authorBook)

    }
}
{% endhighlight %}

Note: the service and repository for Author and Book will follow the same pattern. See the my previous blog post for more hints.. Ciao for now..
