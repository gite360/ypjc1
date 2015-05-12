<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>获得检测内容</title>
    
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
	<script type="text/javascript" src="jquery-2.1.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
          $("button").click(function(){
          
            /* var t = $(":text[name='标准名称']").map(function(){return $(this).val(); }).get(); */
            /* var t = $(":text[name='标准名称']").val(); */ 
            var t = $("#标准名称").val();
            var data = {"standard":t};
            
            alert(JSON.stringify(data));
            $.ajax({
              dataType:"json",
              type: "POST",
              url: "/servlet/gettm",
              data: data,
              success: function(msg){
                  if (msg.status == true) {
						/* location.href = "login";  */
				      alert(msg.message);
				  }
				  if (msg.status == false) {
				      alert(msg.message);
				  }
              },
              
              complete:function(){
                
              },
              
              global:true,
              
              
            });
         });
        });
   </script>
  </head>
  
  <body>
    <table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width="770" height="185" >
 	 <tr>
 	   <td>
 	          获得标准所要检测地内容
 	   </td>
 	 </tr>
 	 <tr>
 	   <td>
 	           请输入标准名称：<input type="text" name="标准名称" id="标准名称" size = "3"/>
 	   </td>
 	 </tr>
 	 <tr>
       <td align="center"> 
         <button type="button">确认</button>        
       </td> 
  	 </tr>
	</table>
  </body>
</html>
