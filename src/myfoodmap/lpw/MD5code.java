package myfoodmap.lpw;

import java.security.MessageDigest;

/**
 * @author LPW
 * 
 * 把字串進行MD5方式加密的程式，僅能使用md5()這個方法進行使用
 * 將一個字串str以該方法輸入後，會回傳一個MD5的雜湊值字串
 * 
 * @str 輸入的字串
 * @md5 回傳的MD5加密結果，為一32碼的16進位數字
 * 
 **/

public class MD5code 
{
	public String md5(String str) 
	{	
	    String md5=null;
	    try {
	      MessageDigest md=MessageDigest.getInstance("MD5");
	      byte[] barr=md.digest(str.getBytes());  //將 byte 陣列加密
	      StringBuffer sb=new StringBuffer();  //將 byte 陣列轉成 16 進制
	      for (int i=0; i < barr.length; i++) {sb.append(byte2Hex(barr[i]));}
	      String hex=sb.toString();
	      md5=hex.toUpperCase(); //一律轉成大寫
	      }
	    catch(Exception e) {e.printStackTrace();}
	    return md5;
	}
	
	private String byte2Hex(byte b) 
	{
		  String[] h={"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"};
		  int i=b;
		  if (i < 0) {i += 256;}
		  return h[i/16] + h[i%16];
	}
		
}
