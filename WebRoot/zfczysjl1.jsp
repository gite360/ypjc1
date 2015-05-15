<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>蒸发残渣原始记录</title>
	<meta http-equiv="Content-Type" content="textml; charset=UTF-8">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    
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
	<!-- <script language="JavaScript" src="zjs.js"></script> -->
	<script type="text/javascript" src="jquery-2.1.3.js"></script>
    <script type="text/javascript">
      
      var url=location.href;
      /* url = decodeURI(url); */
      var tmp1 = url.split("?")[1]; 
      var tmp2 = tmp1.split("&");
      var tmp3 = tmp2[0].split("=");//样品编号
      var tmp4 = tmp2[1].split("=");//检测内容
      var data = {"no":tmp3[1],"content":tmp4[1]};
      var contentArray;//检测内容数组
      var ryData;//溶液类型
      var temp;
      var count0 = 0;//计数器
      tmp4[1] = decodeURI(tmp4[1]);
      var wareno1;
      var wareno2;
      
    
      
     /*  var test = new String(request.getParameter("url").getBytes("8859_1")); */
     
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
     
      /*  alert(requestURLParameter('content')); //测试上面的函数  */
       
       /* alert(contentArray[0]); */
     function allSettedInfo(){
         /* tiaomujutijinxi(); */
         aaa();
         getItemSpecificInfo();
         getWareReagentWeight();
         
         /* getWaretWeight(); */
     }
     
     function aaa(){
    	 var aa = document.getElementById("s1").innerHTML;
 	     alert(aa);
     }
     $(document).ready(function(){//提前预选复选框
    	 
    	 contentArray = requestURLParameter('content').split(",");//content的内容保存在数组里
    	 $("input[name='checkbox']").each(function(){//获得检测标准
        	 if($(this).val()==requestURLParameter('standard')){
        		 $(this).attr("checked", true);
        	 }
         });
    	 
    	 
    	 $("input[name='jyxm']").each(function(){//获得检测内容
        	 if($(this).val() == contentArray[1]){
        		 /* alert($(this).val()); */
        		 $(this).attr("checked", true); 
        	 }
        	 if($(this).val() == contentArray[2]){
        		 /* alert($(this).val()); */
        		 $(this).attr("checked", true); 
        	 }
        	 if($(this).val() == contentArray[3]){
        		 /* alert($(this).val()); */
        		 $(this).attr("checked", true); 
        	 }
    	     /* count0++; */
         });
    	 
     });
     
     
     function getItemSpecificInfo(){//获得条目具体信息
    	 var SpecificInfoData = {"no":requestURLParameter('no'),"content":requestURLParameter('content')};
    	 /* alert(JSON.stringify(SpecificInfoData)); */
    	
    	 $.ajax({
             dataType:"json",
             type: "POST",
             url: "servlet/getinfo",
             data: SpecificInfoData,
             
             success: function(jsonObject){
            	var s1,s2,v1,v2,num;
                  s1 = jsonObject.s1;
                  s2 = jsonObject.s2;
                  v1 = jsonObject.v1;
                  v2 = jsonObject.v2;
                  num = jsonObject.num;
                  wareno1 = jsonObject.器皿编号1;
                  wareno2 = jsonObject.器皿编号2;
                  
                  $("#s1").html(s1); 
                  $("#s2").html(s2);
                  $("#v1").html(v1); 
                  $("#v2").html(v2);
                  $("#num").html(num);
                  
                 
                  
                  ///////
                  
                  
                  ryData = {"wareno":wareno1};
    	
    	 $.ajax({
             dataType:"json",
             type: "POST",
             url: "servlet/getwareinfo",
             data: ryData,
             success: function(jsonObject){
            	var Weight1 = jsonObject.恒重1; 
            	var Weight2 = jsonObject.恒重2;
            	var WeightSample1 = jsonObject.恒重样品1;
            	var WeightSample2 = jsonObject.恒重样品2;
            	var m3a1, m3a2, m4a1, m4a2;
            	
            	m3a1 = Weight2/2 + Weight1/2;
            	m3a2 = Weight2/2 + Weight1/2;
            	
            	$("#hz1a1").html(Weight1); 
                $("#hz1a2").html(Weight1);
                /* $("#hz1b1").html(Weight2);  */
               /*  $("#hz1b2").html(Weight2); */
                
                $("#hz2a1").html(Weight2); 
                $("#hz2a2").html(Weight2);
               /*  $("#hz2b1").html(Weight2); 
                $("#hz2b2").html(Weight2); */
                
                $("#m3a1").html(m3a1); 
                $("#m3a2").html(m3a2);
                /* $("#m3b1").html(m3b);
                $("#m3b2").html(m3b); */
                
                
                m4a1 = WeightSample2/2 + WeightSample1/2;
                m4a2 = WeightSample2/2 + WeightSample1/2;
            	
                $("#hzyp1a1").html(WeightSample1); 
                $("#hzyp2a1").html(WeightSample2);
               /*  $("#hzyp1b1").html(WeightSample2); 
                $("#hzyp1b2").html(WeightSample2); */
                
                $("#hzyp1a2").html(WeightSample1); 
                $("#hzyp2a2").html(WeightSample2);
               /*  $("#hzyp2b1").html(WeightSample2); 
                $("#hzyp2b2").html(WeightSample2); */
                
                $("#m4a1").html(m4a1); 
                $("#m4a2").html(m4a2);
                /* $("#m4b1").html(m4b);
                $("#m4b2").html(m4b); */
                
                
               /*  $("#jzhzsjkb1a").html(standardWeightAReagent1); 
                $("#jzhzsjkb1b").html(standardWeightAReagent1);
                $("#jzhzsjkb2a").html(standardWeightAReagent2); 
                $("#jzhzsjkb2b").html(standardWeightAReagent2);
                $("#m2a").html(m2a); 
                $("#m2b").html(m2b); */
             },
             complete:function(){
             },
             global:true,
             error: function(){
                 alert("错误");
             }
           });
    	 
    	 ryData = {"wareno":wareno2};
    	 $.ajax({
             dataType:"json",
             type: "POST",
             url: "servlet/getwareinfo",
             data: ryData,
             success: function(jsonObject){
            	var Weight1 = jsonObject.恒重1; 
            	var Weight2 = jsonObject.恒重2;
            	var WeightSample1 = jsonObject.恒重样品1;
            	var WeightSample2 = jsonObject.恒重样品2;
            	var m3b1, m3b2, m4b3, m4b4;
            	
            	m3b = Weight2/2 + Weight1/2;
            	
            	
            	
                $("#hz1b1").html(Weight1); 
                $("#hz1b2").html(Weight1);
                
                
                $("#hz2b1").html(Weight2); 
                $("#hz2b2").html(Weight2);
                
                
                $("#m3b1").html(m3b);
                $("#m3b2").html(m3b);
                
                
                m4b = WeightSample2/2 + WeightSample1/2;
            	
                $("#hzyp1b1").html(WeightSample1); 
                $("#hzyp1b2").html(WeightSample1);
                
               
                $("#hzyp2b1").html(WeightSample2); 
                $("#hzyp2b2").html(WeightSample2);
                
               
                $("#m4b1").html(m4b);
                $("#m4b2").html(m4b);
                
                
               /*  $("#jzhzsjkb1a").html(standardWeightAReagent1); 
                $("#jzhzsjkb1b").html(standardWeightAReagent1);
                $("#jzhzsjkb2a").html(standardWeightAReagent2); 
                $("#jzhzsjkb2b").html(standardWeightAReagent2);
                $("#m2a").html(m2a); 
                $("#m2b").html(m2b); */
                
                var aa = document.getElementById("s1").innerHTML;
        	     alert(aa);
             },
             complete:function(){
             },
             global:true,
             error: function(){
                 alert("错误");
             }
           });
                  
                  ///////
                  
             },
             
             complete:function(){
             },
             global:true,
             error: function(){
                 alert("回调函数错误");
             }
           });
    	 
     }
    
     
     function getWareReagentWeight(){//获得器皿试剂信息
    	 var aa = document.getElementById("s1").innerHTML;
	     alert(aa);
    	 ryData = {"ry":contentArray[1]};
    	 $.ajax({
             dataType:"json",
             type: "POST",
             url: "servlet/getbase",
             data: ryData,
             success: function(jsonObject){
            	var standardWeight1 = jsonObject.基准恒重1; 
            	var standardWeight2 = jsonObject.基准恒重2;
            	var standardWeightAReagent1 = jsonObject.基准恒重试剂空白1;
            	var standardWeightAReagent2 = jsonObject.基准恒重试剂空白2;
            	var m0a, m0b, m2a, m2b;
            	m0a = standardWeight2/2 + standardWeight1/2;
            	m0b = m0a;
            	m2a = standardWeightAReagent2/2 + standardWeightAReagent1/2;
            	m2b = m2a
            	$("#jzhz1a").html(standardWeight1); 
                $("#jzhz1b").html(standardWeight1);
                $("#jzhz2a").html(standardWeight2); 
                $("#jzhz2b").html(standardWeight2);
                $("#m0a").html(m0a); 
                $("#m0b").html(m0b);
                
                
                $("#jzhzsjkb1a").html(standardWeightAReagent1); 
                $("#jzhzsjkb1b").html(standardWeightAReagent1);
                $("#jzhzsjkb2a").html(standardWeightAReagent2); 
                $("#jzhzsjkb2b").html(standardWeightAReagent2);
                $("#m2a").html(m2a); 
                $("#m2b").html(m2b);
                
                
             },
             complete:function(){
             },
             global:true,
             error: function(){
                 alert("错误");
             }
           });
     }
   
     /*
     function getWaretWeight(){//获得某器皿的称重数据
    	 ryData = {"wareno":wareno1};
    	 alert(wareno1);
    	 $.ajax({
             dataType:"json",
             type: "POST",
             url: "servlet/getwareinfo",
             data: ryData,
             success: function(jsonObject){
            	var Weight1 = jsonObject.恒重1; 
            	var Weight2 = jsonObject.恒重2;
            	var WeightSample1 = jsonObject.恒重样品1;
            	var WeightSample2 = jsonObject.恒重样品2;
            	var m3a1, m3a2, m4a1, m4a2;
            	
            	m3a1 = Weight2/2 + Weight1/2;
            	m3a2 = Weight2/2 + Weight1/2;
            	
            	$("#hz1a1").html(Weight1); 
                $("#hz1a2").html(Weight1);
               
                
                $("#hz2a1").html(Weight2); 
                $("#hz2a2").html(Weight2);
              
                
                $("#m3a1").html(m3a1); 
                $("#m3a2").html(m3a2);
              
                
                
                m4a1 = WeightSample2/2 + WeightSample1/2;
                m4a2 = WeightSample2/2 + WeightSample1/2;
            	
                $("#hzyp1a1").html(WeightSample1); 
                $("#hzyp2a1").html(WeightSample2);
             
                $("#hzyp1a2").html(WeightSample1); 
                $("#hzyp2a2").html(WeightSample2);
              
                $("#m4a1").html(m4a1); 
                $("#m4a2").html(m4a2);
               
             },
             complete:function(){
             },
             global:true,
             error: function(){
                 alert("错误");
             }
           });
    	 
    	 ryData = {"wareno":wareno2};
    	 $.ajax({
             dataType:"json",
             type: "POST",
             url: "servlet/getwareinfo",
             data: ryData,
             success: function(jsonObject){
            	var Weight1 = jsonObject.恒重1; 
            	var Weight2 = jsonObject.恒重2;
            	var WeightSample1 = jsonObject.恒重样品1;
            	var WeightSample2 = jsonObject.恒重样品2;
            	var m3b1, m3b2, m4b3, m4b4;
            	
            	m3b = Weight2/2 + Weight1/2;
            	
            	
            	
                $("#hz1b1").html(Weight1); 
                $("#hz1b2").html(Weight1);
                
                
                $("#hz2b1").html(Weight2); 
                $("#hz2b2").html(Weight2);
                
                
                $("#m3b1").html(m3b);
                $("#m3b2").html(m3b);
                
                
                m4b = WeightSample2/2 + WeightSample1/2;
            	
                $("#hzyp1b1").html(WeightSample1); 
                $("#hzyp1b2").html(WeightSample1);
                
               
                $("#hzyp2b1").html(WeightSample2); 
                $("#hzyp2b2").html(WeightSample2);
                
               
                $("#m4b1").html(m4b);
                $("#m4b2").html(m4b);
                
             
             },
             complete:function(){
             },
             global:true,
             error: function(){
                 alert("错误");
             }
           });
     }*/
     
     
     
     /* alert(str); */
     /* $("#dd").val(str) */
    
     
     /* alert($(":checkbox[name='checkbox']").val()); */
     /*  function tiaomujutijinxi(){
          $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/getinfo",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'>";
                
                
                   s += "<tr>";
                  
                   s += "<td>浸泡面积</td>"+"<td>"+jsonObject.s1+"</td>"+"<td>"+jsonObject.s2+"</td>";
                   s += "</tr>";
                   s += "<tr>";
                   s += "<td>浸泡体积</td>"+"<td>"+jsonObject.v1+"</td>"+"<td>"+jsonObject.v2+"</td>";
                   s += "</tr>";
                   s += "<tr>";
                   s += "<td>器皿编号</td>"+"<td>"+jsonObject.wareno1+"</td>"+"<td>"+jsonObject.wareno2+"</td>";
                   s += "</tr>";
                   $("#result0").html(s); 
                   
              },
              complete:function(){
              },
              global:true,
              error: function(){
                  alert("错误");
              }
            });
      } */
      
    //获得某器皿的称重数据
       /* function showWareWeight(){
          $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/getwareinfo",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'>";
                   s += "<tr>";
                   s += "<td>浸泡面积</td>"+"<td>"+jsonObject.s1+"</td>"+"<td>"+jsonObject.s2+"</td>";
                   s += "</tr>";
                   s += "<tr>";
                   s += "<td>浸泡体积</td>"+"<td>"+jsonObject.v1+"</td>"+"<td>"+jsonObject.v2+"</td>";
                   s += "</tr>";
                    s += "<tr>";
                   s += "<td>器皿编号</td>"+"<td>"+jsonObject.wareno1+"</td>"+"<td>"+jsonObject.wareno2+"</td>";
                   s += "</tr>";
                   $("#result0").html(s); 
              },
              complete:function(){
              },
              global:true,
              error: function(){
                  alert("错误");
              }
            });
      }  */
      
      /* $(document).ready(function(){
          $("button").click(function(){
           
            var num = $("#样品数量").val();
            var s1 = $("#浸泡面积1").val();
            var v1 = $("#浸泡体积1").val();
            var wareno1 = $("#器皿编号1").val();
            var s2 = $("#浸泡面积2").val();
            var v2 = $("#浸泡体积2").val();
            var wareno2 = $("#器皿编号2").val();
            var data = {"no":tmp3[1],"num":num,"content":tmp4[1],"s1":s1,"s2":s2,"v1":v1,"v2":v2,"wareno1":wareno1,"wareno2":wareno2,};
           
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
        }); */
      
    </script>
