package controller;

import DAO.DrinkDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Drink;

/**
 *
 * @author Nguyen Ngoc Phat - CE180321
 */
@WebServlet(name = "menuServlet", urlPatterns = {"/Menu"})
public class menuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DrinkDAO dDAO = new DrinkDAO();
        ArrayList<Drink> drinks = dDAO.getAll();

        request.setAttribute("drinks", drinks);
        request.getRequestDispatcher("/Nguoidung/menu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Menu Servlet to display drink list.";
    }
}
