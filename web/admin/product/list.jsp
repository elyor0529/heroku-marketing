<%@ page import="db.ProductsEntity" %>
<%@ page import="helpers.ConvertHelper" %>
<%@ page import="helpers.SettingsHelper" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="manager.ProductManager" %>
<%@ page import="java.util.List" %>
<%
    final int currentPageIndex = ConvertHelper.ToString(request.getParameter("page")).isEmpty()
            ? SettingsHelper.PAGING.PAGE
            : ConvertHelper.ToInteger(request.getParameter("page"));
    final int pageSize = ConvertHelper.ToString(request.getParameter("size")).isEmpty()
            ? SettingsHelper.PAGING.COUNT - 1
            : ConvertHelper.ToInteger(request.getParameter("size"));
    final ManagerImpl<ProductsEntity> manager = new ProductManager();
    final int totalRecord = manager.getSize();
    final int pageCount = (int) Math.round(Math.ceil(totalRecord / pageSize));
    final int prevPageIndex = (currentPageIndex > 0)
            ? currentPageIndex - 1
            : 0;
    final int nextPageIndex = (currentPageIndex > 0 && currentPageIndex < pageCount - 1)
            ? currentPageIndex + 1
            : pageCount - 1;
    final List<ProductsEntity> list = manager.getAll(pageSize, pageSize * (currentPageIndex - 1));
%>
<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 8/22/2015
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav>
    <ul class="pagination pagination-lg">
        <li><a href="?page=1&size=10">10</a></li>
        <li><a href="?page=1&size=20">20</a></li>
        <li><a href="?page=1&size=50">50</a></li>
        <li><a href="?page=1&size=100">100</a></li>
    </ul>
</nav>
<table class="table table-responsible" id="dataTable">
    <thead>
    <tr>
        <th>#</th>
        <th>Name</th>
        <th>Mark</th>
        <th>Photo</th>
        <th>Company Id</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <%for (ProductsEntity item : list) {%>
    <tr>
        <td><%=item.getId()%>
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
    </tr>
    <%}%>
    </tbody>
</table>
<nav>
    <ul class="pager">
        <%
            if (currentPageIndex == 1) {
        %>
        <li class="disabled">
            <a href="#">First</a>
        </li>
        <%
        } else {
        %>
        <li>
            <a href="?page=1&size=<%=pageSize%>">
                First</a>
        </li>
        <%
            }
        %>
        <%
            if (currentPageIndex == 1) {
        %>
        <li class="disabled">
            <a href="#">Previous</a>
        </li>
        <%
        } else {
        %>
        <li>
            <a href="?page=<%=prevPageIndex%>&size=<%=pageSize%>">
                Previous</a>
        </li>
        <%
            }
        %>
        <%
            if (currentPageIndex == pageSize - 1) {
        %>
        <li class="disabled">
            <a href="#">Next</a>
        </li>
        <%
        } else {
        %>
        <li>
            <a href="?page=<%=prevPageIndex%>&size=<%=pageSize%>">Next
            </a>
        </li>
        <%
            }
        %>
        <%
            if (currentPageIndex == pageSize - 1) {
        %>
        <li class="disabled">
            <a href="#">Last</a>
        </li>
        <%
        } else {
        %>
        <li>
            <a href="?page=<%=pageSize-1%>&size=<%=pageSize%>">
                Last</a>
        </li>
        <%
            }
        %>
    </ul>
</nav>