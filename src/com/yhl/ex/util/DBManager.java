package com.yhl.ex.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {
	private static Connection con;
	private static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url = "jdbc:sqlserver://localhost:1433;databaseName=db_examOnline";
	private static String uername = "sa";
	private static String pwd = "123456";

	public static Connection getConnection(){

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, uername, pwd);
			return con;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}

