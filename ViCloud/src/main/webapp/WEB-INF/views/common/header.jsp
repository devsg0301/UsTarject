<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/defaults/main.do">Start Bootstrap</a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="about.html">About</a>
            </li>
            <li>
                <a href="services.html">Services</a>
            </li>
            <li>
                <a href="contact.html">Contact</a>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="portfolio-1-col.html">1 Column Portfolio</a>
                    </li>
                    <li>
                        <a href="portfolio-2-col.html">2 Column Portfolio</a>
                    </li>
                    <li>
                        <a href="portfolio-3-col.html">3 Column Portfolio</a>
                    </li>
                    <li>
                        <a href="portfolio-4-col.html">4 Column Portfolio</a>
                    </li>
                    <li>
                        <a href="portfolio-item.html">Single Portfolio Item</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown <c:if test="${dropdown == 'blog'}">active</c:if>">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li <c:if test="${dropdown == 'blog'}"> class="active" </c:if>>
                        <a href="/blog/blog-home.do">Blog Home 1</a>
                    </li>
                    <li>
                        <a href="blog-home-2.html">Blog Home 2</a>
                    </li>
                    <li>
                        <a href="blog-post.html">Blog Post</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="full-width.html">Full Width Page</a>
                    </li>
                    <li>
                        <a href="sidebar.html">Sidebar Page</a>
                    </li>
                    <li>
                        <a href="faq.html">FAQ</a>
                    </li>
                    <li>
                        <a href="404.html">404</a>
                    </li>
                    <li>
                        <a href="pricing.html">Pricing Table</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</div>