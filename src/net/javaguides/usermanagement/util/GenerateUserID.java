package net.javaguides.usermanagement.util;

import net.javaguides.usermanagement.web.UserServlet;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

public class GenerateUserID {
    public String generateNewId() {
        int lastIDint;
        Connection connection = null;
        try {
            connection = UserServlet.dataSource.getConnection();
            ResultSet resultSet = connection.prepareStatement("SELECT*FROM Patient ORDER BY patientId DESC LIMIT 1")
                    .executeQuery();
            if(resultSet.next()){
                lastIDint = (Integer.parseInt(resultSet.getString(1).substring(2)));
                return String.format("P-%03d",++lastIDint);
            }else{
                return "P-001";
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
