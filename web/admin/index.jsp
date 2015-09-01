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
    <title>Marketing | Admin</title>
</head>

<body>

<div class="container">


    <!-- The justified navigation menu is meant for single line per list item.
         Multiple lines will require custom code not provided by Bootstrap. -->
    <jsp:include page="./../partials/menu.jsp"/>

    <!-- Example row of columns -->
    <div class="page-header">
        <h1>Admin</h1>
    </div>

    <p class="lead">Put content here</p>

    <div class="row">
        <div class="col-lg-4">
            <h2>Company</h2>

            <p class="text-info">Put content here.</p>

            <p><a class="btn btn-primary" href="./company.jsp" role="button">View details &raquo;</a></p>
        </div>

        <div class="col-lg-4">
            <h2>Device</h2>

            <p class="text-info">Put content here.</p>

            <p><a class="btn btn-primary" href="./device.jsp" role="button">View details &raquo;</a></p>
        </div>

        <div class="col-lg-4">
            <h2>News</h2>

            <p class="text-info">Put content here.</p>

            <p><a class="btn btn-primary" href="./news.jsp" role="button">View details &raquo;</a></p>
        </div>

    </div>

    <div class="row">
        <div class="col-lg-4">
            <h2>Product</h2>

            <p class="text-info">Put content here.</p>

            <p><a class="btn btn-primary" href="./product.jsp" role="button">View details &raquo;</a></p>
        </div>

        <div class="col-lg-4">
            <h2>User</h2>

            <p class="text-info">Put content here.</p>

            <p><a class="btn btn-primary" href="./user.jsp" role="button">View details &raquo;</a></p>
        </div>

        <div class="col-lg-4">
        </div>

    </div>
</div>
<jsp:include page="./../partials/footer.jsp"/>
</body>
</html>
