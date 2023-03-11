<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-12">
            <h1 class="text-center">
                <%
                    String text = (String)request.getAttribute("text");
                    out.print(text);
                %>
            </h1>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-sm-6 offset-3">
            <form action="/setsession" method="post">
                <div class="form-group">
                    <label>SESSION VALUE : </label>
                    <input type="text" name="session_value" class="form-control">
                </div>
                <button class="btn btn-success">SET SESSION</button>
            </form>
            <form action="/deletesession" method="post">
                <button class="btn btn-danger">DELETE SESSION</button>
            </form>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-sm-12">
            <h1 class="text-center">
                <%
                    ArrayList<String> basket = (ArrayList<String>) request.getSession().getAttribute("basket");

                    if(basket!=null){
                        for(String bsk:basket){
                %>
                <h5 class="text-center"><%=bsk%></h5>
                <%
                    }
                    }
                %>
            </h1>
        </div>
    </div>
        <div class="row mt-5">
            <div class="col-sm-6 offset-3">
                <form action="/addtobasket" method="post">
                    <div class="form-group">
                        <label>BASKET VALUE : </label>
                        <input type="text" name="basket_value" class="form-control">
                    </div>
                    <button class="btn btn-success">ADD TO BASKET</button>
                </form>
                <form action="/clearbasket" method="post">
                    <button class="btn btn-danger">CLEAR BASKET</button>
                </form>
            </div>
    </div>
</div>
</body>
</html>
