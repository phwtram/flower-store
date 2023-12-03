/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tramnbp.shopping;

import java.util.Date;



/**
 *
 * @author ACER
 */
public class OrderDTO {
    private String userID;
    private Date date;
    private double total;

    public OrderDTO() {
    }

    public OrderDTO(String userID, Date date, double total) {
        this.userID = userID;
        this.date = date;
        this.total = total;
    }

    public String getUserID() {
        return userID;
    }

    public Date getDate() {
        return date;
    }

    public double getTotal() {
        return total;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    
}
