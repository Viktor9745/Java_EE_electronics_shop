package kz.javaee.servlets;

import kz.javaee.db.DBManager;
import kz.javaee.db.Items;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(value = "/index")
public class IndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Items> items = DBManager.getItems();
        PrintWriter out = response.getWriter();

        out.println("<h1>ITEMS LIST</h1>");
        for(Items it : items){
            out.println("<h3>"+it.getId()+" "+it.getName()+" "+it.getPrice()+" "+it.getAmount()+" KZT </h3>");
        }

    }
}
