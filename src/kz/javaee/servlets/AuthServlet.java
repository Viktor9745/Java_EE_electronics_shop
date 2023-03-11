package kz.javaee.servlets;

import kz.javaee.db.DBManager;
import kz.javaee.db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/auth")
public class AuthServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String redirect = "/login?emailerror";
        Users user = DBManager.getUser(email);



        if(user!=null){

            redirect = "/login?passworderror";
            if(user.getPassword().equals(password)){
                request.getSession().setAttribute("CURRENT_USER", user);
                redirect = "/";
            }
        }
        response.sendRedirect(redirect);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
