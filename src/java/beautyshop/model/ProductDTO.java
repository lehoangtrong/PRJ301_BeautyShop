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
public class ProductDTO {

    private String productID;
    private String productName;
    private double price;
    private int quantity;
    private boolean status;

    public ProductDTO() {
        this.productID = "";
        this.productName = "";
        this.price = 0.0;
        this.quantity = 0;
        this.status = false;
    }

    public ProductDTO(String productID, String productName, double price, int quantity, boolean status) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
