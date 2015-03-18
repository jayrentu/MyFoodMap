package myfoodmap.vicki;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBC {
	
	public Connection MsSQLConnection(ServletContext s){
		Connection conn = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String dburl = s.getInitParameter("dburl");
			conn = DriverManager.getConnection(dburl,"sa","111");
//			System.out.println(dburl);
			System.out.println("資料庫連線成功");
		} catch (Exception e) {
			e.getMessage();
		}
		return conn;
	}
	
	public ResultSet Data(Connection conn,String sql, boolean b){
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			if (b==true){
				rs=stmt.executeQuery(sql);
				System.out.println(sql+" 資料查詢成功");
			}
			else {
				stmt.executeUpdate(sql);
				System.out.println(sql+" 資料更新成功");
			}
		
		} catch (Exception e) {
			e.getMessage();
		}
		return rs;
	}
}
