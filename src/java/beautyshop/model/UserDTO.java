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
public class UserDTO {

    private String userID;
    private String password;
    private String fullName;
    private String email;
    private String roleID;
    private String status;

    public UserDTO() {
        this.userID = "";
        this.password = "";
        this.fullName = "";
        this.email = "";
        this.roleID = "";
        this.status = "";
    }

    public UserDTO(String userID, String password, String fullName, String email, String roleID, String status) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.roleID = roleID;
        this.status = status;
    }

    public UserDTO(String email, String id, String family_name, String us, String atrue) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
