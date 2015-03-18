package myfoodmap.lpw;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

@WebServlet("/CheckVote")
public class CheckVote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckVote() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");	
		response.setContentType("application/json;charset=UTF-8");
		
		String dburl = getServletContext().getInitParameter("dburl");
		Connection conn=null;
        Statement s=null;
        ResultSet rs; 
        ResultSet rs2;
      
        String sql;
        String rsid; 
        String usid;
        String islogin;
        
    	String rName = "??";
    	String rAdd = "??";
    	String rTel = "??";
    	String rRuntime = "??";
    	String rMeautime = "??";
    	String rWeb = "??";
    	String rInfo = "??";
    	String rRank_a = "??";
    	String rRank_n = "??";
    	String rCoorX = "0";
    	String rCoorY = "0";
            
        Integer ran = 0;
        Integer iseat = 0;
        Date eatTimeT;
        Boolean isvoted=false;
        
        JSONObject result = new JSONObject();
        	
        HttpSession session = request.getSession(false);
        
		islogin = (String) session.getAttribute("login");			
		islogin = (islogin==null?"false":"true");
		
		//讀到選取的餐廳

		System.out.println(request.getParameter("RSID"));
		System.out.println(request.getAttribute("RSID"));
//		rsid = request.getParameter("RSID").toString();

		//TEST
		rsid = request.getParameter("RSID").toString();

		
		
		System.out.println("islogin:"+islogin);
		System.out.println("rsid:"+rsid);
		
		try
		{
			//建立連結
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(dburl,"sa","111");  
            if (conn == null) System.out.println("Connection error");
		
            //設定與使用者有關的初始值
    		result.put("hisran", ran);
    		result.put("hiseat", iseat);
    		result.put("hisdate", "1900-01-01");
            
    		//判斷是否有登入
    		if(Boolean.valueOf(islogin))
    		{
    			//將登入狀態寫入為true
    			result.put("islogin", "true");
    			//response.setHeader("islogin", "true");
    			
    			//將usid讀入資料庫
    			usid = session.getAttribute("usid").toString();
    			
    			try {
    		        s = conn.createStatement();
    		        
    		        //確認資料表是否存在，如果不存在去創新資料表
    		        String query="create table Score " +
    		        		"(RSID int NOT NULL REFERENCES CUSTOMER (RSID), " +
    		                "USID int NOT NULL REFERENCES MapUser (USID), " +
    		                "Rank int, " +
    		                "Commet nvarchar(255), " +
    		                "IsEat int, " +
    		                "EatTimeW date, " +
    		                "EatTimeT date, " +
    		                "EatTimeR date," +
    		                "PRIMARY KEY (USID,RSID))";
    		               		        
    		        System.out.println(s.executeUpdate(query));		      	        
    		        System.out.println("End Create Sheet");
    		        		        
    		        }
    		        
    	        catch(Exception ex)
    	        {
    	        	System.out.println(ex.getMessage());
    	        	System.out.println("Score資料表已存在");
    	        }
    	        finally 
    	        {
    	        	try 
    	        	{ 
    	 	          s.close();	         
    	        	} catch(Exception ex){System.out.println(ex.getMessage());}
    	        }
    					
    			try
    	        {
    				//撈出使用者的評分紀錄
    				s = conn.createStatement();	            
    	            sql = "select RSID,Rank,isEat,EatTimeT from Score where USID='"+ usid +"'";
    	            
    	            rs = s.executeQuery(sql);	
    	               
    	            while(rs.next())
    	            {       
    	            	//判斷使用者是否評分過該餐廳
    	            	System.out.println("is " + rsid + " equal " + rs.getString("RSID"));
    	             	ran = rs.getInt("Rank");
    	             	iseat = rs.getInt("IsEat");
    	             	eatTimeT = rs.getDate("EatTimeT");
    	             	
    	             	if(ran==null) {ran = 0;}
    	             	
    	             	//如果有對到餐廳相同的評分紀錄
    	            	if(rsid.equals(rs.getString("RSID")))
    	            	{	  
    	            		//代表已經有紀錄
    	            		isvoted=true;
    	            		
    	            		//將記錄傳入前台
		            		result.put("hisran", ran);
		            		result.put("hiseat", iseat);
		            		result.put("hisdate", eatTimeT);
    	            		
		            		//分數為0時，表示為沒有評分
    	            		if(ran == 0)
    	            		{
        	            		//傳回前端「有紀錄沒評分的人」
    		            		System.out.println("is not new voted , but no ranked!");	
        		            	System.out.println("會員編號" + usid + "：有紀錄沒評分");
        		            	//response.setHeader("isnew", "u");
        		            	result.put("isnew", "u");
    		            		break;
    	            		}	
    	            		else
    	            		{
        	            		//傳回前端「有紀錄有評分的人」
    		            		System.out.println("is not new voted , and ranked!");
        		            	System.out.println("會員編號" + usid + "：有紀錄有評分");
        		            	//response.setHeader("isnew", "v");
        		            	result.put("isnew", "v");
    	            			break;
    	            		}
    	            	}	            	
    	            }
    	             
    	            if(!isvoted)
    	            {        
    	            	//傳回前端「沒紀錄的人」
    	            	System.out.println("會員編號" + usid + "：沒紀錄");
    	            	//response.setHeader("isnew", "nv"); 
		            	result.put("isnew", "nv");              		   	
    	            }
    	                 	            
    	        }
    	        catch(Exception e)
    	        {
    	        	System.out.println(e.getMessage());
    	        }
    	        finally
    	        {
    	        	try 
    	        	{ 
    	 	          s.close();          
    	        	} catch(Exception ex){ex.getMessage();}
    	        }
    						
    		}
    		
    		//沒登入時的狀況
    		else
    		{
    			System.out.println("This is a new person!");
    			result.put("islogin", "false");
    			//response.setHeader("islogin", "false");				
    		}
       
            //設定前端顯示的餐廳資料
    		
    		//設置餐廳底下的資料
    		s = conn.createStatement();	  	
    		sql = "select * from Resturant where RSID='" + rsid + "'"; 	            			            	
   		  			
    		rs2 = s.executeQuery(sql);
    		
    		while(rs2.next())
    		{
            	rName = rs2.getString("RName");
            	rAdd = rs2.getString("RAdd");
            	rTel = rs2.getString("RTel");
            	rRuntime = rs2.getString("RRuntime");
            	rMeautime = rs2.getString("RMeautime");
            	rWeb = rs2.getString("RWeb");
            	rInfo = rs2.getString("RInfo");
            	rCoorX = rs2.getString("RCoorX");
            	rCoorY = rs2.getString("RCoorY");
    		}
     	
        	sql = "select " +
        		  "cast(round(avg(Rank*1.0),1) as decimal(5,2)) as 'Ravg' , " +
        		  "count(Rank) as 'Rcount' " +
        		  "from Score where RSID = '"+ rsid +"' and Rank > 0 ";

        	rs2 = s.executeQuery(sql);
        	        	
        	while(rs2.next())
        	{
            	rRank_a = rs2.getString("Ravg");
            	rRank_n = rs2.getString("Rcount");
        	}
     	    	
        	//如果部分欄位沒有值，傳回前端沒資料的訊號
        	if(rWeb==null || rWeb.equals("")) { rWeb = "無資料"; }
        	if(rMeautime==null || rMeautime.equals("")) { rMeautime = "無資料"; }
        	if(rRank_a==null || rRank_a.equals("0")) { rRank_a = "--"; }
        	if(rRank_n==null || rRank_n.equals("0")) { rRank_n = "無資料"; }
        	
        	//資料傳回前端
        	result.put("rName", rName);
        	result.put("rAdd", rAdd);
        	result.put("rTel", rTel);
        	result.put("rRuntime", rRuntime);
        	result.put("rMeautime", rMeautime);
        	result.put("rWeb", rWeb);
        	result.put("rInfo", rInfo);
        	result.put("rRank_a", rRank_a);
        	result.put("rRank_n", rRank_n);
        	
        	//餐廳座標位置
        	result.put("rCoor", rCoorX+","+rCoorY );
        	        	
        	//確定送出
    		response.getWriter().print(result);
    		response.getWriter().flush();
    		
    		rs2.close();
    		
    		System.out.println("結果初始化完畢");
	
		}
		catch(Exception e)
		{
			System.out.println(e.getLocalizedMessage());
        	System.out.println(e.getMessage());
		}
		finally
		{
			try 
			{s.close(); conn.close();} 		
			catch (Exception e) 
			{ System.out.println(e.getMessage()); }			
		}
				        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//用post時仍是做get
		System.out.println("Let is DoGet!");
		doGet(request,response);
	}
	
	
}
