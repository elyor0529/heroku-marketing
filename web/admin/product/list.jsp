<%@ page import="db.ProductsEntity" %>
<%@ page import="manager.ProductManager" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="java.util.List" %>
<%
    ManagerImpl<ProductsEntity> manager = new ProductManager();
    List<ProductsEntity> list = manager.getAll(0, 0);
%>
<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 8/22/2015
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table table-responsible" id="productTable">
    <thead>
    <tr>
        <th>#</th>
        <th>Name</th>
        <th>Mark</th>
        <th>Photo</th>
        <th>Company Id</th>
    </tr>
    </thead>
    <tbody>
    <%for (ProductsEntity item : list) {%>
    <tr>
        <td>
            <a href="#<%=item.getId()%>" class="btn btn-default">
                View
            </a>
            <a href="#<%=item.getId()%>" class="btn btn-success">
                Edit
            </a>
            <a href="#<%=item.getId()%>" class="btn btn-danger">
                Delete
            </a>
        </td>
        <td><%=item.getName()%>
        </td>
        <td><%=item.getMark()%>
        </td>
        <td>
            <img src=" <%=item.getPhotoUrl()%>" width="40" height="30"/>
        </td>
        <td><%=item.getCompanyId()%>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>