package controller;

import DAO.OrderDAO;
import model.TaiKhoan;
import model.CartItem;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class PurchaseControl
 * This servlet handles the purchase process, including checking out items from the cart.
 */
@WebServlet(name = "PurchaseControl", urlPatterns = {"/purchase"})
public class PurchaseControl extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     * Processes the purchase of items in the shopping cart.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        TaiKhoan userAccount = (TaiKhoan) session.getAttribute("user");

        if (userAccount == null) {
            // User not logged in, redirect to login
            session.setAttribute("mess", "Please log in to proceed with the purchase.");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");
        OrderDAO orderDAO = new OrderDAO();

        // Process purchase
        if (orderDAO.processPurchase(cartItems, userAccount)) {
            // Clear the cart after successful purchase
            session.removeAttribute("cart");
            session.setAttribute("mess", "Purchase successful!");
        } else {
            session.setAttribute("mess", "Error processing your purchase. Please try again.");
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    @Override
    public String getServletInfo() {
        return "Handles the purchase process.";
    }
}
