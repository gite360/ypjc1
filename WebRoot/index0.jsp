<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>样品检测</title>
    
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
	  height:100px;
	}
	tr{
	  text-align:center;
	}
	.container {
      width: 980px;
	  min-height:1080px;
      margin: 0 auto;
	  background-color:#A9D8F3;
	}
    </style>
    
    
    <script type="text/javascript" src="jquery-2.1.3.js"></script>
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
                 s += "<tr><td>检验内容ID</td><td>检验内容</td></tr>";
                   $.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据  
                    if(count%2 == 0){
                        s+="<tr>";
                        s += "<td> <input name=\"001\" type=\"checkbox\" value="+value+">"+value+"</td>";
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
                  alert(jsonObject.status);
                  if(jsonObject.status == success){
                      alert(jsonObject.status); 
                  }
                  if(jsonObject.status == fail){
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
    <br><br><br><br><br><br><br><br>
<table border="0" align="center">
  <tr>
    <th scope="col">
    	<a href="huodeyangpinxinxi.jsp">
    	<img src="source/1.png" width="300" height="300">
        </a>
    </th>
    <th scope="col">
    	<a href="diergeren.jsp">
    	<img src="source/2.png" width="300" height="300">
        </a>
    </th>
    <th scope="col">
    	<a href="disangeren3.jsp">
    	<img src="source/3.png" width="300" height="300">
        </a>
    </th>
  </tr>
  <tr>
    <td>
    <font size="5">
    	<a href="huodeyangpinxinxi.jsp" align="center">单日项目分配</a>
    </font>
    </td>
    <td>
    <font size="5">
        <a href="diergeren.jsp" align="center">样品分配</a>
    </font>
    </td>
    <td>
    <font size="5">
        <a href="disangeren3.jsp" align="center">生成原始记录</a>
    </font>
    </td>
  </tr>
  </table>
  </div>
  </body>
</html>
