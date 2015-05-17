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
	
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<style type="text/css"></style>
    
    
    <script type="text/javascript" src="jquery-2.1.3.js"></script>
    <script type="text/javascript" >
    
     /*  var url = decodeURI(location.href);
      alert(url); //检查是否有URL乱码
      var tmp1 = url.split("?")[1]; 
      var tmp2 = tmp1.split("=");
      var temp; */
      var count = 0;
      /* function getQueryString(url){//获得URL参数
    	  var queryString = window.location.search;
    	  var parameters = queryString.split("&");
    	  var pos, paraName, paraValue;
    	  for(var i=0; i<parameters.length; i++){
    		  // 获取等号位置
    		  pos = parameters[i].indexOf('=');
    		  if(pos == -1) { continue; }
        	  return queryString;
        	  // 获取name 和 value
      		  paraName = parameters[i].substring(0, pos);
      		  paraValue = parameters[i].substring(pos + 1);
    	  }
    	  
      } */
      
      function requestURLParameter(strParame) { //获得URL参数
    	  var args = new Object( ); 
    	  var query = location.search.substring(1); 

    	  var pairs = query.split("&"); // Break at ampersand 
    	  for(var i = 0; i < pairs.length; i++) { 
    	  var pos = pairs[i].indexOf('='); 
    	  if (pos == -1) continue; 
    	  var argname = pairs[i].substring(0,pos); 
    	  var value = pairs[i].substring(pos+1); 
    	  value = decodeURIComponent(value); 
    	  args[argname] = value; 
    	  } 
    	  return args[strParame]; 
       } 
      /* alert(requestURLParameter('standard')); 测试*/
      
      /* var href =  "huodetiaomujutixinxi3.jsp?"+tmp1+"&"; */
      /* var href = "href=huodetiaomujutixinxi3.jsp?no="+requestURLParameter('no')+"&sampleName="+requestURLParameter('sampleName')+"&standard="+requestURLParameter('standard');  */
      /* var href = "href=zfczysjl1.jsp?no="+requestURLParameter('no')+"&sampleName="+requestURLParameter('sampleName')+"&standard="+requestURLParameter('standard'); */
      
      var data = {"no":requestURLParameter('no')};
      function biaozhunxiangmu2(){
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
                     /* temp = value;
                     temp = encodeURI(temp); */
                     var href = "href=zfczysjl1.jsp?no="+requestURLParameter('no')+"&sampleName="+requestURLParameter('sampleName')+"&standard="+requestURLParameter('standard');
                     href += "&content=" + value;
                     href = encodeURI(href);
                     /* s += "<td>"+"<a href="+href+"content="+temp+" \">"+value+"</td>";  */
                     /* s += "<td>"+"<a "+href+" \"&content="+temp+" \">"+value+"</td>"; */  
                     s += "<td>"+"<a "+href+">"+"<font size='4'>"+value+"</font>"+"</td>";
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
    <font size='4'>
    	样品编号：<script>document.write(requestURLParameter('no'));</script>
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
