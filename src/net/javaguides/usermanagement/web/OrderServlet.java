package net.javaguides.usermanagement.web;

import net.javaguides.usermanagement.bo.BOFactory;
import net.javaguides.usermanagement.bo.custom.ItemBo;
import net.javaguides.usermanagement.bo.custom.PatientBo;
import net.javaguides.usermanagement.model.Item;
import net.javaguides.usermanagement.model.User;

import javax.annotation.Resource;
import javax.json.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet(urlPatterns = "/order")
public class OrderServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    public  static DataSource dataSource;
    ItemBo itemBo = (ItemBo) BOFactory.getBoFactory().getBo(BOFactory.BOTypes.ITEM);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("Order Servlet POST request");
        String searchedName = request.getParameter("itemName");
        System.out.println(searchedName);
        try {

            Item item = itemBo.search(searchedName);

            if(item != null){

            }

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Item> all = null;
        try {
            all = itemBo.getAll();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("items", all);
        RequestDispatcher dispatcher = req.getRequestDispatcher("Dashboard.jsp");
        dispatcher.forward(req,resp);
    }
}

