package com.annb.model;

import java.sql.Date;

public class ANNB {

	private int id;
	private String hoTen;
	private Date ngaySinh;
	private String gioiTinh;
	private Date ngayCapThe;
	private Date ngayHetHanThe;

	// Constructor
	public ANNB() {
	}

	public ANNB(int id, String hoTen, Date ngaySinh, String gioiTinh, Date ngayCapThe, Date ngayHetHanThe) {
		this.id = id;
		this.hoTen = hoTen;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.ngayCapThe = ngayCapThe;
		this.ngayHetHanThe = ngayHetHanThe;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public Date getNgayCapThe() {
		return ngayCapThe;
	}

	public void setNgayCapThe(Date ngayCapThe) {
		this.ngayCapThe = ngayCapThe;
	}

	public Date getNgayHetHanThe() {
		return ngayHetHanThe;
	}

	public void setNgayHetHanThe(Date ngayHetHanThe) {
		this.ngayHetHanThe = ngayHetHanThe;
	}

	@Override
	public String toString() {
		return "KhachHang{" + "id=" + id + ", hoTen='" + hoTen + '\'' + ", ngaySinh=" + ngaySinh + ", gioiTinh='"
				+ gioiTinh + '\'' + ", ngayCapThe=" + ngayCapThe + ", ngayHetHanThe=" + ngayHetHanThe + '}';
	}
}
