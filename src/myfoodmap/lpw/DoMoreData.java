package myfoodmap.lpw;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

public class DoMoreData 
{
	private String dburl = "jdbc:sqlserver://192.168.3.153:1433;database=MyFoodMap";
	
	private String USID;
	private String UName;
	private String UAcc;
	private String UPw;
	private String UEmail;
	
	private String gender;
	
	private String[] RLast = {
			"陳","陳","陳","陳","陳","陳","陳","陳","陳","陳","陳",
			"林","林","林","林","林","林","林","林",
			"黃","黃","黃","黃","黃","黃",
			"李","李","李","李","李",
			"張","張","張","張","張",
			"王","王","王","王",
			"吳","吳","吳","吳",
			"劉","劉","劉",
			"蔡","蔡","蔡",
			"楊","楊",
			"趙","錢","孫","李","周","吳","鄭","王","馮","陳","褚","衛",
			"蔣","沈","韓","楊","朱","秦","尤","許","何","呂","施","張",
			"孔","曹","嚴","金","魏","陶","謝","鄒","章","蘇","潘","葛",
			"彭","韋","馬","苗","花","方","俞","任","袁","柳","鮑","史",
			"唐","費","薛","雷","倪","湯","羅","郝","皮","伍","顧","孟",
			"黃","蕭","姚","邵","汪","毛","宋","熊","紀","祝","董","梁",
			"杜","阮","賈","江","顏","郭","林","鍾","徐","邱","高","夏",
			"蔡","田","胡","柯","盧","丁","鄧","洪","包","崔","程","裴",
			"陸","荀","劉","詹","葉","白","賴","卓","譚","牛","溫","莊",
			"廖","簡","曾","司馬","上官","歐陽","諸葛","東方","皇甫","公孫",
			"令狐","慕容","范姜" };

	private String[] Rfirstf = {
			"女","凡","千","之","元","巧","仙","妃","汝","羽","伊","希",
			"妙","君","秀","杏","岑","沛","妍","吟","伶","幸","花","怡",
			"佩","宛","芹","芷","宓","枝","采","亞","芸","芙","芝","妲",
			"芳","佳","季","依","岱","洋","盈","秋","姝","珊","紅","柔",
			"屏","娃","美","貞","春","若","珍","香","思","郁","昭","玲",
			"姚","娉","桃","姬","峨","茱","紗","純","庭","容","茹","珠",
			"娥","茜","倩","真","悅","卿","娣","婕","荳","彩","雪","情",
			"曼","荷","淇","雀","梅","逸","琴","惠","萍","雲","喬","菱",
			"雁","晴","湘","雅","筑","詠","琪","琳","慈","虞","蛾","詩",
			"葵","煙","愛","群","鈴","瑞","楓","瑤","圓","綺","鳳","銀",
			"熙","嫦","綿","舞","甄","碧","寧","蔓","潔","蝶","慧","嬋",
			"嬌","襄","黛","曉","憶","鵑","瓊","麗","嬿","瀚","鏡","鵬",
			"麒","櫻","鶯","靈","鸞","芬","淑","蓉" };
	
