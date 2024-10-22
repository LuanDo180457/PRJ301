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

/**
 *
 * @author Do Van Luan - CE180457
 */
public class UserDAO extends db.DBContext {

    // Hàm kiểm tra đăng nhập
    public boolean login(String username, String password) {
        String sql = "SELECT COUNT(id) FROM users WHERE username = ? AND password = ?";
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
}
