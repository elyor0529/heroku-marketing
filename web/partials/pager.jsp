<%@ page import="models.PagingResponseModel" %>
<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 9/1/2015
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final PagingResponseModel<Object> model = (PagingResponseModel<Object>) request.getAttribute("pager");
%>
<div class="row">

    <nav class="navbar navbar-left">
        <ul class="pagination pagination-lg">
            <%
                if (model.getCurrentPage() == 1) {
            %>
            <li class="disabled">
                <a href="#">First</a>
            </li>
            <%
            } else {
            %>
            <li>
                <a href="?page=1&size=<%=model.getPageSize()%>">
                    First</a>
            </li>
            <%
                }
            %>
            <%
                if (model.getCurrentPage() == 1) {
            %>
            <li class="disabled">
                <a href="#">Previous</a>
            </li>
            <%
            } else {
            %>
            <li>
                <a href="?page=<%=model.getPrevPage()%>&size=<%=model.getPageSize()%>">
                    Previous</a>
            </li>
            <%
                }
            %>
            <%
                if (model.getCurrentPage() == model.getPageSize() - 1) {
            %>
            <li class="disabled">
                <a href="#">Next</a>
            </li>
            <%
            } else {
            %>
            <li>
                <a href="?page=<%=model.getCurrentPage()%>&size=<%=model.getPageSize()%>">Next
                </a>
            </li>
            <%
                }
            %>
            <%
                if (model.getCurrentPage() == model.getPageSize() - 1) {
            %>
            <li class="disabled">
                <a href="#">Last</a>
            </li>
            <%
            } else {
            %>
            <li>
                <a href="?page=<%=model.getPageSize()-1%>&size=<%=model.getPageSize()%>">
                    Last</a>
            </li>
            <%
                }
            %>
        </ul>
    </nav>
    <nav class="navbar navbar-right">
        <ul class="pagination pagination-lg">
            <li><a href="?page=1&size=10">10</a></li>
            <li><a href="?page=1&size=20">20</a></li>
            <li><a href="?page=1&size=50">50</a></li>
            <li><a href="?page=1&size=100">100</a></li>
        </ul>
    </nav>
    <div class="clearfix"></div>
</div>