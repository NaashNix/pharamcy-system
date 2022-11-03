package net.javaguides.usermanagement.bo.custom;



import net.javaguides.usermanagement.bo.Crud;
import net.javaguides.usermanagement.model.Patient;

import java.sql.SQLException;

public interface PatientBo extends Crud<Patient, String> {


    public String nextId() throws SQLException;
    public Patient checkLogin(String username, String password) throws SQLException;

}
