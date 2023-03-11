package kz.javaee.servlets;

import kz.javaee.db.Countries;
import kz.javaee.db.DBManager;
import kz.javaee.db.Items;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/additem")
public class AddItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int amount= Integer.parseInt(request.getParameter("amount"));
        int price = Integer.parseInt(request.getParameter("price"));
        Long countryId = Long.parseLong(request.getParameter("manufacturer_id"));
        Countries cnt = DBManager.getCountry(countryId);
        if(cnt!=null){
            Items it = new Items(null,name, price, amount, cnt);
            DBManager.addItem(it);
            response.sendRedirect("/additem?success");
        }else {

            response.sendRedirect("/additem?error");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Countries>countries = DBManager.getCountries();

        request.setAttribute("countries", countries);

        request.getRequestDispatcher("/additem.jsp").forward(request, response);
    }
}
