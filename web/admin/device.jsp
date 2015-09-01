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
    <jsp:include page="./../partials/header.jsp"/>
    <title>Marketing | Device</title>
</head>

<body>
<div class="container">

    <!-- The justified navigation menu is meant for single line per list item.
          Multiple lines will require custom code not provided by Bootstrap. -->
    <jsp:include page="./../partials/menu.jsp"/>

    <!-- Example row of columns -->
    <div class="page-header">
        <h1>Device</h1>
    </div>

    <p class="lead">Put content here</p>


    <div class="row">

        <p>
            <a href="#" class="btn btn-primary">
                Create
            </a>
        </p>

        <jsp:include page="./device/list.jsp"/>

    </div>

</div>
<jsp:include page="./../partials/footer.jsp"/>
<script src="./../assets/js/main.js"></script>
</body>
</html>
