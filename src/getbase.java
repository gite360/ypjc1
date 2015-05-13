

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class getbase
 */
@WebServlet(description = "get ry", urlPatterns = { "/servlet/getbase" })
public class getbase extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s= "{\"基准恒重1\":\"60\",\"基准恒重2\":\"50\",\"基准恒重试剂空白1\":\"80\",\"基准恒重试剂空白2\":\"90\"}";
		System.out.println("getbase");
		/*PrintWriter out = response.getWriter();*/
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().write(s);
		System.out.println(s);
	}

}
