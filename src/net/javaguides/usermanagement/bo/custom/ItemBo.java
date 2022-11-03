package net.javaguides.usermanagement.bo.custom;


import net.javaguides.usermanagement.bo.Crud;
import net.javaguides.usermanagement.model.Item;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ItemBo extends Crud<Item, String> {

    public ArrayList<String> getAllItemId() throws SQLException;
    public String nextId() throws SQLException;



}
