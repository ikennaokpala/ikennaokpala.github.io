---
author: 'Ikenna Okpala'
comments: true
date: 2009-08-02 16:58:16
layout: post
slug: in-my-brain-what-are-semantic-web-services
title: (In my brain) What are Semantic Web Services ?
wordpress_id: 1160
categories:
- RDF
- SOA
- SOAP
- WEB SERVICES
- WSDL
---

#### INTRODUCTION


This report seeks to evaluate the extent to which basic service standards for the web have been used. The content within will serve as a  microscope for the following:


  * How basic web service standards like XML implement a service-oriented architecture (Part One).

<!--more-->

  * How software agents and semantic web technology are used within an industry application (Part Two).


  * How web service standards have supported communication with enterprise applications (Part Three).




#### PART ONE


Services are independent modules that are represented in an application environment in a collective manner. SOA’s design gives rise to making of loosely coupled components of business functionality that come together through a common compliance to a standard communications framework.  The most popular type of service is the XML Web service.

XML Web services has two basic requirements:




  * Communication via HTTP (i.e. interaction via internet protocols).


  * Data exchange format in XML documents (i.e. sending and receiving messages in XML format).


The SOA design framework advocates the encapsulation of application logic inside the services interacting through a common communication protocol. A search on Google for SOA appears to favour XML based Web services, which is founded on the established XML technology strata and disclosing application logic as loosely coupled services.

Based on this model, SOA backs the use of a discovery mechanism for services via a service broker or discovery agent (Thomas E., 2004).

Under SOA, xml serves as the data delivery format inside applications. XML documents take data that come from within and between the various layers of a multi-tiered architecture.

In addition, the ability to transform XML documents from disparate application data sources into multiple formats for output has served as a key part of modern XML architectures such as XSLT.

