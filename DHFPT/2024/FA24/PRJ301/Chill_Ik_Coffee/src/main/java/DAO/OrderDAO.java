package DAO;

import db.DBContext;
import model.CartItem;
import model.TaiKhoan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 * OrderDAO class to manage order processing.
 */
public class OrderDAO {
    private final DBContext dbContext; // Assuming you have a DBContext class for DB connection

    public OrderDAO() {
        dbContext = new DBContext(); // Initialize DBContext
    }

    // Method to process the purchase
    public boolean processPurchase(List<CartItem> cartItems, TaiKhoan userAccount) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = dbContext.getConnection(); // Get database connection

            // Start transaction
            conn.setAutoCommit(false);

            // 1. Insert order into orders table
            String insertOrderSQL = "INSERT INTO orders (user_id, total_price) VALUES (?, ?)";
            stmt = conn.prepareStatement(insertOrderSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, userAccount.getId()); // Assuming userAccount has an ID
            double totalPrice = calculateTotalPrice(cartItems); // Calculate total price
            stmt.setDouble(2, totalPrice);
            stmt.executeUpdate();

            // Get generated order ID
            int orderId = stmt.getGeneratedKeys().getInt(1);

            // 2. Insert each cart item into order_items table
            String insertOrderItemSQL = "INSERT INTO order_items (order_id, product_id, quantity) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(insertOrderItemSQL);

            for (CartItem item : cartItems) {
                stmt.setInt(1, orderId);
                stmt.setString(2, item.getProductId()); // Assuming productId is a String
                stmt.setInt(3, item.getQuantity());
                stmt.addBatch();
            }

            stmt.executeBatch(); // Execute batch insert for order items

            // 3. Update product inventory (assuming you have a method to update product stock)
            for (CartItem item : cartItems) {
                updateProductInventory(item.getProductId(), item.getQuantity(), conn);
            }

            // Commit transaction
            conn.commit();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback in case of an error
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            return false;
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to calculate total price from cart items
    private double calculateTotalPrice(List<CartItem> cartItems) {
        double total = 0;
        for (CartItem item : cartItems) {
            // Assuming you have a method to get product price by ID
            double price = getProductPrice(item.getProductId());
            total += price * item.getQuantity();
        }
        return total;
    }

    // Mock method to get product price by ID
    private double getProductPrice(String productId) {
        // Replace this with actual logic to fetch price from database
        return 10.0; // Example price
    }

    // Method to update product inventory
    private void updateProductInventory(String productId, int quantity, Connection conn) throws SQLException {
        String updateProductSQL = "UPDATE products SET stock = stock - ? WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(updateProductSQL)) {
            stmt.setInt(1, quantity);
            stmt.setString(2, productId);
            stmt.executeUpdate();
        }
    }
}