	private String[] Rfirstm = {
			"一","乙","丁","人","大","才","上","工","士","川","力","子",
			"于","山","友","文","夫","公","王","天","介","仁","方","木",
			"中","月","心","甘","仕","世","玉","民","弘","正","巨","冬",
			"石","生","同","宇","仲","成","吉","百","江","合","池","冶",
			"志","邦","材","孝","辛","見","男","貝","廷","伯","里","利",
			"言","彤","良","谷","忠","昆","岳","坤","京","昌","朋","岡",
			"宜","炎","叔","松","金","武","易","牧","和","青","雨","奇",
			"東","法","宗","明","柱","亭","柏","城","泉","飛","虹","彥",
			"亮","重","施","星","宣","政","革","映","津","俊","相","茂",
			"范","俠","韋","扁","郎","段","洛","胡","侯","度","音","南",
			"科","律","約","威","英","建","柳","洲","致","軍","冠","炳",
			"計","信","洪","風","帝","浩","荀","書","修","格","海","陣",
			"軒","宵","馬","冢","茗","剛","草","唐","峻","振","高","倫",
			"朗","泰","展","原","家","堅","章","莊","望","貫","崧","堂",
			"莫","通","捷","康","國","彬","啟","盛","陶","健","強","清",
			"淳","勝","貴","景","隆","朝","尊","棠","敦","喜","華","皓",
			"陽","順","雄","富","翔","傳","雷","義","蜂","盟","達","敬",
			"稚","道","溫","新","意","萬","楚","照","運","聖","維","碩",
			"嘉","漢","熊","綸","齊","福","綠","鳴","境","銘","榮","德",
			"鋒","融","翰","興","龍","豐","衛","錦","樹","學","嚴","寶",
			"羅","識","釋","鐘","譽","躍","麟","觀","驥" };

		
	public static void main(String[] args) 
	{
		
		//DoMoreData x1 = new DoMoreData();
		
		//x1.DoMore(999);
		
		//x1.DoMore(50);
		//System.out.println(Math.random()*1024%1024);
			
		//System.out.println(x1.GetNumRan(20));
		
		//x1.DoData(18000);

	}
	
	public void DoData(int num)
	{
		Connection conn=null;
        Statement s=null;
						
		String sql;
		int count_s = 0;
		int count_f = 0;
		
        try
        {
    	   	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    	    conn = DriverManager.getConnection(dburl,"sa","111");
    	    if (conn == null) System.out.println("Connection error");
 	
        	for(int i = 0 ; i <num ; i++)
        	{	
	             s = conn.createStatement();   
	             
	             sql =  "insert into Score (RSID,USID,Rank,IsEat,EatTimeW,EatTimeT,EatTimeR) "
	 	            	+ "VALUES ('" + GetNumRan(2975) + "',"
	        			+ "'" + GetNumRan(2016) + "',"
	        			+ "'" + RanRank()  + "',"
	        			+ "'" + RanIseat() + "',"
	        			+ "'" + RanDay(1)  + "',"
	        			+ "'" + (( (int) (Math.random()*10%2) )==0?RanDay(2):"1900-01-01") + "',"
	        			+ "'" + RanDay(3)  + "');";
	             	             
	             try
	             {
	            	 s.executeUpdate(sql);
	            	 count_s++;
	             }
	             catch(Exception e)
	             {
	            	 System.out.println("錯誤訊息："+e.getMessage());
	            	 count_f++;
	             }
	                          
        	}
        	
            System.out.println("新增資料成功：" + count_s);
            System.out.println("新增資料失敗：" + count_f);
                         
        }
		catch(Exception e)
        {
			System.out.println("執行錯誤：" + e.getMessage());
        }
        finally
        {
        	try
        	{
        		s.close();
        		conn.close();
        		System.out.println("執行完成");
        	}
        	catch(Exception e)
        	{
        		System.out.println(e.getMessage());
        	}
        	 	
        }
	}
	
	public void DoMore(int num)
	{
		String sql;
		int maxnum = 0;
		int count = 0;
		
		Connection conn=null;
        Statement s=null;
        MD5code x2 = new MD5code();
        
        try
        {       	
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(dburl,"sa","111");  
            if (conn == null) System.out.println("Connection error");
            
            for(int i = 1 ; i <=num ; i++)
            {    	
	            s = conn.createStatement();         
	            
	            maxnum = MakeNowMax(s);
	                        
	            USID = ""+maxnum;
	            UName = MakeName() ;
	            UAcc = "EAT" + PlusZero(i,3);
	            UPw = x2.md5("11111111");
	            UEmail = "EAT" + PlusZero(i,3) + "@mpmeat.com.tw";
	   
	        /*
	         * sql = "insert into MapUser (USID,UName,UAcc,UPw,UEmail,UGuest,ULock) "
	         *	   + "VALUES ('1','1','1','1','1','1','1');"
	         */
	            
	            sql = "insert into MapUser (USID,UName,UAcc,UPw,UEmail,UGuest,ULock) "
	            	+ "VALUES ('" + USID   + "',"
	            			+ "'" + UName  + "',"
	            			+ "'" + UAcc   + "',"
	            			+ "'" + UPw    + "',"
	            			+ "'" + UEmail + "',"
	            			+ "'" + 1      + "',"
	            			+ "'" + 0      + "');";
	            	            
	            s.executeUpdate(sql);
	            count++;
            }
            
            System.out.println("新增了「" + count + "」筆會員");
            
        }
		catch(Exception e)
        {
			System.out.println("執行錯誤：" + e.getMessage());
        }
        finally
        {
        	try
        	{
        		s.close();
        		conn.close();
        		System.out.println("執行完成");
        	}
        	catch(Exception e)
        	{
        		System.out.println(e.getMessage());
        	}
        	
        }
	}
	