[![](http://ikennaokpala.files.wordpress.com/2012/01/soa.png?w=300)](http://ikennaokpala.files.wordpress.com/2012/01/soa.png)

Diagram 1: Web standards Interaction

Source: [http://fgamedia.org/faculty/rdcormia/COIN83/lesson06.htm](http://fgamedia.org/faculty/rdcormia/COIN83/lesson06.htm)

Another XML-based technology is Web Services Description Language (WSDL). This defines Web services interfaces, data and message types, interaction patterns, and protocol mappings.

WSDL within a SOA context is used in conjunction with SOAP and XML Schemas. This provides web services via Internet protocols.

In the SOA context, Simple Object Access Protocol (SOAP) defines an envelope for Web services communication that can be mapped to several transports including HTTP.

It makes available a serialization format for sending XML documents through a network and a pretty convention for defining RPC interactions (E. Newcomer, 2002).

However, main the web service specifications (SOAP, WSDL, UDDI, etc.) were built to serve as mechanisms on their own for defining how independent web services can connect to sustain reliability of business solutions with the appropriate level of complexity. This is according to sources was the birthroots of BPEL.

BPEL for instance is how web service specifications can be amplified to standardize web application to web application integration and also extend integration legacy systems (H. Lausen et al, 2005).

In addition it serves as the foundation for building workflow systems and modelling of business processes. The fundamental way of describing a web service using WSDL is in essence very stateless, defining how an operation could be invoked (or the expected form of a message or document).

This doesn’t say anything about the aftermath of the operation, or in what order the series of operations can be arranged to get things running as expected. For describing long running business processes which bond together (orchestrate) a number of services, require a higher-level language such as BPEL.

For instance, purchasing products online may involve a long running process, which could connect with a several of service providers:




  * Searching, browsing and selecting items to basket


  * Obtaining or retrieving customer information an instance of this is with the evolving social commerce where service consumers can obtain customer data from social networks (e.g.: Facebook, but these are REST based though).


  *  Obtaining and verifying credit card details from credit card service providers.


  *  Sending notification and invoice via emails.


  * Delivery of goods in warehouses and generating one or more orders for posting.


  *  Shipping orders via a Delivery Company, e.g.: Royal Mail etc.




#### PART TWO


On websites natural languages is the main form of representing information e.g. English, Chinese or Turkish. Computers are not aware of how to parse and use this kind of data sensibly. Amongst the goals of the semantic web are having the potential to find and access web sites and web resources not only with keywords or sensible defaults like checking the files extension of images and files just like what search engines bots do e.g.: Google, Yahoo and Bing. The desire is to be able to describe their forms, contents and capabilities.

For instance, a person that has a mobile phone or any digital device (like an iPad) that is aware of certain default settings set by the user of the device and the device stores knowledge through utilization history and is capable of combining this local understanding with remote services such as online flight services, privacy preferences, dietary rules, medical conditions and time management settings etc.

With software agents having this innate capacity, with intelligence and mobility, they can implicit or explicitly move from one website site to another, with their password, ssh keys, codes, data, running states, and intelligence and fulfill their task on their own very smartly.

In addition, web-services very much still need human's input and cognition during their execution. In the e-commerce sector, to buy items from an online shop, the user needs to register and which involves clicking a button to accomplish this task. In another way, the user may decide to send a HTTP request to the service URL with the required encoded form field parameters.

Both ways still require human cognition of what information is needed to run the service and to interpret the information the service returns.

With the emergence of semantic markup, web services have the ability to execute services via a declarative and computer interpretable Application Programming Interface (API). Semantic markup informs the software agent of the input required, what response to expect, and how it should potentially execute and communicate with the service (S. McIlraith , 2001).

In addition, ontology serves as interactions for different agents and improves the quality of the service rendered by every agent. The web ontology language (OWL) is defined for implementation by software applications that are required to process data rather than presenting it to humans.

A resource description framework (RDF) is a data framework for resources (or object in their own rights) and affiliations between them. RDF provides semantics for data, and the data models can be defined in XML format and queries with XPath if required.

In order to use these technologies, an e-commerce industry can have many layers with a semantic Intelligence stratum within enabling knowledge description and knowledge access via ontology.




  * The web services stratum makes sure that resources are dynamically discovered and integrated. Compliance to web services standards will give the online buyers or the software agents that represent them, the capability to distribute data and use functionality from other applications in a multi-domain, multi-technology, heterogeneous environment in a dynamic manner.




  *  An Agent layer will assist in dealing with security, privacy, negotiation, personalization and web service procurement issues as they arise.



[![](http://ikennaokpala.files.wordpress.com/2012/01/wcss.jpg?w=300)](http://ikennaokpala.files.wordpress.com/2012/01/wcss.jpg)

Diagram 2: E-Commerce Software Agent interaction Diagram


#### PART THREE


For an e-commerce industry to adopt and use semantic web services, the accepted XML standards for interoperating web services doesn’t define not the semantic meaning of messages but provides specification for only syntactic interoperability.

WSDL for instance has the capability to define the available operations via a web service, data structure and the messages sent and received. It lacks capability of interpreting the semantic meaning or constraints of the data.

Programmers are required achieve specific agreements on the interaction of web services and makes automatic web service composition difficult. Semantic web services helps to resolve this by provision of another layer above the web service infrastructure to provide semantic meaning for web services. A number of semantic web languages exist today examples are RDF, WSML, OWL, SPARQL and OIL.

UDDI and WSDL are perfectly suited for semantic web technology. Further more, SOAP can utilize, remote RDF queries and updates, RDF payloads to connect and interface with the rules engines for a semantic web application (P. Alesso, 2004).

UDDI can however extend semantic discovery via the following:




  * By storing the semantic annotation of web services in the existing structures of UDDI.


  * And making available an interaction interface to create the queries that will use that semantic annotation of web services (K. Sivashanmugam et al, 2006).


For Ecommerce, when an online buyer is searching for a product item to buy, it should be possible to independently find the relevant service with its meaning, with out knowing what it name or what language it belongs to and who company or service provider is.

As earlier stated WSDL can’t provide semantic information but it can utilize OIL and DAML ontologies by adding its constructs to them. Utilizing these ontologies formats web service descriptions in a machine-readable way like DAML-S (K. Sivashanmugam et al, 2006).

The concepts of web services and semantic web are very similar; they both help to make it easier for data on the current World Wide Web to be in the right data formats that software agents can use.


## References






  1. E. Thomas, 2004. Service-Oriented Architecture: A Field Guide to Integrating XML and Web Services. Prentice Hall PTR.ISBN: 0-13-142898-5.p.48


  2. M. Elkstein, Learn REST: A Tutorial [http://rest.elkstein.org/](http://rest.elkstein.org/) [Accessed 12th November 2009]


  3. R. D. Cormia: Web as a Platform for Distributed Computing, Web 2.0, and the Social Web: [http://fgamedia.org/faculty/rdcormia/COIN83/lesson06.htm](http://fgamedia.org/faculty/rdcormia/COIN83/lesson06.htm) [Accessed 13th January 2009]


  4. Dion Hinchcliffe, 2008. The hidden battle between web services: REST versus SOAP.  Available at: [http://www.hinchcliffe.org/archive/2005/02/12/171.aspx](http://www.hinchcliffe.org/archive/2005/02/12/171.aspx) [Accessed 12th January 2009]


  5. J. Snell, D. Tidwell and P. Kulchenko, December 2001. Programming Web Services with SOAP. O’Reilly. ISBN 10: 0-596-00095-2.p.6.


  6. E. Newcomer, 2002. Understanding Web Services XML, WSDL, SOAP, UDDI. Addison-Wesley Professional. ISBN-10: 0201750813. p-17.


  7. H. Lausen et al, 2005.Position Paper for the W3C rules workshop. Available at: [http://www.w3.org/2004/12/rules-ws/paper/44/](http://www.w3.org/2004/12/rules-ws/paper/44/) [Accessed on 20th of January 2009].


  8.  S. McIlraith , 2001. Semantic web service.ieee.org. Available at: [http://ksl.stanford.edu/people/sam/ieee01.pdf](http://ksl.stanford.edu/people/sam/ieee01.pdf) [Accessed on 20th of January 2009].




  1. P. Alesso, 2004. Preparing for Semantic Web Services. Available at: [http://www.sitepoint.com/article/semantic-web-services](http://www.sitepoint.com/article/semantic-web-services) [Accessed on 20th of January 2009].


  2. K. Sivashanmugam et al., 2006. Adding Semantics to Web Services Standards. Available at: [http://lsdis.cs.uga.edu/library/download/SVSM03-ICWS-final.pdf](http://lsdis.cs.uga.edu/library/download/SVSM03-ICWS-final.pdf) [Accessed on 20th of January 2009].


