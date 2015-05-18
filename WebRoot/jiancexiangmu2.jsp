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
    
    <title>检测项目</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
	<style type="text/css"></style>
    
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script>
    <script type="text/javascript">
      var url = location.href;
      var tmp1 = url.split("?")[1]; 
      var tmp2 = tmp1.split("=");
      var temp;
      var data = {"no":tmp2[1]};
      var count = 0;
      var href =  "shezhitiaomujutixinxi2.jsp?"+tmp1+"&";
      function biaozhunxiangmu2(){
         alert(JSON.stringify(data));
         $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/gettm",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'>";
                 s += "<tr><td><font size='4'>检验项目</font></td><td><font size='4'>检验内容</font></td></tr>";
                   $.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据  
                    if(count%1 == 0){
                        s += "<tr>";
                     }
                     s += "<td width=\"150\">"+"<font size='4'>"+key+"</font>"+"</td>";
                     /* s += "<td>"+"<a href=\"shezhitiaomujutixinxi2.jsp?"+tmp2+"&"+value+ "\">"+value+"</td>"; */
                     /* value = encodeURI(value); */
                    /*  value = decodeURI(value); */
                     /* href += value; */
                     temp = value;
                     temp = encodeURI(temp);
                     s += "<td width=\"350\">"+"<a href="+href+"content="+temp+" \">"+"<font size='4'>"+value+"</font>"+"</td>"; 
                    count++;
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
  
  <body onload="biaozhunxiangmu2()">
  <div class="container">
    <div align="center">
    <img src="source/TITLE.jpg" width="980" height="150">
    </div>
    <hr>
    <div align="center">
    <br>
    <font size='6'>检测项目</font>
    <br>
    </div>
    <hr>
    <div align="center">
    <br>
    <font size="4">
		样品编号：<script>document.write(tmp2[1]);</script>
    </font>
    &nbsp; &nbsp;
        <input type="button" value="返回" onclick="javascript:history.go(-1);"/>
    <br>
    </div>
    <hr>
    <br>
  <div id="result" align="center"></div>
  </div>
  </body>
</html>
