<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'biaozhunxiangmu.jsp' starting page</title>
    
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
	  /* text-align:center; */
	  margin-left:300px;
	}
    body,td,th {
	  font-size: 12px;
	  left: auto;
	  top: 3px;
	  right: auto;
	  bottom: 3px;
	}
	table  {
	  width:500px;
	  height:200px;
	}
	tr{
	  text-align:center;
	}
    </style>
    
    
    <script type="text/javascript" src="jquery-2.1.3.js"></script>
    <script type="text/javascript">
      var url=location.href;
      var tmp1=url.split("?")[1]; 
      var tmp2=tmp1;
      var data = {"standard":tmp2};
      var count = 0;
      
      function biaozhunxiangmu(){
         
          $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/gettm",
              data: data,
              success: function(jsonObject){
              
                 var s = "<table border='1'>";
                 s += "<tr><td>检测项目</td><td>项目内容</td></tr>";
                   $.each(jsonObject,function(key,value){
                    s += "<tr>";
                    s += "<td>"+key+"</td>";
                    s += "<td>"+value+"</td>"; 
                    s += "</tr>";
                   });  
                   s += "</table>";
                   $("#result").html(s);    
              },
              complete:function(){
              },
              global:true,
              error: function(){
                  alert("错误");
              }
            });
      }
      
    </script>
  </head>
  
  <body onload="biaozhunxiangmu()">
    <table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" height="185" >
 	  <tr>
   	    <td> 
   		    样品编号：<script>document.write(tmp2);</script>
    	</td>
  	  </tr>
  	</table>
  	<div id="result" ></div>
  	
  </body>
</html>