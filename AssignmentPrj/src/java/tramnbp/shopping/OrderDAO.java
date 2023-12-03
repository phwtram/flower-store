/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tramnbp.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import tramnbp.utils.DBUtils;

/**
 *
 * @author ACER
 */
public class OrderDAO {
    private static final String ADD_ORDER = "INSERT INTO tblOrders(userID, date, total) "
            + "VALUES(?,?,?) ";
    
    public int addOrder(OrderDTO order) throws SQLException {
        // get current time
        java.sql.Date order_date = new java.sql.Date(order.getDate().getTime());
        
        int lastInsertID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet generatedKeys = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(ADD_ORDER, Statement.RETURN_GENERATED_KEYS);
            ptm.setString(1, order.getUserID());
            ptm.setDate(2, order_date);
            ptm.setDouble(3, order.getTotal());
            
            int rowsAffected = ptm.executeUpdate();
            if (rowsAffected > 0) {
                generatedKeys = ptm.getGeneratedKeys();
                if (generatedKeys.next()) {
                    lastInsertID = generatedKeys.getInt(1);
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (generatedKeys != null) generatedKeys.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return lastInsertID;
    }
}
