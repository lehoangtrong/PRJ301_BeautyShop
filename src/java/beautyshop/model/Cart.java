/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beautyshop.model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author LeHoangTrong
 */
public class Cart {

    private Map<String, ProductDTO> Cart;

    public Cart() {
    }

    public Map<String, ProductDTO> getCart() {
        return Cart;
    }

    public void setCart(Map<String, ProductDTO> Cart) {
        this.Cart = Cart;
    }

    public boolean add(ProductDTO product) {
        boolean check = false;
        try {
            if (this.Cart == null) {
                this.Cart = new HashMap<>();
            }
            if (this.Cart.containsKey(product.getProductID())) {
                int currentQuantity = Cart.get(product.getProductID()).getQuantity();
                product.setQuantity(currentQuantity + product.getQuantity());
            }
            this.Cart.put(product.getProductID(), product);
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        try {
            if (this.Cart != null) {
                this.Cart.remove(id);
            }
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean edit(String id, String quantity) {
        boolean check = false;
        try {
            if (this.Cart != null) {
                this.Cart.get(id).setQuantity(Integer.parseInt(quantity));
            }
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public double getTotal() {
        double total = 0;
        try {
            if (this.Cart != null) {
                for (ProductDTO product : Cart.values()) {
                    total += product.getPrice() * product.getQuantity();
                }
            }
        } catch (Exception e) {
        }
        return total;
    }
}
