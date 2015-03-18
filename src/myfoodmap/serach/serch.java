package myfoodmap.serach;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class serch extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String c = request.getParameter("add"); 
		model mo=new model();
		String a=getServletContext().getInitParameter("dburl");
		List<String> result =mo.srn(c,a);
		
		
		request.setAttribute("result", result);
	    RequestDispatcher view = request.getRequestDispatcher("FoodMap.jsp");
	    view.forward(request, response);

	}
}
