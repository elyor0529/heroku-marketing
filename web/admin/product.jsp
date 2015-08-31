<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 8/22/2015
  Time: 11:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../partials/header.jsp"/>
    <title>Marketing | Product</title>
</head>

<body>

<div class="container">

    <!-- The justified navigation menu is meant for single line per list item.
          Multiple lines will require custom code not provided by Bootstrap. -->
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
                    <li><a href="./../rest/index.jsp">Rest</a></li>
                    <li><a href="./../about.jsp">About</a></li>
                    <li><a href="./../contact.jsp">Contact</a></li>
                    <li class="dropdown active">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Admin <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="./index.jsp">Home</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="./company.jsp">Company</a></li>
                            <li><a href="./device.jsp">Device</a></li>
                            <li><a href="./user.jsp">User</a></li>
                            <li><a href="./news.jsp">News</a></li>
                            <li class="active"><a href="./product.jsp">Product</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>

    <!-- Example row of columns -->
    <div class="page-header">
        <h1>Product</h1>
    </div>

    <p class="lead">Put content here</p>

    <div class="row">

        <p>
            <a href="#" class="btn btn-primary">
                Create
            </a>
        </p>

        <jsp:include page="./product/list.jsp"/>

    </div>
</div>
<jsp:include page="./../partials/footer.jsp"/>

<script src="./../assets/js/main.js"></script>
</body>
</html>
