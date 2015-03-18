package myfoodmap.vicki;

import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//@WebListener()
public class AboutSession extends HttpServlet implements HttpSessionListener {

	private static final long serialVersionUID = 1L;
	
	private static int count;	
	private static int visitcount;

    public static int getVisitcount() {
		return visitcount;
	}
    
	public static void setVisitcount(int visitcount) {
		AboutSession.visitcount = visitcount;
	}

	public static int getCount() {
        return count;
    }

    public static void setCount(int count) {
		AboutSession.count = count;
	}

	@Override
    public void sessionCreated(HttpSessionEvent se) {
    	int Initial=0;
    	String sql="";
    	Connection conn = null;
		ResultSet rs = null;
    	JDBC jdbc = new JDBC();
    	System.out.println("上線人數 : "+(++AboutSession.count));
    	System.out.println("總人次 : "+(++AboutSession.visitcount));
    	se.getSession().getServletContext().setAttribute("TotalVisit",AboutSession.visitcount);
    	se.getSession().getServletContext().setAttribute("Online",AboutSession.count);
    	Initial=(Integer)se.getSession().getServletContext().getAttribute("VisitInitial");
    	try {
    		if (AboutSession.visitcount>Initial){
    			sql = "UPDATE System SET SValue = "+AboutSession.visitcount+" where SName='VisitCount'";
    			conn = jdbc.MsSQLConnection(se.getSession().getServletContext());
    			rs = jdbc.Data(conn, sql, false);
    			System.out.println("瀏覽次數更新成功");
    		conn.close();
    		rs.close();
    		}
    	} catch (Exception e) {
    		e.getMessage();
    	}
    	
    }



	@Override
    public void sessionDestroyed(HttpSessionEvent se) {
    	if (AboutSession.count>0){
    		System.out.println("session id: "+se.getSession().getId()+" 在線人數: "+(--AboutSession.count));
        	se.getSession().getServletContext().setAttribute("Online",AboutSession.count);
    	}    	
    }
 
}