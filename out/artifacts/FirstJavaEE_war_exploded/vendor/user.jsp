<%@ page import="kz.javaee.db.Users" %>
<%
    Users currentUser = (Users)request.getSession().getAttribute("CURRENT_USER");
    boolean ONLINE = false;
    if(currentUser!=null){
        ONLINE = true;
    }
%>