</head>
<body onload = "allSettedInfo()">
	<div  class="container" align="center">
    <div align="center">
      <img src="source/TITLE.jpg" width="980" height="150"> </div>
    <hr>
	  <table width="770" border="0" bgcolor="#ffffff">
      	<tr>
        <td colspan="2" align="center">
        <br><h1>蒸发残渣原始记录</h1></br>
        </td>
        </tr>
		  <tr>
		    <td colspan="2" align="right">
            No:
            <input id="id" type="text" size="3">
            </td>
	      </tr>
		  <tr>
		    <td align="left">&nbsp; &nbsp;选择适用的在□内打“√”</td>
		    <td align="right">第&nbsp; &nbsp;页</td>
	      </tr>
</table>
		<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width="770" height="145" >
 			<tr>
   				<td width="78" height="83" align="center"> 
    				<p> 样品简称</p>
    				<p>（必要时）</p>
    			</td>
    			<td width="201">
       					<!-- <input type="text" name="名称" id="name" style="width:198px; height:25px;"/> -->
       					<script>document.write(requestURLParameter('sampleName'));</script>
    			</td>
    			<td width="17" rowspan="2" align="center">检验依据</td>
			  <td width="463" rowspan="2" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <table width="463" height="118" border="0">
                          <tr>
                            <td width="25%" height="25" align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="9681"/>
                            GB9681-1988</td>
                            <td width="25%" align="left" ><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="9683"/>
                            GB9683-1988</td>
                            <td width="25%" align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="9687"/>
                            GB9687-1988</td>
                            <td width="25%" align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="9688"/>
