/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beautyshop.model;

/**
 *
 * @author LeHoangTrong
 */
public class OrderDTO {

    private String orderID;
    private String userID;
    private String orderDate;
    private double total;
    private boolean status;

    public OrderDTO() {
        this.orderID = "";
        this.userID = "";
        this.orderDate = "";
        this.total = 0;
        this.status = false;
    }

    public OrderDTO(String orderID, String userID, String orderDate, double total, boolean status) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.total = total;
        this.status = status;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
