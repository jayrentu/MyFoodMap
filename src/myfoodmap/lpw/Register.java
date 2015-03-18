package myfoodmap.lpw;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet 
{	
	private static final long serialVersionUID = 1L;
       

    public Register() 
    {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		RequestDispatcher rdn = request.getRequestDispatcher("register.jsp");
		rdn.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		MD5code g1 = new MD5code();
		boolean isnamafail = false;
		
		 request.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html;charset=UTF-8");
		 
	    java.io.PrintWriter out = response.getWriter();
	    
	    
	    String a1 = request.getParameter("name");
	    String a2 = request.getParameter("account").toUpperCase();
	    String a3 = g1.md5(request.getParameter("password"));
	    String a4 = g1.md5(request.getParameter("password1"));
	    String a5 = request.getParameter("email");
	    String a6 = request.getParameter("check");
	 		    					
		System.out.println(" 增加「name」：" + a1);
		System.out.println(" 增加「account」：" + a2);
		System.out.println(" 增加「password」：" + a3);
		System.out.println(" 增加「password1」：" + a4);
		System.out.println(" 增加「email」：" + a5);
		System.out.println(" 增加「check」：" + a6);
			
	    out.println("name :" + request.getAttribute("name") + "<br/>");
	    out.println("account :" + request.getAttribute("account") + "<br/>");
	    out.println("password :" + request.getAttribute("password") + "<br/>");
	    out.println("password1 :" + request.getAttribute("password1") + "<br/>");
	    out.println("email :" + request.getAttribute("email") + "<br/>");
	    out.println("check :" + request.getAttribute("check") + "<br/>");
			
	    String dburl = getServletContext().getInitParameter("dburl");
	    System.out.println(dburl);
	    
        Connection conn=null;
        Statement s=null;
			
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(dburl,"sa","111");  
            if (conn == null) System.out.println("Connection error");
	        s = conn.createStatement();
	        		                		     		        	
	        String query="create table MapUser " +
	                "(USID int NOT NULL, " +
	                "UName nvarchar(20) NOT NULL, " +
	                "UAcc nvarchar(20) NOT NULL, " +
	                "UPw nvarchar(40) NOT NULL, " +
	                "UEmail nvarchar(100) NOT NULL, " +
	                "UGuest int, " +
	                "ULock int, " +
	                "PRIMARY KEY (USID))";
	                       
	        System.out.println(s.executeUpdate(query));
	      	        
	        System.out.print("End Create Sheet");
	        		        
	        }
	        
        catch(Exception ex)
        {
        	System.out.println(ex.getMessage());
        	System.out.println("MapUser資料表已存在");
        }
        finally 
        {
        	try 
        	{ 
 	          s.close();
        	} catch(Exception ex){ex.getMessage();}
        }
		        
        try
        {		  	 
        	s = conn.createStatement();
        		     
        	String selnum = "select MAX(USID) as 'thebig' from MapUser";            	
        	ResultSet themax = s.executeQuery(selnum);	        	
        	        	
        	int c = 1;       	
    		
        	while(themax.next())
        	{       		      		        		       		
        		try
        		{
        			c = Integer.parseInt(themax.getString("thebig"))+1;  
        		}
        		catch(Exception ex)
        		{
        			System.out.println("第一筆資料？");
        			System.out.println("意外原因：" + ex.getMessage());
        		}
        		
        	}
        	
        	selnum = "select UAcc from MapUser";            	
        	themax = s.executeQuery(selnum);
        	
        	        	
        	while(themax.next())
        	{     		
        		if(a2.equals(themax.getString("UAcc")))
        		{
        			isnamafail = true;
        		}
        	}
        	
        	if(isnamafail)
        	{
        		System.out.println("Account重複了！");
        		throw new Exception();
        	}
        	
        	System.out.println("新增資料UID：" + c);
        	
            // 增加資料
            c=c+s.executeUpdate("insert into MapUser " +
                    "values('"+c+"',"
                    + 	   "'"+a1+"',"
                    + 	   "'"+a2+"',"
                    + 	   "'"+a3+"',"
                    + 	   "'"+a5+"',"
                    + 	   "'"+1+"',"
                    +      "'"+1+"')");
                      
            System.out.println("資料創建成功");  	        
         } 
	        
        catch (Exception ex) 
        {
           System.out.print("錯誤原因："+ex.getMessage());
           System.out.println("資料創建失敗");          
        }
        finally {
        	try { 
 	          s.close();
 	          conn.close();
        	} catch(Exception ex){ex.getMessage();}
         }
        
        if(isnamafail)
        {
        	request.setAttribute("sameacc", "帳號「"+ a2 +"」已有人使用，創建失敗");
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
        }
        else
        {
		    RequestDispatcher rd = request.getRequestDispatcher("registerok.jsp");
		    rd.forward(request, response);
        }
        
	}
	    	  		 
}