GB9688-1988</td>
                          </tr>
                          <tr>
                            <td height="25" align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="9689"/>
                            GB9689-1988</td>
                            <td align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="9690"/>
                            GB9690-2009</td>
                            <td align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="13113"/>
                            GB13113-1991</td>
                            <td align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="14942"/>
                            GB14942-1994</td>
                          </tr>
                          <tr>
                            <td height="25" align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="17326"/>
                            GB17326-1998</td>
                            <td align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="17327"/>
                            GB17327-1998</td>
                            <td align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="4806.1"/>
                            GB4806.1-1994</td>
                            <td align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="4806.2"/>
                            GB4806.2-1994</td>
                  </tr>
                          <tr>
                            <td height="25" align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="16332"/>
                            GB16332-1996</td>
                            <td align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="T5009"/>
GB/T5009.</td>
                            <td align="left"><input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value=""/></td>
                            <td></td>
                          </tr>
                </table>
   			  </td>
		  </tr>
  			<tr>
    			<td height="60" align="center">样品数量分配</td>
    			<td>
        			<!-- <input type="text" name="数量" id="num"  style="width:198px; height:30px;"/> -->
        			<div id="num" >样品数量</div>
   			  </td>
		  </tr>
</table>
		
<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width="770" height="123" >
  		<tr>
   			<td width="154" height="22" align="center">仪器名称及规格型号</td>
    		<td width="153" align="center">仪器编号</td>
    		<td width="192" align="center">仪器检定有效期</td>
    		<td width="132" align="center">使用参数</td>
    		<td width="125" align="center">检定地点</td>
  </tr>
  		<tr>
    		<td align="center">
   		      <input type="text" name="名称及型号1" id="名称及型号1" size = "15"/>
    		</td>
    		<td align="center">
       		  <input type="text" name="编号1" id="编号1" size = "15"/>
        	</td>
    		<td align="center">
       		  <input type="text" name="有效期1" id="有效期1" size = "15"/>
        	</td>
    		<td align="center">
       		  <input type="text" name="参数1" id="参数1" size = "15"/>
        	</td>
    		<td align="center">
       		  <input type="text" name="地点1" id="地点1" size = "15"/>
        	</td>
  		</tr>
  		<tr>
    		<td align="center">
   		      <input type="text" name="名称及型号2" id="名称及型号2" size = "15"/>
    		</td>
    		<td align="center">
       		  <input type="text" name="编号2" id="编号2" size = "15"/>
        	</td>
    		<td align="center">
       		  <input type="text" name="有效期2" id="有效期2" size = "15"/>
        	</td>
    		<td align="center">
       		  <input type="text" name="参数2" id="参数2" size = "15"/>
        	</td>
    		<td align="center">
       		  <input type="text" name="地点2" id="地点2" size = "15"/>
        	</td>
  		</tr>
  		<tr>
    		<td align="center">
   		      <input type="text" name="名称及型号3" id="名称及型号3" size = "15"/>
    		</td>
    		<td align="center">
       		  <input type="text" name="编号3" id="编号3" size = "15"/>
        	</td>
    		<td align="center">
       		  <input type="text" name="有效期3" id="有效期3" size = "15"/>
        	</td>
    		<td align="center">
       		  <input type="text" name="参数3" id="参数3" size = "15"/>
        	</td>
    		<td align="center">
       		  <input type="text" name="地点3" id="地点3" size = "15"/>
        	</td>
  		</tr>
  		<tr>
    		<td align="center">
   		      <input type="text" name="名称及型号4" id="名称及型号4" size = "15"/>
    		</td>
    		<td align="center">
       		  <input type="text" name="编号4" id="编号4" size = "15"/>
        	</td>
    		<td align="center">
       		  <input type="text" name="有效期4" id="有效期4" size = "15"/>
        	</td>
    		<td align="center">
       		  <input type="text" name="参数4" id="参数4" size = "15"/>
        	</td>
    		<td align="center">
       		  <input type="text" name="地点4" id="地点4" size = "15"/>
        	</td>
  		</tr>
