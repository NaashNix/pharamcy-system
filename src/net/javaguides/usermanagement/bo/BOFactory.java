package net.javaguides.usermanagement.bo;

import net.javaguides.usermanagement.bo.custom.impl.ItemBoImpl;
import net.javaguides.usermanagement.bo.custom.impl.OrderBoImpl;
import net.javaguides.usermanagement.bo.custom.impl.PatientBoImpl;

public class BOFactory {

    private  static  BOFactory boFactory;

    private BOFactory(){

    }

    public enum BOTypes{
        PATIENT, ITEM, ORDER
    }

    public static BOFactory getBoFactory(){

        if(boFactory == null){
            boFactory = new BOFactory();
        }

        return boFactory;
    }



    public SuperBo getBo(BOTypes types){

        switch (types){
            case ITEM:
                return new ItemBoImpl();
            case ORDER:
                return new OrderBoImpl();
            case PATIENT:
                return new PatientBoImpl();
            default:
                return null;

        }

    }



}
