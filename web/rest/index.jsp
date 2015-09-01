<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 8/26/2015
  Time: 12:58 PM
  To change this template use File | helpers.FactoryHelper | File Templates.
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
    <jsp:include page="./../partials/menu.jsp"/>

    <!-- Example row of columns -->
    <div class="page-header">
        <h2>
            Rest
        </h2>
    </div>

    <p class="lead">Put content here</p>

    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Get items</h3>
            </div>
            <div class="panel-body">
                GET - {host}/rest/{table}?limit={limit}&offset={offset}
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Get item</h3>
            </div>
            <div class="panel-body">
                GET - {host}/rest/{table}?id={id}
            </div>
        </div>
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">Insert</h3>
            </div>
            <div class="panel-body">
                POST - {host}/rest/{table}
            </div>
        </div>
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h3 class="panel-title">Update</h3>
            </div>
            <div class="panel-body">
                PUT - {host}/rest/{table}
            </div>
        </div>
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">Delete</h3>
            </div>
            <div class="panel-body">
                DELETE - {host}/rest/{table}
            </div>
        </div>
    </div>

</div>
<jsp:include page="./../partials/footer.jsp"/>
</body>
</html>