	private String MakeName()
	{
		String Name = "";
		
		gender = (( (int) (Math.random()*10%2) )==0?"女":"男");		
		
		Name += GetArrayRan(RLast);

		switch(gender)
		{
			case "女" :
				Name += GetArrayRan(Rfirstf) + GetArrayRan(Rfirstf);
				
				break;
			case "男" :
				Name += GetArrayRan(Rfirstm) + GetArrayRan(Rfirstm);

				break;
			default :
				Name += "婉君";
				break;
		}
	
		return Name;
	}
	
	private int MakeNowMax(Statement s) throws Exception
	{
		int maxnum = 0;
		String sql = "select MAX(USID) as 'thebig' from MapUser";
		ResultSet rs = s.executeQuery(sql);
		
		while(rs.next())
		{
    		try
    		{
    			maxnum = Integer.parseInt(rs.getString("thebig"))+1;  
    		}
    		catch(Exception ex)
    		{
    			System.out.println("第一筆資料？");
    			System.out.println("意外原因：" + ex.getMessage());
    		}
		}
		
		return maxnum;
	}
		
	private String PlusZero(int i , int how)
	{
		String ans = ""+i;
		
		while(ans.length()<how)
		{
			ans = "0" + ans;
		}
		
		return ans;
	}
		
	private int RanRank()
	{
		return (int) ((Math.random()*6));
	}
	
	private int RanIseat()
	{
		return (int) ((Math.random()*10%2));
	}
	
	private String RanDay(int type) throws Exception
	{
		String ans = "";
		
		SimpleDateFormat h1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		SimpleDateFormat h2 = new SimpleDateFormat("yyyy/MM/dd");
		
		String[] y1 = {"2011","2012"};
		String[] y2 = {"2013"};
		String[] y3 = {"2014","2015"};
		
		switch(type)
		{
			//新增日期
			case 1 :
				ans = GetArrayRan(y1) + "/" 
					+ GetNumRan(11) + "/"
					+ GetNumRan(11) + " "
					+ GetNumRan(23) + ":"
					+ GetNumRan(59) + ":" 
					+ GetNumRan(59) ;
				
				ans = h1.format(h1.parse(ans));
				
				break;
			//吃的日期
			case 2 :
				ans = GetArrayRan(y2) + "/" 
					+ GetNumRan(11) + "/"
					+ GetNumRan(11) + " "
					+ GetNumRan(23) + ":"
					+ GetNumRan(59) + ":" 
					+ GetNumRan(59) ;
				
				ans = h2.format(h2.parse(ans));
				
				break;
			//更新日期
			case 3 :
				ans = GetArrayRan(y3) + "/" 
					+ GetNumRan(11) + "/"
					+ GetNumRan(11) + " "
					+ GetNumRan(23) + ":"
					+ GetNumRan(59) + ":" 
					+ GetNumRan(59) ;
				
				ans = h1.format(h1.parse(ans));
				
				break;
			default :
				ans = "2012/01/02 12:59:59";
				break;
		}

		return ans;
	}
	
	private String GetArrayRan(String[] x1)
	{
		return x1[(int) (Math.random()*x1.length)];
	}
	
	private int GetNumRan(int x1)
	{
		return (int) (Math.random()*x1);
	}
	

}
