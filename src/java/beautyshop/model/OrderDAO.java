/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beautyshop.model;

import beautyshop.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author LeHoangTrong
 */
public class OrderDAO {

    private static final String GET_ORDERID = "SELECT TOP 1 OrderID as maxOrderID FROM tblOrders ORDER BY CAST(SUBSTRING(OrderID, 2, LEN(OrderID) - 1) AS INT) DESC";
    private static final String ADD_ORDER = "INSERT INTO tblOrders(orderID, userID, date, total, status) VALUES(?,?,?,?,?)";
    private static final String ADD_ORDERDETAIL = "INSERT INTO tblOrderDetails(orderID, productID, quantity, price, status) VALUES(?,?,?,?,?)";

    private static final String GET_LIST_ORDER = "SELECT orderID, date, total FROM tblOrders WHERE userID = ?";
    private static final String GET_LIST_PRODUCT = "SELECT productID, quantity, status, price FROM tblOrderDetails WHERE orderID = ?";

    public boolean checkout(Cart cart, UserDTO loginUser) {
        String orderID = "O1";
        String userID = loginUser.getUserID();
        Date orderDate = new Date();
        double total = cart.getTotal();
        boolean status = true;
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ORDERID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    if (rs.getString("maxOrderID") != null) {
                        orderID = "O" + (Integer.parseInt(rs.getString("maxOrderID").substring(1)) + 1);
                    }
                }
                ptm = conn.prepareStatement(ADD_ORDER);
                ptm.setString(1, orderID);
                ptm.setString(2, userID);
                ptm.setDate(3, new java.sql.Date(orderDate.getTime()));
                ptm.setDouble(4, total);
                ptm.setBoolean(5, status);
                check = ptm.executeUpdate() > 0;
                if (check) {
                    for (ProductDTO product : cart.getCart().values()) {
                        ptm = conn.prepareStatement(ADD_ORDERDETAIL);
                        ptm.setString(1, orderID);
                        ptm.setString(2, product.getProductID());
                        ptm.setInt(3, product.getQuantity());
                        ptm.setDouble(4, product.getPrice());
                        ptm.setBoolean(5, status);
                        check = ptm.executeUpdate() > 0;
                        if (!check) {
                            break;
                        }
                    }
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

    public List<OrderDTO> getListOrder(String userID) {
        List<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_ORDER);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
//                    Convert date to string
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    String date = sdf.format(rs.getDate("date"));

                    double total = rs.getDouble("total");
                    list.add(new OrderDTO(orderID, userID, date, total, true));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<ProductDTO> getListProduct(String orderID) {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_PRODUCT);
                ptm.setString(1, orderID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    boolean status = rs.getBoolean("status");
                    list.add(new ProductDTO(productID, "", price, quantity, status));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

}
