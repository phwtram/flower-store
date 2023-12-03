/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tramnbp.shopping;

import java.util.HashMap;
import java.util.Map;
import tramnbp.product.ProductDTO;

/**
 *
 * @author ACER
 */
public class Cart {
    private Map<String, ProductDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public boolean add(String id, ProductDTO product) {
        boolean check = false;
        try {

            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(id)) {
                int currentQuantity = this.cart.get(id).getQuantity();
                product.setQuantity(currentQuantity + product.getQuantity());
            }
            this.cart.put(id, product);
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        try {

            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

    public boolean edit(String id, ProductDTO product) {
        boolean check = false;
        try {

            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                this.cart.replace(id, product);
                check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
}
