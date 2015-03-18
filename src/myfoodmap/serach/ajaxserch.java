package myfoodmap.serach;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.*;


public class ajaxserch extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AJAX Contorler Start:\t("+request.getParameter("type")+","+request.getParameter("addx")+","+request.getParameter("addy")+","+request.getParameter("add")+")");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String serach =request.getParameter("add"); 
		ajaxmodel m=new ajaxmodel();
		String dburl=getServletContext().getInitParameter("dburl");
		String Type=request.getParameter("type");
		String Coor=request.getParameter("addy")+","+request.getParameter("addx");
		JSONArray result =m.srn(serach,dburl,Type,Coor);
		
		response.setContentType("application/json");
		response.getWriter().print(result);
		response.getWriter().flush();

	}
}
