package DAO;

import db.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Payment;
import model.TaiKhoan;

public class PaymentDAO extends DBContext {

    /*
    public void addPayment(Payment payment) {
        // Sửa lại câu lệnh SQL để có số lượng tham số đúng (8)
        String sql = "INSERT INTO payments (id, user_id, voucher_id, total_amount, discount_amount, final_amount, address, phone, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try ( Connection conn = this.getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, payment.getId());
            ps.setInt(2, payment.getUserId());
            ps.setInt(3, payment.getVoucherId());
            ps.setDouble(4, payment.getTotalAmount());
            ps.setDouble(5, payment.getDiscountAmount());
            ps.setDouble(6, payment.getFinalAmount());
            ps.setString(7, payment.getAddress());
            ps.setString(8, payment.getPhone());
            ps.setString(9, payment.getStatus());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     */
    // 2. Create
    // Cập nhật phương thức create trong TaiKhoanDAO
    public int addPayment(Payment payment) {
        String getNextIdQuery = "SELECT MAX(id) + 1 AS nextId FROM payment";
        try ( ResultSet rs = execSelectQuery(getNextIdQuery)) {
            if (rs.next()) {
                int nextId = rs.getInt(1);

                String sql = "INSERT INTO payment (id, user_id, voucher_id, total_amount, discount_amount, final_amount, address, phone, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                Object[] params = {
                    nextId,
                    payment.getUserId(),
                    payment.getVoucherId(),
                    payment.getTotalAmount(),
                    payment.getDiscountAmount(),
                    payment.getFinalAmount(),
                    payment.getAddress(),
                    payment.getPhone(),
                    payment.getStatus()
                };

                return execQuery(sql, params);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

}
