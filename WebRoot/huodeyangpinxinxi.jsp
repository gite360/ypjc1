<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'huodeyangpinxinxi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
	    table  {
	        width:500px;
	    }
	</style>
	
    <script type="text/javascript" src="jquery-2.1.3.js"></script>
    <script type="text/javascript">
        
        $(document).ready(function(){
          $("button").click(function(){
            /* var t = $(":text[name='日期']").map(function(){return $(this).val(); }).get(); */
            /* var t = $(":text[name='标准名称']").val(); */ 
            var t = $("#日期").val();
            var data = {"date":t};
            var count = 0;
            /*  alert(JSON.stringify(data));  */
              /* alert(data);   */
            var temp;
            $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/gettask",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'  height='100'>";
                 s += "<tr><td>产品编号</td><td>产品名称</td><td>标准编号</td><td>样品数量</td></tr>";
                  /* for(i = ) */
                   $.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据  
                    /* alert(i); */
                   
                     if(count%4 == 0){
                        s+="<tr>";
                       /*  s += "<td>"+"<a href=\"jiancexiangmu.jsp?"+value+ "\">"+value+"</td>"; */
                        s += "<td>"+value+"</td>";
                        temp = value;
                     }
                    /*  else if(count%4 == 2){
                         s += "<td>"+"<a href=\"biaozhunxiangmu.jsp?"+value+ "\">"+value+"</td>";
                     } */
                     else if(count%4 == 2){
                        s += "<td>"+"<a href=\"jiancexiangmu.jsp?no="+temp+"&standard="+value+"\">"+value+"</td>";
                     }
                     else{
                         s += "<td>"+value+"</td>";
                     }   
                      
                    count++;
                   });  
                   s += "</table>";
                   $("#result").html(s);    
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
    <table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" height="300" >
  		<tr>
  		  <td align="center"  width="170" >
    	        第一个人：设置检测条目
    	  </td>
  		</tr>
  		<tr>
  		  <td align="center"  width="170" >
    	        请输入日期：<input type="text" name="日期" id="日期" size = "3"/>
    	  </td>
  		</tr>
  		<tr>
  		  <td align="center" width="100"> 
                <button type="button">确认</button>        
            </td> 
  		</tr>
  	</table>
  	<div id="result" ></div>
  </body>
</html>
