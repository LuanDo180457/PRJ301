package model;

import java.util.Date;

public class ThongKe {
    private Date date;
    private double totalRevenue;

    public ThongKe(Date date, double totalRevenue) {
        this.date = date;
        this.totalRevenue = totalRevenue;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
}
