package myfoodmap.vicki;

import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import myfoodmap.lpw.MD5code;

import java.io.*;
@SuppressWarnings("serial")

public class Perlogin extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
		boolean login=false, islock=false;
		String accountsql="",passwordsql="",name="",sql="",email="";
		int usid=0,lock=0;
		Connection conn = null;
		ResultSet rs = null;
		String message ="帳號錯誤! 請重新輸入";
		HttpSession session = request.getSession(false); 
		MD5code code = new MD5code(); 
		CheckTime checktime = new CheckTime();
		

		try{
			String account =request.getParameter("account");
			String password = code.md5(request.getParameter("password"));
	    	JDBC jdbc = new JDBC();
			conn = jdbc.MsSQLConnection(request.getServletContext());
			sql = "SELECT USID, UName, UAcc, UPW, UEmail, ULock FROM MapUser where UAcc='"+account+"'";
			rs = jdbc.Data(conn, sql, true);

			while(rs.next()){

				usid = rs.getInt("USID");				
				accountsql = rs.getString("UAcc");
				passwordsql = rs.getString("UPW");
				name = rs.getString("UName");
				email = rs.getString("UEmail");
				lock = rs.getInt("ULock");

				if (lock != 1){

					if(password.equals(passwordsql)){
						if (checktime.Add(accountsql,session)){
							message = "目前已經有3個設備是用此帳號登入，請登出其他設備再進行登入";							
							login=false;
						}
						else {
							login=true;
							getServletContext().setAttribute(accountsql+"error", "0");
						}
					}
					else {

						if (checktime.Add(accountsql+"error",session)){
							message = "密碼連續錯誤3次，帳號已鎖定";
							islock=true;
						}
						else {
							message = "密碼輸入錯誤! 請重新輸入";
						}
						login=false;
					}

				} else {
					message = "此帳號已被鎖定，請洽服務人員解鎖";
					login=false;
				}

			}
            if (islock == true){
            	sql = "UPDATE MapUser SET ULock = 1 where UAcc='"+account+"'";
            	jdbc.Data(conn, sql, false);
            }
						
			if (login==true){
				
				if (session==null){
					session = request.getSession();
					System.out.println("new session! " + session.getId());
				} 
				
				else {
					System.out.println("there was a session! " + session.getId());
					
				}

				session.setAttribute("login", "true");
				session.setAttribute("usid", usid);
				session.setAttribute("name", name);
				session.setAttribute("account", accountsql);
				session.setAttribute("email", email);
				session.setAttribute("login_y", "block");
				session.setAttribute("login_n", "none");
				session.setAttribute("times", getServletContext().getAttribute(account));

				RequestDispatcher rd = request.getRequestDispatcher("foodmymap.jsp"); 
				/** getRequestDispatcher 為導到某個 servlet 或某個網頁 */
//				rd.include(request, response);
				rd.forward(request, response);
			}
			else {
				request.setAttribute("loginfailmessage", message);
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}
			rs.close();
			conn.close();
		}catch(Exception se){
			se.getMessage();
		}

		finally{
//			out.close();
			try{
				if(conn!=null)
					conn.close();
				if(rs!=null)
					rs.close();
			}catch(Exception se){
				se.getMessage();
			}
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.include(request, response);
	}

}
