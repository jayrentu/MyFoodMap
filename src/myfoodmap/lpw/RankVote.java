package myfoodmap.lpw;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;


public class RankVote extends HttpServlet {
	private static final long serialVersionUID = 256L;    

    public RankVote() 
    {
        super();       
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("Good Day!");
		//Donotthing	 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{				
		try
		{			
			request.setCharacterEncoding("UTF-8");	
			response.setContentType("application/json;charset=UTF-8");
			
			String usid;
			String rsid;
			String ran;
			String islogin;
			String iseat;
			String tw;
			String votetype;
			String ew;
			
			Date nd = new Date();
			Connection conn=null;
	        Statement s=null;
	        
	        JSONObject result = new JSONObject();
	        
	        //抓取xml的資料庫連結
			String dburl = getServletContext().getInitParameter("dburl");
			
			//設定日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			
			//判斷session是否存在
			HttpSession session = request.getSession(false);
			
			//抓取login判斷並確認，沒有就改成false
			islogin = (String) session.getAttribute("login");			
			islogin = (islogin==null?"false":"true");
			
			//抓取是否用餐
			iseat = request.getParameter("iseat");
			//抓取用餐時間
			tw = request.getParameter("tw");
			//抓取資料新增的類型
			votetype = request.getParameter("votetype");
			//抓取新增或更新的現在時間
			ew = sdf.format(nd);
			
			System.out.println("dburl:"+dburl);
			System.out.println("islogin:"+islogin);
			System.out.println("iseat:"+iseat);	
			System.out.println("tw:"+tw);	
			System.out.println("votetype:"+votetype);
			System.out.println("ew:"+ew);
			
			if(Boolean.valueOf(islogin))
			{
				//告知前端為已登入的狀態
				result.put("islogin", "true");
				
				//寫入USID
				usid = session.getAttribute("usid").toString();
				//寫入RSID
				
		//		rsid = "7";
				rsid = request.getParameter("rsid");
				
				//寫入評分
				ran = request.getParameter("ran");
			 
				System.out.println("usid:"+usid);
				System.out.println("rsid:"+rsid);
				System.out.println("ran:"+ran);			 
					
				//判斷資料是新增還是修改
				switch(votetype)
				{
						
					case "nv":
						
						System.out.println("資料類型：「新增資料模式」");
						
				        try
				        {	
				        	conn = DriverManager.getConnection(dburl,"sa","111");  
				        	if (conn == null) System.out.println("Connection error");
				        	s = conn.createStatement();
				        		           	
				            // 增加資料
				    		s.executeUpdate("insert into Score (RSID,USID,Rank,isEat,EatTimeW,EatTimeT,EatTimeR) " +
				            "values("
				            + 	   "'"+ rsid +"',"
				            + 	   "'"+ usid +"',"
				            + 	   "'"+ Integer.parseInt(ran) +"',"
				            + 	   "'"+ iseat +"',"	            
				            + 	   "'"+ ew +"',"	            
				            + 	   "'"+ tw +"',"	 	            		
				            + 	   "'"+ ew +"'"	 	            		
				            + 	   ")");
				            
				            System.out.println("評分資料創建成功");

					    	//說明資料已確實寫入成功
					    	result.put("isvote", "true");
				        	        
				        } 
					        
				        catch (Exception ex) 
				        {
				           System.out.print(ex.getMessage());
				           System.out.println("評分資料創建失敗");
				           //拋一個值給前面說新增失敗
				           result.put("isvote", "false");
      
				        }
				        finally 
				        {
				        	try 
				        	{ 
				 	          s.close();
				 	          conn.close();
				        	} catch(Exception ex){ex.getMessage();}
				        }			      
										
						break;
						
					case "u":
						
						System.out.println("資料類型：「更新資料模式」");
						
				        try
				        {	
				        	conn = DriverManager.getConnection(dburl,"sa","111");  
				        	if (conn == null) System.out.println("Connection error");
				        	s = conn.createStatement();
				        		
				            // 增加資料
				    		s.executeUpdate("update Score " +
				            "set"
				            + 	   "\"Rank\" = '"+ Integer.parseInt(ran) +"',"
				            + 	   "\"isEat\" = '"+ iseat +"',"	            
				            + 	   "\"EatTimeT\" = '"+ tw +"',"	            	 	            		
				            + 	   "\"EatTimeR\" = '"+ ew +"'"	 	            		
				            + 	   "where RSID= " + rsid + " and "
				            +	   "USID= " + usid + "");
				            
				            System.out.println("評分資料更新成功");
				            //拋值說新增成功
				            result.put("isvote", "true");
				        	        
				        } 
					        
				        catch (Exception ex) 
				        {
				           System.out.print(ex.getMessage());
				           System.out.println("評分資料更新失敗");
				           //拋一個值給前面說新增失敗
				           result.put("isvote", "false");       
				        }
				        finally 
				        {
				        	try 
				        	{ 
				 	          s.close();
				 	          conn.close();
				        	} catch(Exception ex){ex.getMessage();}
				        }			        	  						
						break;
						
					default :
						
						System.out.println("有些錯誤？");	
						break;										
				}
				
	    		response.getWriter().print(result);
	    		response.getWriter().flush();
						    
			}
			
			else
			//沒登入者趕回登入畫面
			{
				System.out.println("沒登入!");
				result.put("islogin", "false");		
			}
		
		}
		catch(Exception e)
		{
			System.out.println("錯誤訊號："+e);
		}
		
	}
	
}
