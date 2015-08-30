<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 8/26/2015
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="./../partials/header.jsp"/>
    <title>Marketing | Rest</title>
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
                    <li class="active"><a href="./index.jsp">Rest</a></li>
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

    <!-- Example row of columns -->
    <div class="page-header">
        <h2>
            Rest
        </h2>
    </div>

    <p class="lead">Put content here</p>

    <div class="row">
        <div class="col-lg-4">
            <h2>Company</h2>

            <p class="text-info">Put content here.</p>

            <p><a class="btn btn-primary" href="./company?offset=10&limit=10" role="button">View
                details &raquo;</a></p>
        </div>

        <div class="col-lg-4">
            <h2>Device</h2>

            <p class="text-info">Put content here.</p>

            <p><a class="btn btn-primary" href="./device?offset=10&limit=10" role="button">View details &raquo;</a>
            </p>
        </div>

        <div class="col-lg-4">
            <h2>News</h2>

            <p class="text-info">Put content here.</p>

            <p><a class="btn btn-primary" href="./news?offset=10&limit=10" role="button">View details &raquo;</a>
            </p>
        </div>

    </div>

    <div class="row">
        <div class="col-lg-4">
            <h2>Product</h2>

            <p class="text-info">Put content here.</p>

            <p><a class="btn btn-primary" href="./product?offset=10&limit=10" role="button">View
                details &raquo;</a></p>
        </div>

        <div class="col-lg-4">
            <h2>User</h2>

            <p class="text-info">Put content here.</p>

            <p><a class="btn btn-primary" href="./user?offset=10&limit=10" role="button">View details &raquo;</a>
            </p>
        </div>

        <div class="col-lg-4">
        </div>

    </div>
</div>
<jsp:include page="./../partials/footer.jsp"/>
</body>
</html>
