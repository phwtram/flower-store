/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tramnbp.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import tramnbp.utils.DBUtils;

/**
 *
 * @author ACER
 */
public class ProductDAO {
    private static final String GET_LIST_PRODUCT = "SELECT productID, name, price, quantity, img FROM tblProducts";
    private static final String GET_BUY_PRODUCT = "SELECT productID, name, price, quantity, img FROM tblProducts WHERE productID = ?";
    private static final String GET_PRODUCT_ID = "SELECT productID, name, price, quantity, img FROM tblProducts WHERE productID = ?";
    private static final String UPDATE_QUANTITY = "UPDATE tblProducts SET quantity=? WHERE productID=?";
        
        
    public List<ProductDTO> getListProduct() throws SQLException {
        List<ProductDTO> product = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_PRODUCT);
            rs = ptm.executeQuery();
            while (rs.next()){
                String ID = rs.getString("productID");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("img");
                if (quantity > 0) {
                    product.add(new ProductDTO(ID, name, price, quantity, img));
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return product;
    }

    public ProductDTO getBuyProduct(String productID, int quantity) throws SQLException {
          ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                ptm = conn.prepareStatement(GET_BUY_PRODUCT);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()){
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    String img = rs.getString("img");
                    product = new ProductDTO(productID, name, price, quantity, img);
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return product;
    }

    public ProductDTO getProductByID(String productID) throws SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                ptm = conn.prepareStatement(GET_PRODUCT_ID);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()){
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String img = rs.getString("img");
                    product = new ProductDTO(productID, name, price, quantity, img);
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return product;
    }

    public boolean updateQuantity(ProductDTO cart) throws SQLException {
        ProductDTO product = null;
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            product = getProductByID(cart.getProductID());
            if (product.getQuantity() >= cart.getQuantity()) {
                int newQuantity = product.getQuantity() - cart.getQuantity();
                conn = DBUtils.getConnection();
                ptm = conn.prepareStatement(UPDATE_QUANTITY);
                ptm.setInt(1, newQuantity);
                ptm.setString(2, product.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;

    
    }
}
