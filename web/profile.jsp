<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.javaee.db.Items" %>
<%@ page import="org.w3c.dom.ls.LSOutput" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/head.jsp" %>
</head>
<body>
<%@include file="vendor/navbar.jsp" %>
<div class ="container">
    <div class ="row mt-5">
        <div class="col-sm-12">
            <h2>
                THIS IS PROFILE OF <%=(ONLINE?currentUser.getFullName():"NO USER")%>
            </h2>
        </div>
    </div>
</div>
</body>
</html>