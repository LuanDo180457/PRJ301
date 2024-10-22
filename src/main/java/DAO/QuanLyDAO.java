package DAO;

import db.DBContext;
import model.Voucher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuanLyDAO {

    // Lấy danh sách voucher, mặc định sắp xếp theo thời hạn (ngayHetHan)
    public List<Voucher> getAllVouchers() throws SQLException {
        List<Voucher> list = new ArrayList<>();
        String query = "SELECT * FROM voucher";
        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Voucher(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("giam_gia"),
                        rs.getDate("ngay_het_han"),
                        rs.getInt("trang_thai")));
            }
        }
        return list;
    }

    // Thêm mã giảm giá mới
    public void insertVoucher(Voucher voucher) throws SQLException {
        String query = "INSERT INTO voucher (name, giam_gia, ngay_het_han, trang_thai) VALUES (?, ?, ?, ?)";
        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, voucher.getName());
            ps.setDouble(2, voucher.getGiamGia());
            ps.setDate(3, voucher.getNgayHetHan());
            ps.setInt(4, voucher.getTrangThai());
            ps.executeUpdate();
        }
    }

    // Sửa thông tin mã giảm giá
    public void updateVoucher(Voucher voucher) throws SQLException {
        String query = "UPDATE voucher SET name = ?, giam_gia = ?, ngay_het_han = ?, trang_thai = ? WHERE id = ?";
        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, voucher.getName());
            ps.setDouble(2, voucher.getGiamGia());
            ps.setDate(3, voucher.getNgayHetHan());
            ps.setInt(4, voucher.getTrangThai());
            ps.setInt(5, voucher.getId());
            ps.executeUpdate();
        }
    }

    // Xóa mã giảm giá
    public void deleteVoucher(int id) throws SQLException {
        String query = "DELETE FROM voucher WHERE id = ?";
        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    // Tìm mã giảm giá theo ID
    public Voucher getVoucherById(int id) throws SQLException {
        String query = "SELECT * FROM voucher WHERE id = ?";
        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Voucher(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getDouble("giam_gia"),
                            rs.getDate("ngay_het_han"),
                            rs.getInt("trang_thai"));
                }
            }
        }
        return null;
    }
}
