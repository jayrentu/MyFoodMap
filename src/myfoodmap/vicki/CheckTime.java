package myfoodmap.vicki;

import javax.servlet.http.HttpSession;

public class CheckTime {

	@SuppressWarnings("unused")
	public boolean Add(String name,HttpSession session){

		boolean over=false;
		int i=0,j=0;
		Object value="";
		j=session.getServletContext().getAttribute(name)==null?0:(Integer)session.getServletContext().getAttribute(name);
		//		System.out.println(j);

		if(j<3){

			if (session.getServletContext().getAttribute(name) == null){  //不是寫在 web.xml
				session.getServletContext().setAttribute(name,++i);
			}
			else {
				if (session==null){
					value="false";
				}
				else {
					value=session.getAttribute("login")==null?"false":session.getAttribute("login");
				}

				if (!value.equals("true")){
					i=(Integer) session.getServletContext().getAttribute(name);
					session.getServletContext().setAttribute(name,++i);
					if (i==3 && name.contains("error")){
						over=true;
					}
				}
			}
			System.out.println("Perlogin - 增加後 Context "+name+" 為: "+session.getServletContext().getAttribute(name));

		}
		else {
			over=true;			
		}

		return over;
	}

	public void Remove(String account,HttpSession session){

		int j=0;
		j=session.getServletContext().getAttribute(account)==null?0:(Integer) session.getServletContext().getAttribute(account);
		
//		System.out.println("目前 Context"+account+" 有 "+j+" 個");

		if(j>0){
					session.getServletContext().setAttribute(account,--j);
					System.out.println("MyAttributeListener - 移除後 "+account+" Context 為: "+j+" 個");
		}
	}
}
