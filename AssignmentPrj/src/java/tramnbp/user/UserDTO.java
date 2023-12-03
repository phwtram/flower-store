/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tramnbp.user;

/**
 *
 * @author ACER
 */
public class UserDTO {
    private String userID;
    private String fullName;
    private String password;
    private String roleID;

    public UserDTO() {
        this.userID = "";
        this.fullName = "";
        this.password = "";
        this.roleID = "";
    }

    public UserDTO(String userID, String fullName, String password, String roleID) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
    }

    public String getUserID() {
        return userID;
    }

    public String getFullName() {
        return fullName;
    }

    public String getPassword() {
        return password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "userID=" + userID + ", fullName=" + fullName + ", password=" + password + ", roleID=" + roleID + '}';
    }
}
