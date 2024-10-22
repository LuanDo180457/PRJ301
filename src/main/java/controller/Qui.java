package controller;

import DAO.QuanLyDAO;
import model.Voucher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Qui", urlPatterns = {"/manage-voucher"})
public class Qui extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        QuanLyDAO dao = new QuanLyDAO();
        try {
            List<Voucher> vouchers = dao.getAllVouchers();
            request.setAttribute("vouchers", vouchers);
            request.getRequestDispatcher("voucher-list.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        QuanLyDAO dao = new QuanLyDAO();

        try {
            if ("add".equals(action)) {
                String name = request.getParameter("name");
                double giamGia = Double.parseDouble(request.getParameter("giam_gia"));
                String ngayHetHan = request.getParameter("ngay_het_han");
                int trangThai = Integer.parseInt(request.getParameter("trang_thai"));

                Voucher voucher = new Voucher(0, name, giamGia, java.sql.Date.valueOf(ngayHetHan), trangThai);
                dao.insertVoucher(voucher);
            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                double giamGia = Double.parseDouble(request.getParameter("giam_gia"));
                String ngayHetHan = request.getParameter("ngay_het_han");
                int trangThai = Integer.parseInt(request.getParameter("trang_thai"));

                Voucher voucher = new Voucher(id, name, giamGia, java.sql.Date.valueOf(ngayHetHan), trangThai);
                dao.updateVoucher(voucher);
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.deleteVoucher(id);
            }
            response.sendRedirect("manage-voucher");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
