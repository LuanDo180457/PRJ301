/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.TaiKhoan;

/**
 *
 * @author Do Van Luan - CE180457
 */
public class UserDAO extends db.DBContext {

    // Hàm kiểm tra đăng nhập
    public boolean login(String username, String password) {
        String sql = "SELECT COUNT(id) FROM tai_khoan WHERE username = ? AND password = ?";
        try (Connection conn = getConnection(); // Kết nối tới cơ sở dữ liệu
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            // Set giá trị cho các tham số trong câu lệnh SQL
            ps.setString(1, username);
            ps.setString(2, hashMd5(password)); // Mã hóa mật khẩu bằng MD5

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return true; // Tìm thấy người dùng
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // Đăng nhập thất bại
    }

    // Hàm mã hóa MD5
    private String hashMd5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    
     // Hàm kiểm tra đăng nhập
   // Hàm kiểm tra đăng nhập
    public TaiKhoan AccTaiKhoanlogin(String username, String password) {
        String sql = "SELECT * FROM tai_khoan WHERE username = ? AND password = ?";
        try (Connection conn = getConnection(); // Kết nối tới cơ sở dữ liệu
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Set giá trị cho các tham số trong câu lệnh SQL
            ps.setString(1, username);
            ps.setString(2, hashMd5(password)); // Mã hóa mật khẩu bằng MD5

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new TaiKhoan(
                    rs.getInt("id"),        // ID của tài khoản
                    rs.getString("username"), // Tên đăng nhập
                    rs.getString("password"), // Mật khẩu (nên mã hóa)
                    rs.getBoolean("is_nhan_vien"),   // Trạng thái
                        rs.getBoolean("is_admin")     // Trạng thái admin
                );
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Ghi lại lỗi SQL
        } catch (Exception e) {
            e.printStackTrace(); // Ghi lại các lỗi khác
        }
        return null; // Đăng nhập thất bại
    }
    public static void main(String[] args) {
    UserDAO userDAO = new UserDAO();
    
    // Thay đổi username và password theo nhu cầu kiểm tra
    String testUsername = "admin"; // Tên đăng nhập bạn muốn kiểm tra
    String testPassword = "123456"; // Mật khẩu bạn muốn kiểm tra

    // Gọi hàm AccTaiKhoanlogin để kiểm tra đăng nhập
    TaiKhoan account = userDAO.AccTaiKhoanlogin(testUsername, testPassword);
    
    if (account != null) {
        System.out.println("Đăng nhập thành công!");
        System.out.println("ID: " + account.getId());
        System.out.println("Username: " + account.getUsername());
        System.out.println("Is Nhân Viên: " + account.isIsNhanVien());
        System.out.println("Is Admin: " + account.isIsAdmin());
    } else {
        System.out.println("Đăng nhập thất bại!");
    }
}


    
}