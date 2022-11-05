package net.javaguides.usermanagement.web;

import javax.json.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.Map;
import java.util.Set;

@WebServlet(urlPatterns = "/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getServletPath();

        switch (option){
            case "/search" : {
                String name = request.getParameter("searchedName");
                System.out.println("Servlet Path Called");
                System.out.println("searchedName : "+name);
                break;
            }
        }

    }


}

