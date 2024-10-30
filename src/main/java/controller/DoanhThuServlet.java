/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DoanhThuDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.DoanhThu;

/**
 *
 * @author Vo Truong Qui - CE181170
 */
@WebServlet("/Quanly/DoanhThu")
public class DoanhThuServlet extends HttpServlet {

    private DoanhThuDAO doanhThuDAO;

    @Override
    public void init() {
        doanhThuDAO = new DoanhThuDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<DoanhThu> doanhThuTheoNgay = doanhThuDAO.getDoanhThuTheoNgay();
        ArrayList<DoanhThu> doanhThuTheoTuan = doanhThuDAO.getDoanhThuTheoTuan();
        ArrayList<DoanhThu> doanhThuTheoThang = doanhThuDAO.getDoanhThuTheoThang();

        ArrayList<DoanhThu> tongDoanhThuTheoNgay = doanhThuDAO.getTongDoanhThuTheoNgay();
        ArrayList<DoanhThu> tongDoanhThuTheoTuan = doanhThuDAO.getTongDoanhThuTheoTuan();
        ArrayList<DoanhThu> tongDoanhThuTheoThang = doanhThuDAO.getTongDoanhThuTheoThang();

        request.setAttribute("doanhThuTheoNgay", doanhThuTheoNgay);
        request.setAttribute("doanhThuTheoTuan", doanhThuTheoTuan);
        request.setAttribute("doanhThuTheoThang", doanhThuTheoThang);

        request.setAttribute("tongDoanhThuTheoNgay", tongDoanhThuTheoNgay);
        request.setAttribute("tongDoanhThuTheoTuan", tongDoanhThuTheoTuan);
        request.setAttribute("tongDoanhThuTheoThang", tongDoanhThuTheoThang);

        request.getRequestDispatcher("doanhthu.jsp").forward(request, response);
    }
}