</table>
  		
<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width ="770" height="440" >
  		<tr>
    		<td  width="141" height="180" align="center" id= "ssssss">
    		    检验项目
    		</td>
    		<td align="left" width="102"><table width="93" height="134" border="0">
        	    <tr>
        	      <td width="120" align="left"><input name="jyxm" type="checkbox" value="4%乙酸">
       	          4%乙酸 &nbsp;</td>
      	      </tr>
        	    <tr>
        	      <td align="left"><input name="jyxm" type="checkbox" value="20%乙醇">
       	          20%乙醇 </td>
      	      </tr>
        	    <tr>
        	      <td align="left">
                    <input name="jyxm" type="checkbox" value="65%乙醇">
                  65%乙醇</td>
      	      </tr>
        	    <tr>
        	      <td align="left">
                    <input name="jyxm" type="checkbox" value="正己烷">
                  正己烷</td>
      	      </tr>
        	    <tr>
        	      <td height="25" align="left"><input name="jyxm" type="checkbox" value="水">
       	          水</td>
      	      </tr>
   	      </table></td>
    		<td align="left" width="90"><table width="90" border="0">
       	      <tr>
        	      <td width="84" align="left"><input name="jyxm" type="checkbox" value="20℃">
       	          20℃</td>
      	      </tr>
        	    <tr>
        	      <td align="left"><input name="jyxm" type="checkbox" value="60℃">
       	          60℃</td>
      	      </tr>
        	    <tr>
        	      <td align="left"><input name="jyxm" type="checkbox" value="95℃">
                  95℃ </td>
      	      </tr>
        	    <tr>
        	      <td align="left"><input name="jyxm" type="checkbox" value="室温">
       	          室温 </td>
      	      </tr>
        	    <tr>
        	      <td height="24" align="left"><input name="jyxm" type="checkbox" value=""></td>
      	      </tr>
      	    </table></td>
    		<td align="left" width="113">
        	  <table width="106" border="0">
        	    <tr>
        	      <td width="100" align="left"><input name="jyxm" type="checkbox" value="0.5h(30min)">
       	          0.5h（30min) </td>
      	      </tr>
        	    <tr>
        	      <td align="left"><input name="jyxm" type="checkbox" value="1h">
       	          1 h </td>
      	      </tr>
        	    <tr>
        	      <td align="left"><input name="jyxm" type="checkbox" value="2h">
       	          2 h</td>
      	      </tr>
        	    <tr>
        	      <td align="left"><input name="jyxm" type="checkbox" value="6h">
       	          6 h </td>
      	      </tr>
        	    <tr>
        	      <td align="left"><input name="jyxm" type="checkbox" value=""></td>
      	      </tr>
      	    </table></td>
    		<td align="left" width="102"> <table width="90" border="0">
       	      <tr>
        	      <td width="84" align="left"><input name="jyxm" type="checkbox" value="4%乙酸">
       	          4%乙酸  </td>
      	      </tr>
        	    <tr>
        	      <td align="left">
        	        <input name="jyxm" type="checkbox" value="20%乙醇">
                  20%乙醇</td>
      	      </tr>
        	    <tr>
        	      <td align="left"><input name="jyxm" type="checkbox" value="65%乙醇">
       	          65%乙醇</td>
      	      </tr>
        	    <tr>
        	      <td align="left"><input name="jyxm" type="checkbox" value="正己烷">
       	          正己烷 </td>
      	      </tr>
        	    <tr>
        	      <td height="27" align="left"><input name="jyxm" type="checkbox" value="水">
       	          水</td>
      	      </tr>
   	      </table></td>
        	<td align="left" width="97">
        	  <table width="80" border="0">
                <tr>
                  <td width="99" align="left"><input name="jyxm" type="checkbox" value="20℃">
                  20℃ </td>
                </tr>
                <tr>
                  <td align="left"><input name="jyxm" type="checkbox" value="60℃">
                  60℃</td>
                </tr>
                <tr>
                  <td align="left"><input name="jyxm" type="checkbox" value="95℃">
                  95℃ </td>
                </tr>
                <tr>
                  <td align="left"><input name="jyxm" type="checkbox" value="室温">
                  室温</td>
                </tr>
                <tr>
                  <td align="left">
                  <input name="jyxm" type="checkbox" value=""></td>
                </tr>
              </table>
        	</td>
    		<td align="left" width="109">
    		  <table width="100" border="0">
                <tr>
                  <td width="94" align="left"><input name="jyxm" type="checkbox" value="0.5h(30min)">
                  0.5h(30min) </td>
                </tr>
                <tr>
                  <td align="left"><input name="jyxm" type="checkbox" value="1h">
                  1 h</td>
                </tr>
                <tr>
                  <td align="left"><input name="jyxm" type="checkbox" value="2h">
                  2 h </td>
                </tr>
                <tr>
                  <td align="left">
                    <input name="jyxm" type="checkbox" value="6h">
                  6 h  </td>
                </tr>
                <tr>
                  <td height="22" align="left"><input name="jyxm" type="checkbox" value=""></td>
                </tr>
              </table>
        	</td>
  		</tr>
  		<tr>
            <td align="left"><input name="cdytj" type="checkbox" value="测定用体积V1(mL)" >
          测定用体积V<sub>1</sub>(mL)</td> 
            <td colspan="3" align="left"><table width="100%" border="0">
              <tr>
                <td width="50%" align="left"><input name="cdytj" type="checkbox"  checked = checked value="200">200</td>
                <td width="50%" align="left"><input name="cdytj" type="checkbox" value=""></td>
              </tr>
            </table>
            </td>
            <td colspan="3" align="left">
            <table width="100%" border="0">
              <tr>
                <td width="50%" align="left"><input name="cdytj" type="checkbox"  checked = checked value="200">200</td>
                <td width="50%" align="left"><input name="cdytj" type="checkbox" value=""></td>
              </tr>
            </table>
            </td>
  </tr>
          <tr>
            <td align="left"><input name="jpmj" type="checkbox" value="浸泡面积S(cm2)">浸泡面积S(cm<sup>2</sup>)</td> 
            <td colspan="3" align="left">
              <table width="100%%" border="0">
                <tr>
                  <td width="50%" align="left"><input name="jpmj" type="checkbox" value="100,S=5*10*2">100,S=5*10*2</td>
                  <td width="50%" align="left"><input name="jpmj" type="checkbox" checked=checked value="S=">S  =
              <!-- <input type="text" name="s1" id="s1" size = "8"/> -->
              <text id="s1" >浸泡液面积1</text></td>
                </tr>
              </table>
            </td>
            <td colspan="3" align="left">
              <table width="100%%" border="0">
                <tr>
                  <td align="left" width="50%"><input name="jpmj" type="checkbox" value="100,S=5*10*2">
              100,S=5*10*2</td>
                  <td align="left" width="50%"><input name="jpmj" type="checkbox" checked=checked value="S=">S  =
              <!-- <input type="text" name="s2" id="s2" size = "8"/> -->
              <text id="s2" >浸泡液面积2</text></td>
                </tr>
              </table>
              
            </td>
          </tr>
          <tr>
            <td align="left"><input name="jpytj" type="checkbox" value="浸泡液体积V">浸泡液体积V(mL)</td> 
            <td colspan="3" align="left">
            <table width="100%%" border="0">
  <tr>
    <td width="50%" align="left"><input name="jpytj" type="checkbox" value="200">200</td>
    <td width="50%" align="left"><input name="jpytj" type="checkbox" checked=checked value="">
              <text id="v1" >浸泡液体积1</text></td>
  </tr>
