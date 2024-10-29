/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package master.bean;

/**
 *
 * @author shampadey
 */
public class UserMasterBean {

    private int employee_serial_number;
    private String employee_id;
    private String employee_name;
    private String user_name;
    private String user_password;
    private String user_status;
    private String update_date;
    private int updated_by;
    private String picture_url;
    private String old_password;
    private String new_password;
    private String retype_new_password;

    public UserMasterBean() {
    }

    public String getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(String employee_id) {
        this.employee_id = employee_id;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public int getEmployee_serial_number() {
        return employee_serial_number;
    }

    public void setEmployee_serial_number(int employee_serial_number) {
        this.employee_serial_number = employee_serial_number;
    }

    public String getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(String update_date) {
        this.update_date = update_date;
    }

    public int getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(int updated_by) {
        this.updated_by = updated_by;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_status() {
        return user_status;
    }

    public void setUser_status(String user_status) {
        this.user_status = user_status;
    }

    public String getPicture_url() {
        return picture_url;
    }

    public void setPicture_url(String picture_url) {
        this.picture_url = picture_url;
    }

    public String getNew_password() {
        return new_password;
    }

    public void setNew_password(String new_password) {
        this.new_password = new_password;
    }

    public String getOld_password() {
        return old_password;
    }

    public void setOld_password(String old_password) {
        this.old_password = old_password;
    }

    public String getRetype_new_password() {
        return retype_new_password;
    }

    public void setRetype_new_password(String retype_new_password) {
        this.retype_new_password = retype_new_password;
    }
    
    
}
