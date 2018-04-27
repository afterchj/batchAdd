package com.kd.mvc.utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBTool {
	private static String url;
	private static String user;
	private static String pwd;

		static {
			Properties p = new Properties();
			try {
				p.load(DBTool.class
						.getClassLoader()
						.getResourceAsStream(
								"setup.demo.properties"));
				Class.forName(p.getProperty("jdbc.driverclass"));
				url = p.getProperty("jdbc.url");
				user = p.getProperty("jdbc.username");
				pwd = p.getProperty("jdbc.password");
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException(
						"加载资源文件失败", e);
			} catch (ClassNotFoundException e) {
					e.printStackTrace();
					throw new RuntimeException(
							"找不到驱动类",e);
			}
		}

	public static Connection getConnection()
		throws SQLException {
		return DriverManager
			.getConnection(url,user,pwd);
	}

	public static void close(Connection con) {
		try {
			if(con !=null){
			con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(
					"关闭连接失败",e);
		}
	}
}
