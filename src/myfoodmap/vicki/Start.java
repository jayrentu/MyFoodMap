package myfoodmap.vicki;

import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


//@WebListener   //不寫這行，就要在 web.xml上標註
public class Start implements ServletContextListener { 

	public void contextInitialized(ServletContextEvent sce) {

		String sql = "SELECT SValue FROM System where SName='VisitCount'";
		Connection conn = null;
		ResultSet rs = null;
		JDBC jdbc = new JDBC();
	    try {
		    conn = jdbc.MsSQLConnection(sce.getServletContext());
		    rs=jdbc.Data(conn, sql, true);
			while(rs.next()){
				AboutSession.setVisitcount(rs.getInt("SValue"));  
				System.out.println("瀏覽次數初始設定成功，其值為: "+ AboutSession.getVisitcount());				
			}
			AboutSession.setCount(0);
			System.out.println("今天參訪人數初始設定成功，其值為: "+ AboutSession.getCount());
		    sce.getServletContext().setAttribute("VisitInitial", AboutSession.getVisitcount());
		    sce.getServletContext().setAttribute("TotalVisit", AboutSession.getVisitcount());
		    sce.getServletContext().setAttribute("Online", AboutSession.getCount());
			sce.getServletContext().setAttribute("login_y",sce.getServletContext().getInitParameter("login_y"));
	        sce.getServletContext().setAttribute("login_n",sce.getServletContext().getInitParameter("login_n"));
	        System.out.println("Context Attribute 設定成功");
	        conn.close();
	        rs.close();
	        
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	
    }

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

}
