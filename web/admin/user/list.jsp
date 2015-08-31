<%@ page import="db.UsersEntity" %>
<%@ page import="helpers.ConvertHelper" %>
<%@ page import="helpers.SettingsHelper" %>
<%@ page import="models.RestResponseModel" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.lang.reflect.Type" %>
<%@ page import="java.net.URL" %>
<%

    final int currentPageIndex = ConvertHelper.ToString(request.getParameter("page")).isEmpty()
            ? SettingsHelper.PAGING.PAGE
            : ConvertHelper.ToInteger(request.getParameter("page"));
    final int pageSize = ConvertHelper.ToString(request.getParameter("size")).isEmpty()
            ? SettingsHelper.PAGING.COUNT
            : ConvertHelper.ToInteger(request.getParameter("size"));
    final URL url = new URL(SettingsHelper.REMOTE_HOST + "/rest/user?limit=" + pageSize + "&offset=" + (pageSize * (currentPageIndex - 1)));
    final InputStream input = url.openStream();
    final RestResponseModel<UsersEntity> model = SettingsHelper.GSON.fromJson(IOUtils.toString(input), (Type) UsersEntity.class);
    final int pageCount = (int) Math.round(Math.ceil(model.getTotal() / pageSize));
    final int prevPageIndex = (currentPageIndex > 0)
            ? currentPageIndex - 1
            : 0;
    final int nextPageIndex = (currentPageIndex > 0 && currentPageIndex < pageCount - 1)
            ? currentPageIndex + 1
            : pageCount - 1;

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
        <th>Full Name</th>
        <th>Email</th>
        <th>Gender</th>
        <th>Birthday</th>
        <th>Promotional code</th>
        <th>Device Id</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <%for (UsersEntity item : model.getItems()) {%>
    <tr>
        <td><%=item.getId()%>
        </td>
        <td><%=item.getFullName()%>
        </td>
        <td><%=item.getEmail()%>
        </td>
        <td><%=item.getGender()%>
        </td>
        <td><%=item.getBirthday()%>
        </td>
        <td><%=item.getPromotionalCode()%>
        </td>
        <td><%=item.getDeviceId()%>
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