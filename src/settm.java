import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


public class settm extends HttpServlet {

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        /*System.out.println("SSSSSSSSSSSSSSSSSSSSSSSSSS");*/
		//response.setContentType("text/html");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("标准id0", "1");
		jsonObject.put("检验内容1", "李磊");
		jsonObject.put("标准id1", "2");
		jsonObject.put("检验内容2", "好的");
		/*return jsonObject.toString();*/
		String s= "{\"status\":\"success\"}";
		String s1= "{\"status\":\"fail\"}";
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("application/json;charset=UTF-8");
//		response.getWriter().write(jsonObject.toString());
		response.getWriter().write(s);
		/*response.getWriter().flush();*/
		/*System.out.println(jsonObject.toString());*/
		/*System.out.println(s);*/
	}


}
