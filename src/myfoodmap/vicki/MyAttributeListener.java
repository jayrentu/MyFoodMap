package myfoodmap.vicki;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
 
public class MyAttributeListener implements HttpSessionAttributeListener {
 
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		String Name = event.getName();
		Object Value = event.getValue();
		System.out.println("Attribute added : " + Name + " : " + Value);
	}
 
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		String Name = event.getName();
		Object Value = event.getValue();
		HttpSession session = event.getSession();
		CheckTime checktime = new CheckTime();
		
			if (Name.equals("account")){
				checktime.Remove((String)Value,session);
		    }
			
		System.out.println("Attribute removed : " + Name + " : " + Value+"  "+session.getId());
	}
 
	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		String Name = event.getName();
		Object Value = event.getValue();
		System.out.println("Attribute replaced : " + Name + " : " + Value);	
	}

}