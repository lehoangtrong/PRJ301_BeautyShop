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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LeHoangTrong
 */
public class ProductDAO {

    private static final String LIST = "SELECT productID, productName, price, quantity, status FROM tblProducts ";
    private static final String SEARCH = "SELECT productID, productName, price, quantity, status FROM tblProducts WHERE productName LIKE ?";
    private static final String UPDATE = "UPDATE tblProducts SET productName = ? ,price = ? ,quantity = ? ,status = ? WHERE productID = ?";
    private static final String REMOVE = "UPDATE tblProducts SET quantity = quantity - ? WHERE productID = ?";
    private static final String SEARCH_COUNT = "SELECT COUNT(productName) AS productCount FROM tblProducts WHERE tblProducts.productName like ?";
    private static final String SEARCHINDEX = "WITH x AS(SELECT ROW_NUMBER() OVER (ORDER BY productID ASC) AS [index], * FROM tblProducts WHERE tblProducts.productName like ?)\n"
            + "SELECT productID, productName, price, quantity FROM x WHERE [index] between ? and ?";

    public List<ProductDTO> getListProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    boolean status = rs.getBoolean("status");
                    list.add(new ProductDTO(productID, productName, price, quantity, status));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<ProductDTO> getListProduct(String searchProduct) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + searchProduct + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    boolean status = rs.getBoolean("status");
                    list.add(new ProductDTO(productID, productName, price, quantity, status));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean update(ProductDTO product) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, product.getProductName());
                ptm.setDouble(2, product.getPrice());
                ptm.setInt(3, product.getQuantity());
                ptm.setBoolean(4, product.isStatus());
                ptm.setString(5, product.getProductID());

                check = (ptm.executeUpdate() > 0);
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkQuantity(Map<String, ProductDTO> cart, List<ProductDTO> listProduct) {
        boolean check = true;
        for (ProductDTO product : listProduct) {
            if (cart.containsKey(product.getProductID())) {
                if (product.getQuantity() < cart.get(product.getProductID()).getQuantity()) {
                    check = false;
                }
            }
        }
        return check;
    }

    public void remove(Cart cart) {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                for (ProductDTO product : cart.getCart().values()) {
                    ptm = conn.prepareStatement(REMOVE);
                    ptm.setInt(1, product.getQuantity());
                    ptm.setString(2, product.getProductID());
                    ptm.executeUpdate();
                }
            }
        } catch (Exception e) {
        }
    }

    public int searchCount(String searchProduct) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_COUNT);
                ptm.setString(1, "%" + searchProduct + "%");
                rs = ptm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("productCount");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }

    public List<ProductDTO> search(String searchProduct, int left, int right) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCHINDEX);
                ptm.setString(1, "%" + searchProduct + "%");
                ptm.setInt(2, left);
                ptm.setInt(3, right);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");

                    list.add(new ProductDTO(productID, productName, price, quantity, true));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return list;
    }
}
