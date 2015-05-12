<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shezhitiaomujutixinxi2.jsp' starting page</title>
    
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
      /* url = decodeURI(url); */
      var tmp1 = url.split("?")[1]; 
      var tmp2 = tmp1.split("&");
      var tmp3 = tmp2[0].split("=");
      var tmp4 = tmp2[1].split("=");
      /* var data = {"standard":tmp4[1]}; */
      var temp;
      tmp4[1] = decodeURI(tmp4[1]);
     /*  var test = new String(request.getParameter("url").getBytes("8859_1")); */
      /* function biaozhunxiangmu2(){
          $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/gettmnr",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'>";
                
                 //$.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据
                   s += "<tr>";
                   //temp = value;
                   //s += "<td>"+"检测内容："+value+"</td>";
                   s += "<td>"+"检测内容："+tmp2[1]+"</td>";
                   s += "</tr>";
                   $("#result").html(s); 
                 //});    
              },
              complete:function(){
              },
              global:true,
              error: function(){
                  alert("错误");
              }
            });
      } */
      
      $(document).ready(function(){
          $("button").click(function(){
            /* var t = $(":text[name='标准名称']").map(function(){return $(this).val(); }).get(); */
            /* var t = $(":text[name='标准名称']").val(); */ 
            /* var t = $("#日期").val(); */
            var num = $("#样品数量").val();
            var s1 = $("#浸泡面积1").val();
            var v1 = $("#浸泡体积1").val();
            var wareno1 = $("#器皿编号1").val();
            var s2 = $("#浸泡面积2").val();
            var v2 = $("#浸泡体积2").val();
            var wareno2 = $("#器皿编号2").val();
            var data = {"no":tmp3[1],"num":num,"content":tmp4[1],"s1":s1,"s2":s2,"v1":v1,"v2":v2,"wareno1":wareno1,"wareno2":wareno2,};
            /* var count = 0; */
             alert(JSON.stringify(data)); 
            $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/setinfo",
              data: data,
              success: function(jsonObject){
                 alert(jsonObject.status);
              },
              
              complete:function(){
              },
              global:true,
            });
         });
        });
      
    </script>
  </head>
  
  <!-- <body onload="biaozhunxiangmu2()"> -->
    <body>
    <table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" height="185" >
 	  <tr>
   	    <td colspan="2"> 
   		    设置检测条目的具体信息
    	</td>
  	  </tr>
 	  <tr>
   	    <td colspan="2"> 
   		    样品编号：<script>document.write(tmp3[1]);</script>
    	</td>
       </tr>
       <tr>
   	    <td colspan="2"> 
   		    检测内容：<script>document.write(tmp4[1]);</script>
    	</td>
       </tr>
    	<tr>
  		  <td>
    	        请输入样品数量：<input type="text" name="样品数量" id="样品数量" size = "3"/>
    	  </td>
    	  <td> 
                <button type="button">确认</button>        
           </td> 
  		</tr>
  		<tr>
  		  <td>
    	        请输入浸泡面积1：<input type="text" name="浸泡面积1" id="浸泡面积1" size = "3"/>
    	  </td>
    	  <td>
    	        请输入浸泡面积2：<input type="text" name="浸泡面积2" id="浸泡面积2" size = "3"/>
    	  </td>
  		</tr>
  		<tr>
  		  <td>
    	        请输入浸泡体积1：<input type="text" name="浸泡体积1" id="浸泡体积1" size = "3"/>
    	  </td>
    	  <td>
    	        请输入浸泡体积2：<input type="text" name="浸泡体积2" id="浸泡体积2" size = "3"/>
    	  </td>
  		</tr>
  		<tr>
  		  <td>
    	        请输入器皿编号1：<input type="text" name="器皿编号1" id="器皿编号1" size = "3"/>
    	  </td>
    	  <td>
    	        请输入器皿编号2：<input type="text" name="器皿编号2" id="器皿编号2" size = "3"/>
    	  </td>
  		</tr>
  	</table>
  	<div id="result" ></div>
  </body>
</html>
