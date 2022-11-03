package net.javaguides.usermanagement.bo.custom.impl;


import net.javaguides.usermanagement.bo.custom.PatientBo;
import net.javaguides.usermanagement.model.Patient;
import net.javaguides.usermanagement.model.User;
import net.javaguides.usermanagement.web.UserServlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PatientBoImpl implements PatientBo {



    @Override
    public boolean add(Patient patient) throws SQLException, ClassNotFoundException {

        Connection connection = UserServlet.dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Patient VALUES(?,?,?,?,?,?,?,?,?)");
        preparedStatement.setObject(1,patient.getPatientId());
        preparedStatement.setObject(2,patient.getFirstName());
        preparedStatement.setObject(3,patient.getUserName());
        preparedStatement.setObject(4,patient.getSecondName());
        preparedStatement.setObject(5,patient.getIdNumber());
        preparedStatement.setObject(6,patient.getPassword());
        preparedStatement.setObject(7,patient.getEmail());
        preparedStatement.setObject(8,patient.getAddress());
        preparedStatement.setObject(9,patient.getBirthday());



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
        Connection connection = UserServlet.dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM Patient WHERE patientId=? ");
        preparedStatement.setObject(1,s);

        if(preparedStatement.executeUpdate()>0){
            connection.close();
            return true;
        }else{
            connection.close();
            return false;
        }




    }

    @Override
    public boolean update(Patient patient) throws SQLException, ClassNotFoundException {

        Connection connection = UserServlet.dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE Patient SET " +
                "firstName = ?, userName=?,secondName = ?, idNumber =?, passWord = ?, email = ?, address= ?, " +
                "birthday = ? WHERE patientId = ?  ");
        preparedStatement.setObject(1,patient.getFirstName());
        preparedStatement.setObject(2,patient.getUserName());
        preparedStatement.setObject(3,patient.getSecondName());
        preparedStatement.setObject(4,patient.getIdNumber());
        preparedStatement.setObject(5,patient.getPassword());
        preparedStatement.setObject(6,patient.getEmail());
        preparedStatement.setObject(7,patient.getAddress());
        preparedStatement.setObject(8,patient.getBirthday());
        preparedStatement.setObject(9,patient.getPatientId());



        if(preparedStatement.executeUpdate()>0){
            connection.close();
            return  true;
        }



        return false;

    }

    @Override
    public Patient search(String s) throws SQLException, ClassNotFoundException {
        Connection connection = UserServlet.dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Patient WHERE patientId =? ");
        preparedStatement.setObject(1,s);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()){
            String patientId = resultSet.getString(1);
            String firstName = resultSet.getString(2);
            String userName = resultSet.getString(3);
            String secondName = resultSet.getString(4);
            String idNumber = resultSet.getString(5);
            String password = resultSet.getString(6);
            String email = resultSet.getString(7);
            String address = resultSet.getString(8);
            String birthday = resultSet.getString(8);

            return  new Patient(patientId,firstName,userName,secondName,idNumber,password,email,address,birthday);

        }


        return null;
    }

    @Override
    public ArrayList<Patient> getAll() throws SQLException, ClassNotFoundException {
        ArrayList<Patient> patientArrayList = new ArrayList<>();

        // this code use for connect database  and  use singleton design pattern
//      Connection connection = DbConnection.getInstance().getConnection();



        Connection connection = UserServlet.dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Patient");
        ResultSet resultSet = preparedStatement.executeQuery();


        while (resultSet.next()) {

            String patientId = resultSet.getString(1);
            String firstName = resultSet.getString(2);
            String userName = resultSet.getString(3);
            String secondName = resultSet.getString(4);
            String idNumber = resultSet.getString(5);
            String password = resultSet.getString(6);
            String email = resultSet.getString(7);
            String address = resultSet.getString(8);
            String birthday = resultSet.getString(8);


            patientArrayList.add(new Patient(patientId,firstName,userName,secondName,idNumber,password,email,address,birthday));


        }
        connection.close();
        return patientArrayList;
    }

    @Override
    public String nextId() throws SQLException {
        Connection connection = UserServlet.dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT patientId FROM Patient ORDER BY  patientId  DESC LIMIT 1");
        ResultSet resultSet = preparedStatement.executeQuery();

        if(resultSet.next()){
            int tempId = Integer.parseInt(resultSet.getString(1).split("-")[1]);
            tempId = tempId +1;
            return  "P-" + tempId;
        }

        return "P-100";
    }

    @Override
    public Patient checkLogin(String username, String password) throws SQLException {
        System.out.println("Username in PatientBoImpl (175) : "+username);
        System.out.println("Password in PatientBoImpl (176) : "+password);
        Connection connection = UserServlet.dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT * from Patient WHERE userName=?");
        statement.setObject(1,username);
        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next()){
            System.out.println("Help"+resultSet.getString(6));
            if(resultSet.getString(6).equals(password)){
                System.out.println("True : "+resultSet.getString(1));
                return new Patient(
                        resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getString(6),
                        resultSet.getString(7),
                        resultSet.getString(8),
                        resultSet.getString(9)
                );
            }else {
                System.out.println("Password not equal");
                return null;
            }
        }else {
            return null;
        }

    }
}
