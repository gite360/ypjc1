import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


public class gettask extends HttpServlet {

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
		String s= "{\"产品编号0\":\"1\",\"产品名称0\":\"橡胶奶嘴\",\"标准编号0\":\"3\",\"样品数量0\":\"3\",\"产品编号1\":\"2\",\"产品名称1\":\"铁锤\",\"标准编号1\":\"2\",\"样品数量1\":\"5\"}";
		String s1= "{ \"样品编号0\":\"W01507100019\",\"样品名称0\":\"PE低发泡片\",\"标准名称0\":\"9687\",\"样品数量0\":\"10\",\"样品编号1\":\"W01507100020\",\"样品名称1\":\"灶台（远红外辐热炉）标配锅具\",\"标准名称1\":\"9687\",\"样品数量1\":\"10\",\"样品编号2\":\"W01507100054\",\"样品名称2\":\"聚碳酸酯树脂\",\"标准名称2\":\"13116\",\"样品数量2\":\"10\",\"样品编号3\":\"W01507110036\",\"样品名称3\":\"PVC托盘\",\"标准名称3\":\"9681\",\"样品数量3\":\"10\"} ";

		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("application/json;charset=UTF-8");
//		response.getWriter().write(jsonObject.toString());
		response.getWriter().write(s1);
		/*response.getWriter().flush();*/
		/*System.out.println(jsonObject.toString());*/
		/*System.out.println(s);*/
	}

}
