package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection getC() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/mentor_meeting";
			con = DriverManager.getConnection(url, "root", "root");
			System.out.println("connection established");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return con;
	}
}
