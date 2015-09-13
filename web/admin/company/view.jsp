<%@ page import="db.CompaniesEntity" %>
<%@ page import="manager.CompanyManager" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="org.apache.commons.beanutils.converters.IntegerConverter" %>

<%
    final int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));
    final ManagerImpl<CompaniesEntity> manager = new CompanyManager();
    final CompaniesEntity entity = manager.get(id);

%>
<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 8/22/2015
  Time: 11:24 PM
  To change this template use File | helpers.FactoryHelper | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/partials/header.jsp"/>
    <title>Marketing | <%=entity.getName()%>
    </title>
</head>

<body>

<div class="container">

    <!-- The justified navigation menu is meant for single line per list item.
          Multiple lines will require custom code not provided by Bootstrap. -->
    <jsp:include page="/partials/menu.jsp"/>

    <!-- Example row of columns -->
    <div class="page-header">
        <h1><%=entity.getName()%>
        </h1>
    </div>

    <p class="lead">
        <%=entity.getAbout()%>
    </p>

    <table class="table table-responsible table-view">

        <tr>
            <th>Key</th>
            <td><%=entity.getKey()%>
            </td>
        </tr>

        <tr>
            <th>Currency</th>
            <td><%=entity.getCurrency()%>
            </td>
        </tr>

        <tr>
            <th>Logo URL</th>
            <td>
                <img src="<%=entity.getLogoUrl()%>" width="40" height="30"/>
            </td>
        </tr>

        <tr>
            <th>Site URL</th>
            <td>
                <a href="<%=entity.getSiteUrl()%>" target="_blank"><%=entity.getSiteUrl()%>
                </a>
            </td>
        </tr>

        <tr>
            <th>Privacy policy</th>
            <td><%=entity.getPrivacyPolicy()%>
            </td>
        </tr>

        <tr>
            <th>Phone</th>
            <td><%=entity.getPhone()%>
            </td>
        </tr>

    </table>

    <jsp:include page="/partials/view_bar.jsp">
        <jsp:param name="id" value="<%=entity.getId()%>"/>
    </jsp:include>


</div>
<jsp:include page="/partials/footer.jsp"/>
<script src="/assets/js/main.js"></script>
</body>
</html>
