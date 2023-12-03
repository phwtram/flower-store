/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tramnbp.product;

/**
 *
 * @author ACER
 */
public class ProductDTO {
    private String productID;
    private String name;
    private double price;
    private int quantity;
    private String img;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String name, double price, int quantity, String img) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
    }

    public String getProductID() {
        return productID;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getImg() {
        return img;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
}
