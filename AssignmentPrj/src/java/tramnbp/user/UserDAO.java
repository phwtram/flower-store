/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tramnbp.user;

import static java.awt.Event.INSERT;
import static java.awt.event.PaintEvent.UPDATE;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import tramnbp.utils.DBUtils;

/**
 *
 * @author ACER
 */
public class UserDAO {

    private static final String LOGIN = "SELECT fullName, roleID FROM tblUsers "
            + "WHERE userID=? AND password=?";
    private static final String SEARCH = "SELECT userID, fullName, roleID "
            + "FROM tblUsers "
            + "WHERE fullName like ?";
    private static final String UPDATE = "UPDATE tblUsers SET fullName=?, roleID=? WHERE userID= ?";
    private static final String DELETE = "DELETE tblUsers WHERE userID = ?";
    private static final String INSERT = "INSERT INTO tblUsers(userID, fullName, roleID, password) VALUEs(?,?,?,?)";
    private static final String TEST = "SELECT userID, fullName FROM tblUsers WHERE userID = 'Admin'";
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(LOGIN);
            ptm.setString(1, userID);
            ptm.setString(2, password);
            rs = ptm.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("fullName");
                String roleID = rs.getString("roleID");
                user = new UserDTO(userID, fullName, password, roleID);
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return user;
    }

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String password = "***";
                    list.add(new UserDTO(userID, fullName, password, roleID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean update(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getRoleID());
                ptm.setString(3, user.getUserID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean delete(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, userID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean insert(UserDTO user) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getRoleID());
                ptm.setString(4, user.getPassword());
                check = ptm.executeUpdate() > 0 ? true : false;
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

       public UserDTO setTestUser() throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(TEST);
            rs = ptm.executeQuery();
            if (rs.next()){
                String userID = rs.getString("userID");
                String fullName = rs.getString("fullName");
                user = new UserDTO(userID, fullName, userID, userID);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return user;
    }
}