package com.annb.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.annb.model.ANNB;

public class ANNBDAO {
	private ConnectDB connect;

	public ANNBDAO() {
		connect = new ConnectDB();
		connect.Connect();
	}

	public void addANNB(ANNB annb) throws SQLException {
		String query = "INSERT INTO annb (id, hoTen, ngaySinh, gioiTinh, ngayCapThe, ngayHetHanThe) VALUES (?, ?, ?, ?, ?, ?)";
		try (PreparedStatement statement = connect.cn.prepareStatement(query)) {
			statement.setInt(1, annb.getId());
			statement.setString(2, annb.getHoTen());
			statement.setDate(3, annb.getNgaySinh());
			statement.setString(4, annb.getGioiTinh());
			statement.setDate(5, annb.getNgayCapThe());
			statement.setDate(6, annb.getNgayHetHanThe());
			statement.executeUpdate();
		}
	}

	public void updateANNB(ANNB annb) throws SQLException {
		String query = "UPDATE annb SET hoTen=?, ngaySinh=?, gioiTinh=?, ngayCapThe=?, ngayHetHanThe=? WHERE id=?";
		try (PreparedStatement statement = connect.cn.prepareStatement(query)) {
			statement.setString(1, annb.getHoTen());
			statement.setDate(2, annb.getNgaySinh());
			statement.setString(3, annb.getGioiTinh());
			statement.setDate(4, annb.getNgayCapThe());
			statement.setDate(5, annb.getNgayHetHanThe());
			statement.setInt(6, annb.getId());
			statement.executeUpdate();
		}
	}

	public void deleteANNB(int id) throws SQLException {
		String query = "DELETE FROM annb WHERE id=?";
		try (PreparedStatement statement = connect.cn.prepareStatement(query)) {
			statement.setInt(1, id);
			statement.executeUpdate();
		}
	}

	public List<ANNB> searchANNB(int ID) throws SQLException {
		List<ANNB> annbList = new ArrayList<>();
		String query = "SELECT * FROM annb WHERE ID = ? ";
		try (PreparedStatement statement = connect.cn.prepareStatement(query)) {
			statement.setInt(1, ID);
			try (ResultSet resultSet = statement.executeQuery()) {
				while (resultSet.next()) {
					ANNB annb = new ANNB();
					annb.setId(resultSet.getInt("id"));
					annb.setHoTen(resultSet.getString("hoTen"));
					annb.setNgaySinh(resultSet.getDate("ngaySinh"));
					annb.setGioiTinh(resultSet.getString("gioiTinh"));
					annb.setNgayCapThe(resultSet.getDate("ngayCapThe"));
					annb.setNgayHetHanThe(resultSet.getDate("ngayHetHanThe"));
					annbList.add(annb);
				}
			}
		}
		return annbList;
	}

	public List<ANNB> getAllANNB() throws SQLException {
		List<ANNB> annbList = new ArrayList<>();
		String query = "SELECT * FROM annb";
		try (PreparedStatement statement = connect.cn.prepareStatement(query);
				ResultSet resultSet = statement.executeQuery()) {
			while (resultSet.next()) {
				ANNB annb = new ANNB();
				annb.setId(resultSet.getInt("id"));
				annb.setHoTen(resultSet.getString("hoTen"));
				annb.setNgaySinh(resultSet.getDate("ngaySinh"));
				annb.setGioiTinh(resultSet.getString("gioiTinh"));
				annb.setNgayCapThe(resultSet.getDate("ngayCapThe"));
				annb.setNgayHetHanThe(resultSet.getDate("ngayHetHanThe"));
				annbList.add(annb);
			}
		}
		return annbList;
	}

	public ANNB getANNBById(int id) throws SQLException {
		String query = "SELECT * FROM annb WHERE id = ?";
		try (PreparedStatement statement = connect.cn.prepareStatement(query)) {
			statement.setInt(1, id);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					ANNB annb = new ANNB();
					annb.setId(resultSet.getInt("id"));
					annb.setHoTen(resultSet.getString("hoTen"));
					annb.setNgaySinh(resultSet.getDate("ngaySinh"));
					annb.setGioiTinh(resultSet.getString("gioiTinh"));
					annb.setNgayCapThe(resultSet.getDate("ngayCapThe"));
					annb.setNgayHetHanThe(resultSet.getDate("ngayHetHanThe"));
					return annb;
				}
			}
		}
		return null;
	}
}
