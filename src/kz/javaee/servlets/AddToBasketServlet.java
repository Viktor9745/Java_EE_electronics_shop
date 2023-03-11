package kz.javaee.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value="/addtobasket")
public class AddToBasketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String basketValue = request.getParameter("basket_value");
        ArrayList<String> basket = (ArrayList<String>)request.getSession().getAttribute("basket");
        if(basket==null){
            basket = new ArrayList<>();
        }
        basket.add(basketValue);
        request.getSession().setAttribute("basket", basket);
        response.sendRedirect("/sessions");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
