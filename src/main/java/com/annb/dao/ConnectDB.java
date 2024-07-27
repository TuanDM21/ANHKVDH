package com.annb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
	public Connection cn;

	public void Connect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Da xac dinh");
//			String url = "jdbc:mysql://localhost:3306/ANNB";
			String url = "jdbc:mysql://annbvdh.mysql.database.azure.com:3306/annb?useSSL=true&connectTimeout=300000"; // Adjust
//			String url = "jdbc:mysql://dha-mysql-server.mysql.database.azure.com:3306/quanlythietbi?useSSL=true&connectTimeout=300000"; // Adjust
//			String username = "root";
//			String password = "123456aA@$";
			String username = "tuandm21";
			String password = "0854737568aAsSdD^^";
			cn = DriverManager.getConnection(url, username, password);
			System.out.println("Da ket noi");
			// Tiếp tục thực hiện các thao tác với cơ sở dữ liệu MySQL ở đây

		} catch (ClassNotFoundException e) {
			System.out.println("Khong tim thay driver");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Ket noi khong thanh cong");
			e.printStackTrace();
		} finally {

		}
	}
}
