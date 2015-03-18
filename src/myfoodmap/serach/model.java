package myfoodmap.serach;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.*;

public class model {
	public List srn(String a,String d) {
		System.out.println(a);
		Connection c=null;
		List ls=new ArrayList();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
			c = DriverManager.getConnection(d+";user=sa;password=111");
			Statement s =c.createStatement();
			ResultSet rs=s.executeQuery("sp_SRN "+a);
			  while (rs.next()){
				  ls.add("['"+rs.getString("RCoorX")+"','"+rs.getString("RCoorY")+"']");
			  }
			  
		} catch (Exception e) {
			// TODO �۰ʲ��ͪ� catch �϶�
			e.printStackTrace();
		} 
		return(ls);

	}
}