</table>
            </td>
            <td colspan="3" align="left">
              <table width="100%%" border="0">
  <tr>
    <td width="50%" align="left"><input name="jpytj" type="checkbox" value="200">200</td>
    <td width="50%" align="left"><input name="jpytj" type="checkbox" checked=checked value="">
              <text id="v2" >浸泡液体积2</text></td>
  </tr>
</table>
            </td>
          </tr>
</table>
	
<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width="770" height="400">
	 
      <tr align="center">
        <td rowspan="3" width="142">器皿(1)<br>
        恒重m<sub>0</sub>(g)</td>
        <td width="22">1</td>
        <td colspan="2"><!-- <input type="text" name="m011" id="m011" size = "42"/> --><div id="jzhz1a" >基准恒重1a</div></td>
        <td colspan="2"><!-- <input type="text" name="m012" id="m012" size = "42"/> --><div id="jzhz1b" >基准恒重1b</div></td>
      </tr>
      <tr>
        <td >2</td>
        <td colspan="2"><!-- <input type="text" name="m021" id="m021" size = "42"/> --><div id="jzhz2a" >基准恒重2a</div></td>
        <td colspan="2"><!-- <input type="text" name="m022" id="m022" size = "42"/> --><div id="jzhz2b" >基准恒重1b</div></td>
      </tr>
      <tr>
        <td >m<sub>0</sub></td>
        <td colspan="2"><!-- <input type="text" name="m031" id="m031" size = "42"/> --><div id="m0a" >基准恒重差a</div></td>
        <td colspan="2"><!-- <input type="text" name="m032" id="m032" size = "42"/> --><div id="m0b" >基准恒重差b</div></td>
      </tr>
       
      <tr align="center">
        <td rowspan="3" width="142">器皿(1)+<br>试剂空白恒重m<sub>2</sub>(g)</td>
        <td width="22">1</td>
        <td colspan="2"><!-- <input type="text" name="m211" id="m211" size = "42"/> --><div id="jzhzsjkb1a" >基准恒重试剂空白1a</div></td>
        <td colspan="2"><!-- <input type="text" name="m212" id="m212" size = "42"/> --><div id="jzhzsjkb1b" >基准恒重试剂空白1b</div></td>
      </tr>
      <tr>
        <td >2</td>
        <td colspan="2"><!-- <input type="text" name="m221" id="m221" size = "42"/> --><div id="jzhzsjkb2a" >基准恒重试剂空白2a</div></td>
        <td colspan="2"><!-- <input type="text" name="m222" id="m222" size = "42"/> --><div id="jzhzsjkb2b" >基准恒重试剂空白2b</div></td>
      </tr>
      <tr>
        <td >m<sub>2</sub></td>
        <td colspan="2"><!-- <input type="text" name="m231" id="m231" size = "42"/> --><div id="m2a" >基准恒重试剂空白差a</div></td>
        <td colspan="2"><!-- <input type="text" name="m232" id="m232" size = "42"/> --><div id="m2b" >基准恒重试剂空白差b</div></td>
      </tr>
      <tr align="center">
        <td colspan="2">平均测定次数</td>
        <td width="148">1</td>
        <td width="148">2</td>
        <td width="148">1</td>
        <td width="148">2</td>
      </tr>
      <tr align="center">
        <td rowspan="3" width="142">器皿(2)<br>恒重m<sub>3</sub>(g)</td>
        <td width="22">1</td>
        <td ><div id="hz1a1" >恒重1a1</div></td>
        <td ><div id="hz1a2" >恒重1a2</div></td>
        <td ><div id="hz1b1" >恒重1b1</div></td>
        <td ><div id="hz1b2" >恒重1b2</div></td>
      </tr>
      <tr>
        <td >2</td>
        <td ><div id="hz2a1" >恒重2a1</div></td>
        <td ><div id="hz2a2" >恒重2a2</div></td>
        <td ><div id="hz2b1" >恒重2b1</div></td>
        <td ><div id="hz2b2" >恒重2b2</div></td>
      </tr>
      <tr>
        <td >m<sub>3</sub></td>
        <td ><div id="m3a1" >恒重a1差</div></td>
        <td ><div id="m3a2" >恒重a2差</div></td>
        <td ><div id="m3b1" >恒重b1差</div></td>
        <td ><div id="m3b2" >恒重b2差</div></td>
      </tr>
       
      <tr align="center">
        <td rowspan="3" width="142">器皿(2)+<br>样品恒重m<sub>4</sub>(g)</td>
        <td width="22">1</td>
        <td ><div id="hzyp1a1" >恒重样品1a1</div></td>
        <td ><div id="hzyp1a2" >恒重样品1a2</div></td>
        <td ><div id="hzyp1b1" >恒重样品1b1</div></td>
        <td ><div id="hzyp1b2" >恒重样品1b2</div></td>
      </tr>
      <tr>
        <td >2</td>
        <td ><div id="hzyp2a1" >恒重样品2a1</div></td>
        <td ><div id="hzyp2a2" >恒重样品2a2</div></td>
        <td ><div id="hzyp2b1" >恒重样品2b1</div></td>
        <td ><div id="hzyp2b2" >恒重样品2b2</div></td>
      </tr>
      <tr>
        <td >m4</td>
        <td ><div id="m4a1" >恒重样品差a1</div></td>
        <td ><div id="m4a2" >恒重样品差a2</div></td>
        <td ><div id="m4b1" >恒重样品差b1</div></td>
        <td ><div id="m4b2" >恒重样品差b2</div></td>
      </tr>
      <tr align="center">
        <td colspan="2">
          实测结果<br>
          <input name="csjg" type="checkbox" value="200">mg/L
          <input name="csjg" type="checkbox" value="">mg/dm<sup>2</sup>
        </td>
        <td width="148"><input type="text" name="scjga1" id="scjga1" size = "20"/></td>
        <td width="148"><input type="text" name="scjga2" id="scjga2" size = "20"/></td>
        <td width="148"><input type="text" name="scjgb2" id="scjgb2" size = "20"/></td>
        <td width="148"><input type="text" name="scjgb2" id="scjgb2" size = "20"/></td>
      </tr>
      <tr align="center">
       <td colspan="2">
          平均值<br>
          <input name="pjz" id="pjz" type="checkbox" value="200">mg/L
          <input name="pjz" type="checkbox" value="">mg/dm<sup>2</sup>
        </td>
        <td colspan="2"><input type="text" name="pjz1" id="pjz1" size = "42"/></td>
        <td colspan="2"><input type="text" name="pjz2" id="pjz2" size = "42"/></td>
      </tr>
      <tr align="center">
       <td colspan="2">
          标准值<br>
          <input name="bzz" type="checkbox" value="200">mg/L
          <input name="bzz" type="checkbox" value="">mg/dm<sup>2</sup>
        </td>
        <td colspan="2">
          <!-- <input type="text" name="bzz1" id="bzz1" size = "42"/> -->
          30
        </td>
        <td colspan="2">
          <!-- <input type="text" name="bzz2" id="bzz2" size = "42"/> -->
          30
        </td>
      </tr>
      <tr align="center">
       <td colspan="2">单项结论</td>
        <td colspan="2" align="left">
          
          <input name="jpytj" type="checkbox" value="afuhe">符合
          <input name="jpytj" type="checkbox" value="abufuhe">不符合
          <input name="jpytj" type="checkbox" value="">
        </td>
        <td colspan="2" align="left">
          
          <input name="jpytj" type="checkbox" value="bfuhe">符合
          <input name="jpytj" type="checkbox" value="bbufuhe">不符合
          <input name="jpytj" type="checkbox" value="">
        </td>
      </tr>
      <tr align="center">
       <td colspan="2">备注</td>
        <td colspan="2" align="left">
          m<sub>2</sub>-m<sub>0</sub>=
            <input type="text" name="scjga1" id="scjga1" size = "3"/>g ,
                    见<input type="text" name="scjga1" id="scjga1" size = "3"/> 
        </td>
        <td colspan="2" align="left">
         m<sub>2</sub>-m<sub>0</sub>=<input type="text" name="scjga1" id="scjga1" size = "3"/> g ,
                  见<input type="text" name="scjga1" id="scjga1" size = "3"/> 
        </td>
      </tr>
</table>
	
<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width="770" height="130" >  
		<tr>
   			<td width="18" align="center">计算公式</td>
    		<td width="748" height="70"><p >&nbsp;</p>&nbsp;&nbsp;
        		<input style="margin-bottom:18px" type="checkbox" name="公式1" id="公式1" />
        		<img src="source/Formula1.png" alt="公式1" width="187" height="42" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		<input style="margin-bottom:18px" type="checkbox" name="公式2" id="公式2" />
        		<img src="source/Formula2.png" alt="公式2" width="187" height="42" />
      		</td>
  		</tr>
</table>
	
	<table width="770" border="0" bgcolor="#ffffff">
	  <tr>
	    <td align="left">校核员：</td>
	    <td align="left">检验员：</td>
	    <td align="left">检验日期：</td>
      </tr>
</table>
<hr>
<div align="center">
<input  type="button" onclick="postcontent()" value="保存">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input type="button" value="返回" onclick="javascript:history.go(-1);"/>
</div>
</div>
</body>
</html>