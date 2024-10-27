/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import db.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.TaiKhoan;

/**
 *
 * @author Do Van Luan - CE180457
 */
public class TaiKhoanDAO extends db.DBContext{
    
    
   
    // 1. Read
    public ArrayList<TaiKhoan> getAll() {

        ArrayList<TaiKhoan> taiKhoans = new ArrayList<>();
        String query = "select * from tai_khoan";

        try ( ResultSet rs = execSelectQuery(query)) {

            while (rs.next()) {
                taiKhoans.add(new TaiKhoan(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getBoolean(4),rs.getBoolean(5)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Err");
        }
        return taiKhoans;
    }
    
    public static void main(String[] args) {
        TaiKhoanDAO tkdao = new TaiKhoanDAO();
        System.out.println(tkdao.getAll());
    }
    
}