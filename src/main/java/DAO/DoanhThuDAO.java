/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author Vo Truong Qui - CE181170
 */
import db.DBContext;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.DoanhThu;

public class DoanhThuDAO extends DBContext {

    // Phương thức lấy doanh thu theo ngày
    public ArrayList<DoanhThu> getDoanhThuTheoNgay() {
        ArrayList<DoanhThu> doanhThuList = new ArrayList<>();
        String sql = "SELECT mn.name AS Tên_món_nước, "
                + "CONVERT(DATE, dm.ngay_mua_hang) AS Ngày, "
                + "SUM(dm.tong_gia) AS Doanh_thu "
                + "FROM don_mua_hang dm "
                + "JOIN mon_nuoc mn ON dm.mon_nuoc_id = mn.id "
                + "GROUP BY mn.name, CONVERT(DATE, dm.ngay_mua_hang) "
                + "ORDER BY Ngày, Tên_món_nước";

        try {
            ResultSet rs = execSelectQuery(sql);
            while (rs.next()) {
                doanhThuList.add(new DoanhThu(rs.getString("Tên_món_nước"),
                        rs.getDate("Ngày").toString(),
                        rs.getDouble("Doanh_thu")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doanhThuList;
    }

    // Phương thức lấy doanh thu theo tuần
    public ArrayList<DoanhThu> getDoanhThuTheoTuan() {
        ArrayList<DoanhThu> doanhThuList = new ArrayList<>();
        String sql = "SELECT mn.name AS Tên_món_nước, "
                + "DATEPART(YEAR, dm.ngay_mua_hang) AS Năm, "
                + "DATEPART(WEEK, dm.ngay_mua_hang) AS Tuần, "
                + "SUM(dm.tong_gia) AS Doanh_thu "
                + "FROM don_mua_hang dm "
                + "JOIN mon_nuoc mn ON dm.mon_nuoc_id = mn.id "
                + "GROUP BY mn.name, DATEPART(YEAR, dm.ngay_mua_hang), DATEPART(WEEK, dm.ngay_mua_hang) "
                + "ORDER BY Năm, Tuần, Tên_món_nước";

        try {
            ResultSet rs = execSelectQuery(sql);
            while (rs.next()) {
                doanhThuList.add(new DoanhThu(rs.getString("Tên_món_nước"),
                        "Tuần " + rs.getInt("Tuần") + " Năm " + rs.getInt("Năm"),
                        rs.getDouble("Doanh_thu")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doanhThuList;
    }

    // Phương thức lấy doanh thu theo tháng
    public ArrayList<DoanhThu> getDoanhThuTheoThang() {
        ArrayList<DoanhThu> doanhThuList = new ArrayList<>();
        String sql = "SELECT mn.name AS Tên_món_nước, "
                + "FORMAT(dm.ngay_mua_hang, 'yyyy-MM') AS Tháng, "
                + "SUM(dm.tong_gia) AS Doanh_thu "
                + "FROM don_mua_hang dm "
                + "JOIN mon_nuoc mn ON dm.mon_nuoc_id = mn.id "
                + "GROUP BY mn.name, FORMAT(dm.ngay_mua_hang, 'yyyy-MM') "
                + "ORDER BY Tháng, Tên_món_nước";

        try {
            ResultSet rs = execSelectQuery(sql);
            while (rs.next()) {
                doanhThuList.add(new DoanhThu(rs.getString("Tên_món_nước"),
                        rs.getString("Tháng"),
                        rs.getDouble("Doanh_thu")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doanhThuList;
    }
    // Method to get total revenue by day

    public ArrayList<DoanhThu> getTongDoanhThuTheoNgay() {
        ArrayList<DoanhThu> doanhThuList = new ArrayList<>();
        String sql = "SELECT CONVERT(DATE, dm.ngay_mua_hang) AS Ngày, SUM(dm.tong_gia) AS Doanh_thu "
                + "FROM don_mua_hang dm "
                + "GROUP BY CONVERT(DATE, dm.ngay_mua_hang) "
                + "ORDER BY Ngày";

        try {
            ResultSet rs = execSelectQuery(sql);
            while (rs.next()) {
                doanhThuList.add(new DoanhThu("Tất cả mặt hàng", rs.getDate("Ngày").toString(), rs.getDouble("Doanh_thu")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doanhThuList;
    }

// Method to get total revenue by week
    public ArrayList<DoanhThu> getTongDoanhThuTheoTuan() {
        ArrayList<DoanhThu> doanhThuList = new ArrayList<>();
        String sql = "SELECT DATEPART(YEAR, dm.ngay_mua_hang) AS Năm, DATEPART(WEEK, dm.ngay_mua_hang) AS Tuần, "
                + "SUM(dm.tong_gia) AS Doanh_thu "
                + "FROM don_mua_hang dm "
                + "GROUP BY DATEPART(YEAR, dm.ngay_mua_hang), DATEPART(WEEK, dm.ngay_mua_hang) "
                + "ORDER BY Năm, Tuần";

        try {
            ResultSet rs = execSelectQuery(sql);
            while (rs.next()) {
                doanhThuList.add(new DoanhThu("Tất cả mặt hàng", "Tuần " + rs.getInt("Tuần") + " Năm " + rs.getInt("Năm"), rs.getDouble("Doanh_thu")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doanhThuList;
    }

// Method to get total revenue by month
    public ArrayList<DoanhThu> getTongDoanhThuTheoThang() {
        ArrayList<DoanhThu> doanhThuList = new ArrayList<>();
        String sql = "SELECT FORMAT(dm.ngay_mua_hang, 'yyyy-MM') AS Tháng, SUM(dm.tong_gia) AS Doanh_thu "
                + "FROM don_mua_hang dm "
                + "GROUP BY FORMAT(dm.ngay_mua_hang, 'yyyy-MM') "
                + "ORDER BY Tháng";

        try {
            ResultSet rs = execSelectQuery(sql);
            while (rs.next()) {
                doanhThuList.add(new DoanhThu("Tất cả mặt hàng", rs.getString("Tháng"), rs.getDouble("Doanh_thu")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doanhThuList;
    }

}
