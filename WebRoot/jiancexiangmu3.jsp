<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%-- <%@ page contentType="text/html; charset=UTF-8" %> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jiancexiangmu2.jsp' starting page</title>
    
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
      var href = "href=huodetiaomujutixinxi3.jsp?no="+requestURLParameter('no')+"&sampleName="+requestURLParameter('sampleName')+"&standard="+requestURLParameter('standard');
      var data = {"no":requestURLParameter('no')};
      function biaozhunxiangmu2(){
         $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/gettm",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'>";
                 s += "<tr><td>检验项目</td><td>检验内容</td></tr>";
                   $.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据  
                    if(count%1 == 0){
                        s += "<tr>";
                     }
                     s += "<td>"+key+"</td>";
                     /* s += "<td>"+"<a href=\"shezhitiaomujutixinxi2.jsp?"+tmp2+"&"+value+ "\">"+value+"</td>"; */
                     /* value = encodeURI(value); */
                     /*  value = decodeURI(value); */
                     /* href += value; */
                     /* temp = value;
                     temp = encodeURI(temp); */
                     href += "&content=" + value;
                     /* s += "<td>"+"<a href="+href+"content="+temp+" \">"+value+"</td>";  */
                     /* s += "<td>"+"<a "+href+" \"&content="+temp+" \">"+value+"</td>"; */  
                     s += "<td>"+"<a "+href+">"+value+"</td>";
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
    <table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" height="185" >
 	  <tr>
   	    <td> 
   		    样品编号：<script>document.write(requestURLParameter('no'));</script>
    	</td>
  	  </tr>
  	</table>
  	<div id="result" ></div>
  	
  </body>
</html>
