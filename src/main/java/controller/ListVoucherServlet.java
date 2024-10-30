package controller;

import DAO.VoucherDAO;
import model.Voucher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ListVoucherServlet", urlPatterns = {"/Quanly/voucher/ListVoucher"})
public class ListVoucherServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VoucherDAO voucherDAO = new VoucherDAO();

        // Tự động xóa các voucher hết hạn
        int deletedCount = voucherDAO.deleteExpiredVouchers();

        // In ra số lượng voucher đã xóa (có thể dùng log hoặc để hiển thị thông báo trên giao diện)
        System.out.println("Deleted " + deletedCount + " expired vouchers.");

        // Sau khi xóa, lấy danh sách voucher để hiển thị
        ArrayList<Voucher> vouchers = voucherDAO.getAll();
        request.setAttribute("vouchers", vouchers);
        request.getRequestDispatcher("/Quanly/voucher/list-voucher.jsp").forward(request, response);
    }
}

