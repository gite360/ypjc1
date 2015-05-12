<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tiaomu0.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript" src="jquery-2.1.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
          $("button").click(function(){
          
            var t = $(":checkbox[name='001']:checked").map(function(){return $(this).val(); }).get();
            var data = {"no":"001","t":t};
            
            
           
            alert(JSON.stringify(data));
            $.ajax({
              dataType:"json",
              type: "POST",
              url: "/ypjc/servlet/settm",
              data: data,
              success: function(jsonObject){
                  
                  var s = "<table border='1' width='500' height='100'>";
                  /* for(i = ) */
                   $.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据  
                    /* alert(i); */
                    count = 1;
                     if(count%4 == 0){
                        s+="<tr>";
                        
                     }   
                    s += "<td width=\"200\">"+value+"</td>";  
                    
                    count++;
                   });  
                   s += "</table>";
                   $("#result").html(s);      				
            }
            });
         });
        });
   </script>
  </head>
  
  <body>
     <table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" height="300" >
  		<tr>
  		  <td align="center"  width="170" rowspan="3">
    		样品编号：001
    	  </td>
    	  <td align="center">
    	          条目id
    	  </td>
  		</tr>
  		<tr>
    		<td align="center" width="100">
        	  <input name="001" type="checkbox" value="1">001
              <input name="001" type="checkbox" value="2">002
              <input name="001" type="checkbox" value="3">003
              <input name="001" type="checkbox" value="4">004
              <input name="001" type="checkbox" value="5">005
              <input name="001" type="checkbox" value="6">006
              
        	</td>
  		</tr>
  		<tr>
          <td align="center" width="100"> 
            <button type="button">确认</button>        
          </td> 
  		</tr>
  	</table>
  	
  </body>
</html>
