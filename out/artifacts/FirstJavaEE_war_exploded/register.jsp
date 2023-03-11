<head>
    <title>Title</title>
    <%@include file="vendor/head.jsp" %>
</head>
<body>
<%@include file="vendor/navbar.jsp" %>
<div class ="container">
    <div class ="row mt-5">
        <div class="col-sm-6 offset-3">
            <h4 class="mb-4">REGISTER TO SYSTEM</h4>
            <%
                String success = request.getParameter("success");
                if(success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                User added successfully!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <%
                String passError = request.getParameter("passworderror");
                if(passError!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Passwords are not same!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <%
                String emailError = request.getParameter("emailerror");
                if(emailError!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                User with this email exists!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <form action="/toregister" method="post">
                <div class="form-group">
                    <label>EMAIL:</label>
                    <input type="email" class="form-control" required name="email">
                </div>
                <div class="form-group">
                    <label>PASSWORD:</label>
                    <input type="password" class="form-control" required name="password">
                </div>
                <div class="form-group">
                    <label>RE TYPE PASSWORD:</label>
                    <input type="password" class="form-control" required name="re_password">
                </div>
                <div class="form-group">
                    <label>FULLNAME:</label>
                    <input type="text" class="form-control" required name="full_name">
                </div>
                <div class="form-group">
                    <button class="btn btn-success">REGISTER</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
