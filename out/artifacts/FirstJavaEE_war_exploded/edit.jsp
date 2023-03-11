<%@ page import="kz.javaee.db.Items" %>
<%@ page import="kz.javaee.db.Countries" %>
<%@ page import="kz.javaee.db.DBManager" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Yerkebulan
  Date: 04.03.2023
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
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
        <div class="col-sm-6 offset-3">
            <%
                Items item = (Items)request.getAttribute("item");
                if(item!=null){
            %>
            <%
                String success = request.getParameter("success");
                if(success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Item saved successfully!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <%
                String error = request.getParameter("error");
                if(error!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Something went wrong!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <form action="/edit" method="post">
                <input type="hidden" name="id" value="<%=item.getId()%>">
                <div class="form-group">
                    <label>NAME: </label>
                    <input type="text" name="name" class="form-control" value="<%=item.getName()%>">
                </div>
                <div class="form-group">
                    <label>AMOUNT: </label>
                    <input type="number" name="amount" class="form-control" value="<%=item.getAmount()%>">
                </div>
                <div class="form-group">
                    <label>PRICE: </label>
                    <input type="number" name="price" class="form-control" value="<%=item.getPrice()%>">
                </div>
                <div class="form-group">
                    <label>MANUFACTURER: </label>
                    <select class="form-control" name="manufacturer_id">
                        <%
                            ArrayList<Countries> countries = (ArrayList<Countries>) request.getAttribute("countries");
                            if(countries!=null){
                                for (Countries c: countries) {
                        %>
                        <option value="<%=c.getId()%>" <% if(c.getId()==item.getManufacturer().getId()){out.print("selected");}%>>
                            <%=c.getName()+" / "+c.getShortName()%>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <button class="btn btn-success">SAVE ITEM</button>
                    <button type="button" class="btn btn-danger float-right" data-toggle="modal" data-target="#deleteItemModal">
                        DELETE ITEM
                    </button>
                </div>
            </form>
            <div class="modal fade" id="deleteItemModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <form action="/delete" method="post">
                        <input type="hidden" name="id" value="<%=item.getId()%>">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Confirm Delete Process</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Are you sure?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                            <button class="btn btn-danger">YES</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>

            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>