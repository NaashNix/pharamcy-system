package net.javaguides.usermanagement.bo.custom.impl;


import net.javaguides.usermanagement.bo.custom.ItemBo;
import net.javaguides.usermanagement.model.Item;
import net.javaguides.usermanagement.web.OrderServlet;
import net.javaguides.usermanagement.web.UserServlet;

import java.sql.*;
import java.util.ArrayList;

public class ItemBoImpl implements ItemBo {
    @Override
    public boolean add(Item item) throws SQLException, ClassNotFoundException {

        Connection connection = OrderServlet.dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Item VALUES (?,?,?,?,?,?,?,?)");
        preparedStatement.setObject(1,item.getItemCode());
        preparedStatement.setObject(2,item.getItemName());
        preparedStatement.setObject(3,item.getBrandName());
        preparedStatement.setObject(4,item.getDescription());
        preparedStatement.setObject(5,item.getPrice());
        preparedStatement.setObject(6,item.getDrugType());
        preparedStatement.setObject(7,item.getQuantity());
        preparedStatement.setObject(8,item.getExpireDate());

        if(preparedStatement.executeUpdate()>0){
            connection.close();
            return  true;

        }else{
            connection.close();
            return  false;

        }


    }

    @Override
    public boolean delete(String s) throws SQLException, ClassNotFoundException {
        return false;
    }

    @Override
    public boolean update(Item item) throws SQLException, ClassNotFoundException {
        return false;
    }

    @Override
    public Item search(String s) throws SQLException, ClassNotFoundException {
        Connection connection = UserServlet.dataSource.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM item WHERE itemCode =? ");
        preparedStatement.setObject(1,s);
        ResultSet resultSet = preparedStatement.executeQuery();

        if(resultSet.next()){
            String itemCode = resultSet.getString(1);
            String itemName = resultSet.getString(2);
            String brandName = resultSet.getString(3);
            String description = resultSet.getString(4);
            String price = resultSet.getString(5);
            String drugType = resultSet.getString(6);
            String quantity = resultSet.getString(7);
            String expireDate = resultSet.getString(8);

            return  new Item(
                    itemCode,
                    itemName,
                    brandName,
                    description,
                    Double.parseDouble(price),
                    drugType,
                    Double.parseDouble(quantity),
                    Date.valueOf(expireDate)

            );

        }
        return null;

    }

    @Override
    public ArrayList<Item> getAll() throws SQLException, ClassNotFoundException {
        ArrayList<Item> itemArrayList = new ArrayList<>();
        Connection connection = UserServlet.dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Item ");

        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            String itemCode = resultSet.getString(1);
            String itemName = resultSet.getString(2);
            String brandName = resultSet.getString(3);
            String description = resultSet.getString(4);
            double price = Double.parseDouble(resultSet.getString(5));
            String drugType = resultSet.getString(6);
            double quantity = Double.parseDouble(resultSet.getString(7));
            Date date = Date.valueOf(resultSet.getString(8));

            itemArrayList.add(new Item(itemCode,itemName,brandName,description,price,drugType,quantity,date));

        }



        return itemArrayList;
    }

    @Override
    public ArrayList<String> getAllItemId() throws SQLException {
        Connection connection = OrderServlet.dataSource.getConnection();
        ArrayList<String> stringArrayList = new ArrayList<>();

        PreparedStatement preparedStatement =
                connection.prepareStatement("SELECT itemCode FROM Item");

        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()){
            stringArrayList.add(resultSet.getString(1));
        }

        return stringArrayList;

    }

    @Override
    public String nextId() throws SQLException {
        Connection connection = UserServlet.dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT itemCode FROM Item ORDER BY  itemCode  DESC LIMIT 1");
        ResultSet resultSet = preparedStatement.executeQuery();

        if(resultSet.next()){
            int tempId = Integer.parseInt(resultSet.getString(1).split("-")[1]);
            tempId = tempId +1;
            tempId = tempId +1;

            return  "I-" + tempId;
        }

        return "I-100";
    }

}
