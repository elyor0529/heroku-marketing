<%@ page import="utils.Settings" %>
<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 9/1/2015
  Time: 2:50 PM
  To change this template use File | helpers.FactoryHelper | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./../index.jsp">Marketing</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Rest<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="./../rest/index.jsp">Home</a></li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <a href="./../rest/company?offset=<%=Settings.PAGING.OFFSET%>&limit=<%=Settings.PAGING.LIMIT%>"
                               target="_blank">Company</a></li>
                        <li>
                            <a href="./../rest/device?offset=<%=Settings.PAGING.OFFSET%>&limit=<%=Settings.PAGING.LIMIT%>"
                               target="_blank">Device</a></li>
                        <li><a href="./../rest/user?offset=<%=Settings.PAGING.OFFSET%>&limit=<%=Settings.PAGING.LIMIT%>"
                               target="_blank">User</a></li>
                        <li><a href="./../rest/news?offset=<%=Settings.PAGING.OFFSET%>&limit=<%=Settings.PAGING.LIMIT%>"
                               target="_blank">News</a></li>
                        <li>
                            <a href="./../rest/product?offset=<%=Settings.PAGING.OFFSET%>&limit=<%=Settings.PAGING.LIMIT%>"
                               target="_blank">Product</a></li>
                    </ul>
                </li>
                <li><a href="./../about.jsp">About</a></li>
                <li><a href="./../contact.jsp">Contact</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Admin <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="./../admin/index.jsp">Home</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="./../admin/company.jsp">Company</a></li>
                        <li><a href="./../admin/device.jsp">Device</a></li>
                        <li><a href="./../admin/user.jsp">User</a></li>
                        <li><a href="./../admin/news.jsp">News</a></li>
                        <li><a href="./../admin/product.jsp">Product</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>