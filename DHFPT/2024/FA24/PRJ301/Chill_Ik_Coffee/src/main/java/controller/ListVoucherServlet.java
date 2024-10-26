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

@WebServlet(name="ListVoucherServlet", urlPatterns={"/Quanly/voucher/ListVoucher"})
public class ListVoucherServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Tạo đối tượng VoucherDAO để truy xuất dữ liệu
        VoucherDAO voucherDAO = new VoucherDAO();

        // Lấy danh sách voucher từ cơ sở dữ liệu
        ArrayList<Voucher> vouchers = voucherDAO.getAll();

        // Đặt danh sách voucher vào thuộc tính request để sử dụng trong JSP
        request.setAttribute("vouchers", vouchers);

    // Chuyển tiếp yêu cầu đến trang JSP
request.getRequestDispatcher("/Quanly/voucher/list-voucher.jsp").forward(request, response); // Cập nhật đường dẫn

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Phương thức này có thể để trống nếu không sử dụng POST
    }

    @Override
    public String getServletInfo() {
        return "List Voucher Servlet";
    }
}