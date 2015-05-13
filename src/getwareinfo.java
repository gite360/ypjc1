

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class getwareinfo
 */
@WebServlet(description = "获得某器皿的称重数据", urlPatterns = { "/servlet/getwareinfo" })
public class getwareinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getwareinfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s= "{\"恒重1\":\"70\",\"恒重2\":\"60\",\"恒重样品1\":\"90\",\"恒重样品2\":\"100\"}";
		System.out.println("getwareno");
		/*PrintWriter out = response.getWriter();*/
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().write(s);
		System.out.println(s);
	}

}
