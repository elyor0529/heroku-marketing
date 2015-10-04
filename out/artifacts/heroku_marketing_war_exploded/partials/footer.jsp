<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 8/22/2015
  Time: 11:22 PM
  To change this template use File | helpers.FactoryHelper | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="/assets/js/jquery.js"></script>
<script src="/assets/js/ie10-viewport-bug-workaround.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/jquery.validate.min.js"></script>
<script src="/assets/componens/select2/select2.min.js"></script>
<script src="/assets/componens/datepicker/bootstrap-datepicker.min.js"></script>
<script src="/assets/js/main.js"></script>

<!-- Site footer -->
<footer class="footer">
    <div class="container">
        <p class="text-muted">

        <p>&copy; Marketing - <%= new SimpleDateFormat("Y").format(new Date())%>
        </p></p>
    </div>
</footer>
