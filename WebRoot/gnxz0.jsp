<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'gnxz.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
    #title {
	font-size: 14px;
	font-style: normal;
	line-height: normal;
	font-weight: bold;
	font-variant: normal;
	text-align:center;
	}
    body,td,th {
	font-size: 12px;
	left: auto;
	top: 3px;
	right: auto;
	bottom: 3px;
	}
	table  {
	  width:770px;
	}
	tr{
	  text-align:center;
	}
    </style>
	<script language="JavaScript" src="zjs.js">
	
	</script>
  </head>
  
  <body>
    <table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width="770" height="185" >
 	 <tr>
 	   <td>
 	     <a href="gnxz1.jsp">001</a>
 	   </td>
 	 </tr>
 	 <tr>
 	   <td>
 	     <a href="gnxz2.jsp">002</a>
 	   </td>
 	 </tr>
 	 <tr>
 	   <td>
 	     <a href="gnxz3.jsp">003</a>
 	   </td>
 	 </tr>
	</table>
  </body>
</html>
