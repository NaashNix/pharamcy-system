package net.javaguides.usermanagement.bo.custom;

import net.javaguides.usermanagement.bo.Crud;
import net.javaguides.usermanagement.model.Orders;

import java.sql.SQLException;

public interface OrderBo extends Crud<Orders , String> {

    boolean addOrder(Orders orders) throws SQLException;
    public String nextId() throws SQLException;



}
