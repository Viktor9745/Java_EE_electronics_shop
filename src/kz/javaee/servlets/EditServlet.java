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

@WebServlet(value = "/edit")
public class EditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        int amount = Integer.parseInt(request.getParameter("amount"));
        int price = Integer.parseInt(request.getParameter("price"));
        Long countryId = Long.parseLong(request.getParameter("manufacturer_id"));
        Countries cnt = DBManager.getCountry(countryId);
        String redirect = "/";

        if (cnt != null) {
            Items item = DBManager.getItem(id);
            if (item != null) {
                item.setName(name);
                item.setAmount(amount);
                item.setPrice(price);
                item.setManufacturer(cnt);

                if (DBManager.saveItem(item)) {
                    redirect = "/edit?id=" + id + "&success";
                } else {
                    redirect = "/edit?id=" + id + "&error";
                }
            }
        }
        response.sendRedirect(redirect);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = 0L;
        try {
            id = Long.parseLong(request.getParameter("id"));
        }catch(Exception e){
            e.printStackTrace();
        }
        Items item = DBManager.getItem(id);
        if(item!=null){
            request.setAttribute("item", item);
            ArrayList<Countries> countries = DBManager.getCountries();
            request.setAttribute("countries", countries);
            request.getRequestDispatcher("/edit.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("404.jsp").forward(request,response);
        }
    }
}
