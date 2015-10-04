<%@ page import="db.DevicesEntity" %>
<%@ page import="db.UsersEntity" %>
<%@ page import="manager.DeviceManager" %>
<%@ page import="manager.ManagerImpl" %>
<%@ page import="manager.UserManager" %>
<%@ page import="org.apache.commons.beanutils.converters.IntegerConverter" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    int id = (Integer) new IntegerConverter(0).convert(String.class, request.getParameter("id"));
    final ManagerImpl<UsersEntity> manager = new UserManager();
    final ManagerImpl<DevicesEntity> deviceManager = new DeviceManager();

    UsersEntity entity = null;

    if (id > 0) {

        //edit
        if (request.getMethod().equalsIgnoreCase("get")) {
            entity = manager.get(id);
        } else if (request.getMethod().equalsIgnoreCase("post")) {
            entity = manager.get(id);

            entity.setFullName(request.getParameter("full_name"));
            entity.setEmail(request.getParameter("email"));
            entity.setGender(request.getParameter("gender"));
            final Date birthDate = new Date(new SimpleDateFormat("dd-MM-yyyy").parse(request.getParameter("birthday")).getTime());
            entity.setBirthday(new Timestamp(birthDate.getTime()));
            entity.setPromotionalCode((Integer) new IntegerConverter(0).convert(String.class, request.getParameter("promotional_code")));
            entity.setDeviceId((Integer) new IntegerConverter(0).convert(String.class, request.getParameter("device_id")));

            if (manager.update(id, entity)) {
                pageContext.forward("view.jsp?id=" + id);
            }
        }
    } else {

        //create
        if (request.getMethod().equalsIgnoreCase("get")) {
            entity = new UsersEntity();
        } else if (request.getMethod().equalsIgnoreCase("post")) {
            entity = new UsersEntity();

            entity.setFullName(request.getParameter("full_name"));
            entity.setEmail(request.getParameter("email"));
            entity.setGender(request.getParameter("gender"));
            final Date birthDate = new Date(new SimpleDateFormat("dd-MM-yyyy").parse(request.getParameter("birthday")).getTime());
            entity.setBirthday(new Timestamp(birthDate.getTime()));
            entity.setPromotionalCode((Integer) new IntegerConverter(0).convert(String.class, request.getParameter("promotional_code")));
            entity.setDeviceId((Integer) new IntegerConverter(0).convert(String.class, request.getParameter("device_id")));

            id = manager.insert(entity);

            if (id > 0) {
                pageContext.forward("view.jsp?id=" + id);
            }
        }
    }

%>

<%--
  Created by IntelliJ IDEA.
  User: elyor
  Date: 9/18/2015
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="form-horizontal" id="form1" method="post" accept-charset="utf-8" novalidate="novalidate">

    <div class="form-group ">
        <label for="c_full_name" class="control-label col-lg-2">Full Name <span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_full_name" name="full_name" value="<%=entity.getFullName()%>"
                   type="text"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_email" class="control-label col-lg-2">E-mail<span class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_email" name="email" value="<%=entity.getEmail()%>"
                   type="email"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_gender" class="control-label col-lg-2">Gender <span class="required">*</span></label>

        <div class="col-lg-10">
            <select class="select2-control form-control" name="gender" id="c_gender" required="required">
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_birthday" class="control-label col-lg-2">Birthday<span class="required">*</span></label>

        <div class="col-lg-10">

            <%
                final String birthDayFormat = new SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date(entity.getBirthday().getTime()));
            %>
            <input class="datepicker form-control" id="c_birthday" name="birthday" type="text"
                   value="<%=birthDayFormat%>"
                   required="required" data-date-format="mm/dd/yyyy"/>

        </div>
    </div>

    <div class="form-group ">
        <label for="c_promotional_code" class="control-label col-lg-2">Promotional code<span
                class="required">*</span></label>

        <div class="col-lg-10">
            <input class="form-control" id="c_promotional_code" name="promotional_code"
                   value="<%=entity.getPromotionalCode()%>"
                   type="number"
                   required="required"/>
        </div>
    </div>

    <div class="form-group ">
        <label for="c_device_id" class="control-label col-lg-2">Device Id <span class="required">*</span></label>

        <div class="col-lg-10">
            <select class="select2-control form-control" name="device_id" id="c_device_id">
                <%
                    for (DevicesEntity device : deviceManager.getAll(0, 0)) {

                        final boolean isSelected = entity.getDeviceId() > 0 &&
                                device.getId() == entity.getDeviceId();

                %>
                <%if (isSelected) {%>
                <option value="<%=device.getId()%>"
                        selected="selected"><%=device.getBrand() + " - " + device.getModel()%>
                </option>
                <%
                } else {
                %>
                <option value="<%=device.getId()%>"><%=device.getBrand() + " - " + device.getModel()%>
                </option>
                <%
                    }%>
                <%}%>
            </select>
        </div>
    </div>

</form>

<br/>
<br/>

<jsp:include page="/partials/form_bar.jsp">
    <jsp:param name="id" value="<%=id%>"/>
</jsp:include>
