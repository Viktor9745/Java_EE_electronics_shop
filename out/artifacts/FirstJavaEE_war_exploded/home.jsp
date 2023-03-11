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
                <h4 class="mb-4">CONTENTS OF <%=siteName%></h4>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>PRICE</th>
                            <th>AMOUNT</th>
                            <th>MANUFACTURER</th>
                            <th>DETAILS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Items> items = (ArrayList<Items>) request.getAttribute("tovary");

                            if(items!=null){
                                for(Items it : items){
                        %>
                            <tr>
                                <td><%=it.getId()%></td>
                                <td><%=it.getName()%></td>
                                <td><%=it.getPrice()%></td>
                                <td><%=it.getAmount()%></td>
                                <td>
                                    <%=it.getManufacturer().getName()%> - <%=it.getManufacturer().getShortName()%>
                                </td>
                                <td><a href="/details?id=<%=it.getId()%>" class="btn btn-info btn-sm">DETAILS</a></td>
                            </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
