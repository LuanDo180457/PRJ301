package DAO;

import model.Voucher;
import db.DBContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * DAO for managing Voucher database operations
 */
public class VoucherDAO extends DBContext {

    // 1. Read
    public ArrayList<Voucher> getAll() {
        ArrayList<Voucher> vouchers = new ArrayList<>();
        String query = "SELECT * FROM voucher";

        try ( ResultSet rs = execSelectQuery(query)) {
            while (rs.next()) {
                vouchers.add(new Voucher(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("giam_gia"),
                        rs.getDate("ngay_het_han"),
                        rs.getBoolean("trang_thai")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error retrieving vouchers");
        }
        return vouchers;
    }

    public Voucher getOnlyById(int id) {
        String query = "SELECT id, name, giam_gia, ngay_het_han, trang_thai FROM voucher WHERE id = ?";
        Object[] params = {id};

        try ( ResultSet rs = execSelectQuery(query, params)) {
            if (rs.next()) {
                return new Voucher(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("giam_gia"),
                        rs.getDate("ngay_het_han"),
                        rs.getBoolean("trang_thai")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving voucher by ID");
        }

        return null;
    }

    // 2. Create
    public int create(Voucher voucher) {
        String getMaxIdQuery = "SELECT MAX(id) AS maxId FROM voucher";
        try ( ResultSet rs = execSelectQuery(getMaxIdQuery)) {
            int nextId = 1; // Start with ID 1
            if (rs.next()) {
                Integer maxId = rs.getInt("maxId");
                if (maxId != null) {
                    nextId = maxId + 1; // Increment if there are existing records
                }
            }

            String createVoucherQuery = "INSERT INTO voucher (id, name, giam_gia, ngay_het_han, trang_thai) VALUES (?, ?, ?, ?, ?)";
            Object[] params = {
                nextId,
                voucher.getName(),
                voucher.getGiamGia(),
                voucher.getNgayHetHan(),
                voucher.isTrangThai()
            };
            return execQuery(createVoucherQuery, params);
        } catch (SQLException ex) {
            System.out.println("Error creating voucher: " + ex.getMessage());
        }
        return 0;
    }

    // 3. Update
    public int update(Voucher voucher) {
        String sql = "UPDATE voucher SET name = ?, giam_gia = ?, ngay_het_han = ?, trang_thai = ? WHERE id = ?";
        Object[] params = {
            voucher.getName(),
            voucher.getGiamGia(),
            voucher.getNgayHetHan(),
            voucher.isTrangThai(),
            voucher.getId()
        };
        try {
            return execQuery(sql, params);
        } catch (SQLException ex) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

// 5. Delete expired vouchers
    public int deleteExpiredVouchers() {
        String query = "DELETE FROM voucher WHERE ngay_het_han < CURRENT_DATE"; // Sử dụng CURRENT_DATE để lấy ngày hiện tại
        try {
            return execQuery(query, null); // Không cần params, chỉ cần chạy query
        } catch (SQLException e) {
            Logger.getLogger(VoucherDAO.class.getName()).log(Level.SEVERE, null, e);
            System.out.println("Error deleting expired vouchers");
            return 0; // Trả về 0 nếu có lỗi
        }
    }

    // 4. Delete
    public int delete(int id) {
        String deleteSql = "DELETE FROM voucher WHERE id = ?";
        String renumberSql = "WITH CTE AS ("
                + "SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS new_id "
                + "FROM voucher "
                + ") "
                + "UPDATE voucher "
                + "SET id = CTE.new_id "
                + "FROM CTE "
                + "WHERE voucher.id = CTE.id;";

        Connection conn = null;

        try {
            conn = getConnection();
            conn.setAutoCommit(false); // Disable auto-commit

            Object[] params = {id};
            int result = execQuery(deleteSql, params);

            if (result > 0) {
                execQuery(renumberSql, null); // Only renumber IDs if deletion was successful
            }

            conn.commit();
            return result;
        } catch (SQLException ex) {
            System.out.println("Error during delete operation: " + ex.getMessage());
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException rollbackEx) {
                    System.out.println("Error during rollback: " + rollbackEx.getMessage());
                }
            }
            return 0;
        } finally {
            try {
                if (conn != null) {
                    conn.setAutoCommit(true); // Reset auto-commit back to true
                }
            } catch (SQLException e) {
                System.out.println("Error resetting auto-commit: " + e.getMessage());
            }
        }
    }
}
