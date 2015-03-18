package myfoodmap.vicki;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Perlogout extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false); 

		if (session != null){    //多此判斷是因 session timeout 後，使用者又按了登出按鈕，就會造成 session null

			String account = (String) session.getAttribute("account");
			System.out.println(account+" session 已刪除");
			session.invalidate();
		}

		RequestDispatcher rd = request.getRequestDispatcher("logout.jsp");
		rd.forward(request, response);
	}
}
