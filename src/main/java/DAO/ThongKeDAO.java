/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import db.DBContext;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ThongKe;

/**
 *
 * @author Vo Truong Qui - CE181170
 */
public class ThongKeDAO {

    private DBContext dbContext;

    public ThongKeDAO() {
        dbContext = new DBContext();
    }

    public List<ThongKe> getRevenueByDate(String date) throws SQLException {
        String query = "SELECT ngay_mua_hang AS OrderDate, SUM(tong_gia) AS TotalRevenue "
                + "FROM don_mua_hang "
                + "WHERE CAST(ngay_mua_hang AS DATE) = ? "
                + "GROUP BY ngay_mua_hang";
        ResultSet rs = dbContext.execSelectQuery(query, new Object[]{date});
        List<ThongKe> revenues = new ArrayList<>();
        while (rs.next()) {
            ThongKe tk = new ThongKe(rs.getDate("OrderDate"), rs.getDouble("TotalRevenue"));
            revenues.add(tk);
        }
        return revenues;
    }

    public List<ThongKe> getRevenueByWeek(int week) throws SQLException {
        String query = "SELECT DATEPART(week, ngay_mua_hang) AS OrderWeek, SUM(tong_gia) AS TotalRevenue "
                + "FROM don_mua_hang "
                + "WHERE DATEPART(week, ngay_mua_hang) = ? "
                + "GROUP BY DATEPART(week, ngay_mua_hang)";
        ResultSet rs = dbContext.execSelectQuery(query, new Object[]{week});
        List<ThongKe> revenues = new ArrayList<>();
        while (rs.next()) {
            ThongKe tk = new ThongKe(rs.getDate("OrderWeek"), rs.getDouble("TotalRevenue"));
            revenues.add(tk);
        }
        return revenues;
    }

    public List<ThongKe> getRevenueByMonth(int month) throws SQLException {
        String query = "SELECT DATEPART(month, ngay_mua_hang) AS OrderMonth, SUM(tong_gia) AS TotalRevenue "
                + "FROM don_mua_hang "
                + "WHERE DATEPART(month, ngay_mua_hang) = ? "
                + "GROUP BY DATEPART(month, ngay_mua_hang)";
        ResultSet rs = dbContext.execSelectQuery(query, new Object[]{month});
        List<ThongKe> revenues = new ArrayList<>();
        while (rs.next()) {
            ThongKe tk = new ThongKe(rs.getDate("OrderMonth"), rs.getDouble("TotalRevenue"));
            revenues.add(tk);
        }
        return revenues;
    }
}
