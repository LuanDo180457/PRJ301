package model;

import java.sql.Date;

/**
 * Model class representing a Voucher entity.
 */
public class Voucher {
    private int id =0;
    private String name;
    private double giamGia; // Discount percentage
    private Date ngayHetHan; // Expiration date (java.sql.Date for SQL compatibility)
    private boolean trangThai; // Status (active/inactive)

    // Constructor
    public Voucher(int id, String name, double giamGia, Date ngayHetHan, boolean trangThai) {
        this.id = id;
        this.name = name;
        this.giamGia = giamGia;
        this.ngayHetHan = ngayHetHan;
        this.trangThai = trangThai;
    }



    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public double getGiamGia() {
        return giamGia;
    }
    public void setGiamGia(double giamGia) {
        this.giamGia = giamGia;
    }
    public Date getNgayHetHan() {
        return ngayHetHan;
    }
    public void setNgayHetHan(Date ngayHetHan) {
        this.ngayHetHan = ngayHetHan;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    
    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }


}