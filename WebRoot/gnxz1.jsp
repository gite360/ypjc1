<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'gnxz1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script language="JavaScript" src="gnxz1.js">
	  function gnxz1(){
	    window.location.href='gnxz2.jsp';  
      }
	</script>
  </head>
  
  <body>
    <table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" height="300" >
  		<tr>
    		<td align="center"  width="170">
    		    001
    		</td>
    		<td align="center" width="100">
        	  <input name="001" type="checkbox" value="1">1
              <input name="001" type="checkbox" value="2">2
              <input name="001" type="checkbox" value="3">3
              <input name="001" type="checkbox" value="4">4
              <input name="001" type="checkbox" value="5">5
              <input  type="button" onclick="gnxz1()" value="确认">
        	</td>
    		
  		</tr>
  	</table>
  </body>
</html>
