import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class gettm extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("gettm");
		//response.setContentType("text/html");
		/*JSONObject jsonObject = new JSONObject();
		jsonObject.put("检测内容0", "乙醇");
		jsonObject.put("检测内容1", "感官");
		jsonObject.put("检测内容2", "重金属");
		jsonObject.put("检测内容3", "脱色试验");*/
		/*return jsonObject.toString();*/
		String s= "{\"检测内容0\":\"蒸发残渣mg/L,4%乙酸,60℃,2h\",\"检测内容1\":\"蒸发残渣mg/L,65%乙醇,20℃,2h\",\"检测内容2\":\"感官\",\"检测内容3\":\"正己烷\"}";
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("application/json;charset=UTF-8");
//		response.getWriter().write(jsonObject.toString());
		response.getWriter().write(s);
		/*response.getWriter().flush();*/
		/*System.out.println(jsonObject.toString());*/
		System.out.println(s);
	}

}
