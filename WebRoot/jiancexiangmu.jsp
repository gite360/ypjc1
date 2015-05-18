<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
      var url=location.href;
      var tmp1=url.split("?")[1]; 
      var tmp2=tmp1.split("&");
      var tmp3 = tmp2[0].split("=");
      var tmp4 = tmp2[1].split("=");
      var data = {"standard":tmp4[1]};
      var count = 0;
      function jiancexiangmu(){
         $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/getall",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'>";
                 s += "<tr><td width='150'><font size='4'>检验内容ID</font></td><td width='350'><font size='4'>检验内容</font></td></tr>";
                   $.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据  
                    if(count%2 == 0){
                        s+="<tr>";
                        s += "<td> <input name=\"001\" type=\"checkbox\" value="+value+">"+"<font size='4'>"+value+"</font>"+"</td>";
                     }
                     else{
                         s += "<td>"+"<font size='4'>"+value+"</font>"+"</td>";
                     }
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
      
      
      $(document).ready(function(){
          $("button").click(function(){
          
            var t = $(":checkbox[name='001']:checked").map(function(){return $(this).val(); }).get();
            var data = {"no":tmp3[1],"t":t};
             alert(JSON.stringify(data));  
            $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/settm",
              data: data,
              success: function(jsonObject){
                  /* var s = "<table border='1' width='500' height='100'>"; */
                 /*  alert(jsonObject.status); */
                  if(jsonObject.status == "success"){
                      alert(jsonObject.status); 
                  }
                  if(jsonObject.status == "fail"){
                      alert(jsonObject.status); 
                  }        				
              },
              
              error: function(){
                  alert("错误");
              }
            });
         });
        });
      
      
    </script>
    
  </head>
  
  <body onload="jiancexiangmu()">
    <div class="container">
    <div align="center">
      <img src="source/TITLE.jpg" width="980" height="150"> 
      </div>
    <hr>
    <div align="center">
    <br>
    	<font size="6">检测项目</font>
        <br>
    </div>
    <hr>
    <div align="center">
    <br>
    	<font size="4">
    	样品编号:<script>document.write(tmp3[1]);</script>
        &nbsp; &nbsp;
        标准编号:<script>document.write(tmp4[1]);</script>
        &nbsp; &nbsp;
        </font>
    	<button type="button">确认</button>  
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
