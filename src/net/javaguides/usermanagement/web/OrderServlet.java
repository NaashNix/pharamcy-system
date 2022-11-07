package net.javaguides.usermanagement.web;

import net.javaguides.usermanagement.bo.BOFactory;
import net.javaguides.usermanagement.bo.custom.ItemBo;
import net.javaguides.usermanagement.bo.custom.OrderBo;
import net.javaguides.usermanagement.bo.custom.PatientBo;
import net.javaguides.usermanagement.model.Item;
import net.javaguides.usermanagement.model.OrderDetail;
import net.javaguides.usermanagement.model.Orders;
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
import java.sql.Date;
import java.sql.SQLException;
import java.util.*;

@WebServlet(urlPatterns = "/order")
public class OrderServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    public static DataSource dataSource;
    ItemBo itemBo = (ItemBo) BOFactory.getBoFactory().getBo(BOFactory.BOTypes.ITEM);
    OrderBo orderBo = (OrderBo) BOFactory.getBoFactory().getBo(BOFactory.BOTypes.ORDER);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Request Received"); // Print
        response.setContentType("application/json");    //
        System.out.println("Line 35 print");
        JsonReader reader = Json.createReader(request.getReader());
        System.out.println("Line 37 print");
        JsonObject jsonObject = reader.readObject();
        System.out.println("Line 39 print");
        String patientId = jsonObject.getString("customerId");
        System.out.println("Line 41 : " + patientId);
        String orderId = null;
        try {

            orderId = orderBo.nextId();

            String receivingDate =jsonObject.getString("dateAndTime");
            Date orderDate = Date.valueOf(receivingDate);

            double orderTotal = Double.parseDouble(jsonObject.getString("total"));
            JsonArray itemDetails = jsonObject.getJsonArray("itemDetail");

            ArrayList<OrderDetail> orderDetails = new ArrayList<>();
            for (JsonValue jsonValue : itemDetails) {

                String itemCode = jsonValue.asJsonObject().getString("itemCode");
                int quantity = jsonValue.asJsonObject().getInt("qty");
                String price = jsonValue.asJsonObject().getString("unitPrice");

                orderDetails.add(new OrderDetail(
                        orderId,
                        itemCode,
                        Double.parseDouble(String.valueOf(quantity)),
                        Double.parseDouble(price)
                ));
            }

            System.out.println(orderDetails.size());
            Orders orders = new Orders(
                    orderId,
                    orderDate,
                    orderTotal,
                    patientId,
                    orderDetails
            );


            boolean b = orderBo.addOrder(orders);



        } catch (SQLException throwables) {
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
        dispatcher.forward(req, resp);
    }
}

