<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	table  {
	  width:770px;
	}
	tr{
	  text-align:center;
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
         tiaomujutijinxi();
         getItemSpecificInfo();
         getWareSpecificInfo();
     }
     
     $(document).ready(function(){//提前预选复选框
    	 contentArray = requestURLParameter('content').split(",");//content的内容保存在数组里
    	 $("input[name='checkbox']").each(function(){//获得检测标准
        	 if($(this).val()==requestURLParameter('standard')){
        		 /* alert($(this).val()); */
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
    	 
    	 $.ajax({
             dataType:"json",
             type: "POST",
             url: "servlet/getinfo",
             data: data,
             success: function(jsonObject){
            	var s1,s2,v1,v2,wareno1,wareno2;
                  s1 = jsonObject.s1;
                  s2 = jsonObject.s2;
                  v1 = jsonObject.v1;
                  v2 = jsonObject.v2;
                  wareno1 = jsonObject.wareno1;
                  vareno2 = jsonObject.wareno2;
                  $("#s1").html(s1); 
                  $("#s2").html(s2);
                  $("#v1").html(v1); 
                  $("#v2").html(v2);
             },
             complete:function(){
             },
             global:true,
             error: function(){
                 alert("错误");
             }
           });
     }
     
     function getWareSpecificInfo(){//获得器皿试剂信息
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
            	m0a = standardWeight2 - standardWeight1;
            	m0b = m0a;
            	m2a = standardWeightAReagent2 - standardWeightAReagent1;
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
     
     function getWareSpecificInfo(){//获得某器皿的称重数据
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
            	m0a = standardWeight2 - standardWeight1;
            	m0b = m0a;
            	m2a = standardWeightAReagent2 - standardWeightAReagent1;
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
     
     /* alert(str); */
     /* $("#dd").val(str) */
    
     
     /* alert($(":checkbox[name='checkbox']").val()); */
      function tiaomujutijinxi(){
          $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/getinfo",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'>";
                
                 //$.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据
                   s += "<tr>";
                   //temp = value;
                   //s += "<td>"+"检测内容："+value+"</td>";
                   /* s += "<td>"+"检测内容："+tmp2[1]+"</td>" */;
                   s += "<td>浸泡面积</td>"+"<td>"+jsonObject.s1+"</td>"+"<td>"+jsonObject.s2+"</td>";
                   s += "</tr>";
                   s += "<tr>";
                   s += "<td>浸泡体积</td>"+"<td>"+jsonObject.v1+"</td>"+"<td>"+jsonObject.v2+"</td>";
                   s += "</tr>";
                   s += "<tr>";
                   s += "<td>器皿编号</td>"+"<td>"+jsonObject.wareno1+"</td>"+"<td>"+jsonObject.wareno2+"</td>";
                   s += "</tr>";
                   $("#result0").html(s); 
                 //});    
              },
              complete:function(){
              },
              global:true,
              error: function(){
                  alert("错误");
              }
            });
      }
      
       function showWareWeight(){//获得某器皿的称重数据
          $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/getwareinfo",
              data: data,
              success: function(jsonObject){
                 var s = "<table border='1'>";
                
                 //$.each(jsonObject,function(key,value){//element是data.emp json数组之中的数据
                   s += "<tr>";
                   //temp = value;
                   //s += "<td>"+"检测内容："+value+"</td>";
                   /* s += "<td>"+"检测内容："+tmp2[1]+"</td>" */;
                   s += "<td>浸泡面积</td>"+"<td>"+jsonObject.s1+"</td>"+"<td>"+jsonObject.s2+"</td>";
                   s += "</tr>";
                   s += "<tr>";
                   s += "<td>浸泡体积</td>"+"<td>"+jsonObject.v1+"</td>"+"<td>"+jsonObject.v2+"</td>";
                   s += "</tr>";
                    s += "<tr>";
                   s += "<td>器皿编号</td>"+"<td>"+jsonObject.wareno1+"</td>"+"<td>"+jsonObject.wareno2+"</td>";
                   s += "</tr>";
                   $("#result0").html(s); 
                 //});    
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
<body onload = "allSettedInfo()">
	<h1 id="title">蒸发残渣原始记录</h1></br>
		<p>选择适用的在复选框上打勾&nbsp;<input  type="button" onclick="postcontent()" value="保存">
		&nbsp;&nbsp;No:<input id="id" type="text" size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</p>
		
		<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width="770" height="185" >
 			<tr>
   				<td width="86" height="83" align="center"> 
    				<p> 样品简称</p>
    				<p>（必要时）</p>
    			</td>
    			<td width="202">
       					<!-- <input type="text" name="名称" id="name" style="width:198px; height:25px;"/> -->
       					<script>document.write(requestURLParameter('no'));</script>
    			</td>
    			<td width="18" rowspan="2" align="center">检验依据</td>
   				<td width="433" rowspan="2">   
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="9681"/>GB9681-1988&nbsp;
       					<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="9683"/>GB9683-1988&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="9687"/>GB9687-1988&nbsp;&nbsp;
      				 	<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="9688"/>GB9688-1988&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="9689"/>GB9689-1988&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="9690"/>GB9690-2009&nbsp;
     					<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="13113"/>GB13113-1991&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="14942"/>GB14942-1994&nbsp;
                        <input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="17326"/>GB17326-1998&nbsp;
         				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="17327"/>GB17327-1998&nbsp;
       		 			<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="4806.1"/>GB4806.1-1994&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="4806.2"/>GB4806.2-1994&nbsp;
          				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="16332"/>GB16332-1996&nbsp;
       				    <input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="T5009"/>GB/T5009&nbsp;
       				    <input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value=""/>;
    			</td>
  			</tr>
  			<tr>
    			<td width="86" height="100" align="center">样品数量分配</td>
    			<td width="202">
        			<input type="text" name="数量" id="num"  style="width:198px; height:30px;"/>
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
    		    <input type="text" name="名称及型号1" id="名称及型号1" size = "3"/>
    		</td>
    		<td align="center">
        		<input type="text" name="编号1" id="编号1" size = "3"/>
        	</td>
    		<td align="center">
        		<input type="text" name="有效期1" id="有效期1" size = "3"/>
        	</td>
    		<td align="center">
        		<input type="text" name="参数1" id="参数1" size = "3"/>
        	</td>
    		<td align="center">
        		<input type="text" name="地点1" id="地点1" size = "3"/>
        	</td>
  		</tr>
  		<tr>
    		<td align="center">
    		    <input type="text" name="名称及型号2" id="名称及型号2" size = "3"/>
    		</td>
    		<td align="center">
        		<input type="text" name="编号2" id="编号2" size = "3"/>
        	</td>
    		<td align="center">
        		<input type="text" name="有效期2" id="有效期2" size = "3"/>
        	</td>
    		<td align="center">
        		<input type="text" name="参数2" id="参数2" size = "3"/>
        	</td>
    		<td align="center">
        		<input type="text" name="地点2" id="地点2" size = "3"/>
        	</td>
  		</tr>
  		<tr>
    		<td align="center">
    		    <input type="text" name="名称及型号3" id="名称及型号3" size = "3"/>
    		</td>
    		<td align="center">
        		<input type="text" name="编号3" id="编号3" size = "3"/>
        	</td>
    		<td align="center">
        		<input type="text" name="有效期3" id="有效期3" size = "3"/>
        	</td>
    		<td align="center">
        		<input type="text" name="参数3" id="参数3" size = "3"/>
        	</td>
    		<td align="center">
        		<input type="text" name="地点3" id="地点3" size = "3"/>
        	</td>
  		</tr>
  		<tr>
    		<td align="center">
    		    <input type="text" name="名称及型号4" id="名称及型号4" size = "3"/>
    		</td>
    		<td align="center">
        		<input type="text" name="编号4" id="编号4" size = "3"/>
        	</td>
    		<td align="center">
        		<input type="text" name="有效期4" id="有效期4" size = "3"/>
        	</td>
    		<td align="center">
        		<input type="text" name="参数4" id="参数4" size = "3"/>
        	</td>
    		<td align="center">
        		<input type="text" name="地点4" id="地点4" size = "3"/>
        	</td>
  		</tr>
  		</table>
  		
  		<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" height="300" >
  		<tr>
    		<td align="center"  width="170">
    		    检验项目
    		</td>
    		<td align="center" width="100">
        	  <input name="jyxm" type="checkbox" value="4%乙酸">4%乙酸
              <input name="jyxm" type="checkbox" value="20%乙醇">20%乙醇
              <input name="jyxm" type="checkbox" value="65%乙醇">65%乙醇
              <input name="jyxm" type="checkbox" value="正己烷">正己烷
              <input name="jyxm" type="checkbox" value="水">水
        	</td>
    		<td align="center" width="100">
        	  <input name="jyxm" type="checkbox" value="20℃">20℃
              <input name="jyxm" type="checkbox" value="60℃">60℃
              <input name="jyxm" type="checkbox" value="95℃">95℃
              <input name="jyxm" type="checkbox" value="室温">室温
              <input name="jyxm" type="checkbox" value="">
        	</td>
    		<td align="center" width="100">
        	  <input name="jyxm" type="checkbox" value="0.5h（30min)">0.5h（30min)
              <input name="jyxm" type="checkbox" value="1h">1 h
              <input name="jyxm" type="checkbox" value="2h">2 h
              <input name="jyxm" type="checkbox" value="6h">6 h
              <input name="jyxm" type="checkbox" value="">
        	</td>
    		<td align="center" width="100">
        	  <input name="jyxm" type="checkbox" value="4%乙酸">4%乙酸
              <input name="jyxm" type="checkbox" value="20%乙醇">20%乙醇
              <input name="jyxm" type="checkbox" value="65%乙醇">65%乙醇
              <input name="jyxm" type="checkbox" value="正己烷">正己烷
              <input name="jyxm" type="checkbox" value="水">水
        	</td>
        	<td align="center" width="100">
        	  <input name="jyxm" type="checkbox" value="20℃">20℃
              <input name="jyxm" type="checkbox" value="60℃">60℃
              <input name="jyxm" type="checkbox" value="95℃">95℃
              <input name="jyxm" type="checkbox" value="室温">室温
              <input name="jyxm" type="checkbox" value="">
        	</td>
    		<td align="center" width="100">
        	  <input name="jyxm" type="checkbox" value="0.5h（30min)">0.5h（30min)
              <input name="jyxm" type="checkbox" value="1h">1 h
              <input name="jyxm" type="checkbox" value="2h">2 h
              <input name="jyxm" type="checkbox" value="6h">6 h
              <input name="jyxm" type="checkbox" value="">
        	</td>
  		</tr>
  		<tr>
            <td>&nbsp;&nbsp;<input name="cdytj" type="checkbox" value="测定用体积V1(mL)" >&nbsp;&nbsp;测定用体积V1(mL)</td> 
            <td colspan="3">
              &nbsp;&nbsp;&nbsp;&nbsp;<input name="cdytj" type="checkbox" value="200" checked = checked>200
              &nbsp;&nbsp;&nbsp;&nbsp;<input name="cdytj" type="checkbox" value="">
            </td>
            <td colspan="3">
              &nbsp;&nbsp;&nbsp;&nbsp;<input name="cdytj" type="checkbox" value="200" checked = checked>200
              &nbsp;&nbsp;&nbsp;&nbsp;<input name="cdytj" type="checkbox" value="">
            </td>
          </tr>
          <tr>
            <td>&nbsp;&nbsp;<input name="jpmj" type="checkbox" value="浸泡面积S(cm2)">&nbsp;&nbsp;浸泡面积S(cm2)</td> 
            <td colspan="3">
              &nbsp;&nbsp;&nbsp;&nbsp;<input name="jpmj" type="checkbox" value="100,S=5*10*2">100,S=5*10*2
              &nbsp;&nbsp;&nbsp;&nbsp;<input name="jpmj" type="checkbox" value="S=" checked=checked>S  =
              <!-- <input type="text" name="s1" id="s1" size = "8"/> -->
              <div id="s1" >浸泡液面积1</div>
            </td>
            <td colspan="3">
              &nbsp;&nbsp;&nbsp;&nbsp;<input name="jpmj" type="checkbox" value="100,S=5*10*2">100,S=5*10*2
              &nbsp;&nbsp;&nbsp;&nbsp;<input name="jpmj" type="checkbox" value="S=" checked=checked>S  =
              <!-- <input type="text" name="s2" id="s2" size = "8"/> -->
              <div id="s2" >浸泡液面积2</div>
            </td>
          </tr>
          <tr>
            <td>&nbsp;&nbsp;<input name="jpytj" type="checkbox" value="浸泡液体积V">&nbsp;&nbsp;浸泡液体积V(mL)</td> 
            <td colspan="3">
              &nbsp;&nbsp;&nbsp;&nbsp;<input name="jpytj" type="checkbox" value="200">200
              &nbsp;&nbsp;&nbsp;&nbsp;<input name="jpytj" type="checkbox" checked=checked value="">
              <div id="v1" >浸泡液体积1</div>
            </td>
            <td colspan="3">
              &nbsp;&nbsp;&nbsp;&nbsp;<input name="jpytj" type="checkbox" value="200">200
              &nbsp;&nbsp;&nbsp;&nbsp;<input name="jpytj" type="checkbox" checked=checked value="">
              <div id="v2" >浸泡液面体积2</div>
            </td>
          </tr>
	</table>
	
	<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" height="400">
	 
      <tr align="center">
        <td rowspan="3" width="150">器皿(1)恒重m0(g)</td>
        <td width="17">1</td>
        <td colspan="2">
          <!-- <input type="text" name="m011" id="m011" size = "3"/> -->
          <div id="jzhz1a" >基准恒重1a</div>
        </td>
        <td colspan="2">
          <!-- <input type="text" name="m012" id="m012" size = "3"/> -->
          <div id="jzhz1b" >基准恒重1b</div>
        </td>
      </tr>
      <tr>
        <td >2</td>
        <td colspan="2">
          <!-- <input type="text" name="m021" id="m021" size = "3"/> -->
          <div id="jzhz2a" >基准恒重2a</div>
        </td>
        <td colspan="2">
          <!-- <input type="text" name="m022" id="m022" size = "3"/> -->
          <div id="jzhz2b" >基准恒重1b</div>
        </td>
      </tr>
      <tr>
        <td >m0</td>
        <td colspan="2">
          <!-- <input type="text" name="m0a" id="m0a" size = "3"/> -->
          <div id="m0a" >基准恒重差a</div>
        </td>
        <td colspan="2">
          <!-- <input type="text" name="m0b" id="m0b" size = "3"/> -->
          <div id="m0b" >基准恒重差b</div>
        </td>
      </tr>
       
      <tr align="center">
        <td rowspan="3" width="150">器皿(1)+试剂空白恒重m2(g)</td>
        <td width="17">1</td>
        <td colspan="2">
          <!-- <input type="text" name="m211" id="m211" size = "3"/> -->
          <div id="jzhzsjkb1a" >基准恒重试剂空白1a</div>
        </td>
        <td colspan="2">
          <!-- <input type="text" name="m212" id="m212" size = "3"/> -->
          <div id="jzhzsjkb1b" >基准恒重试剂空白1b</div>
        </td>
      </tr>
      <tr>
        <td >2</td>
        <td colspan="2">
          <!-- <input type="text" name="m221" id="m221" size = "3"/> -->
          <div id="jzhzsjkb2a" >基准恒重试剂空白2a</div>
        </td>
        <td colspan="2">
          <!-- <input type="text" name="m222" id="m222" size = "3"/> -->
          <div id="jzhzsjkb2b" >基准恒重试剂空白2b</div>
        </td>
      </tr>
      <tr>
        <td >m2</td>
        <td colspan="2">
          <!-- <input type="text" name="m231" id="m231" size = "3"/> -->
          <div id="m2a" >基准恒重试剂空白差a</div>
        </td>
        <td colspan="2">
          <!-- <input type="text" name="m232" id="m232" size = "3"/> -->
          <div id="m2b" >基准恒重试剂空白差b</div>
        </td>
      </tr>
      <tr align="center">
        <td colspan="2">平均测定次数</td>
        <td width="150">1</td>
        <td width="150">2</td>
        <td width="150">1</td>
        <td width="150">2</td>
      </tr>
      <tr align="center">
        <td rowspan="3" width="150">器皿(2)恒重m3(g)</td>
        <td width="10">1</td>
        <td ><input type="text" name="m31a1" id="m31a1" size = "3"/></td>
        <td ><input type="text" name="m31a2" id="m31a2" size = "3"/></td>
        <td ><input type="text" name="m31b1" id="m31b1" size = "3"/></td>
        <td ><input type="text" name="m31b2" id="m31b2" size = "3"/></td>
      </tr>
      <tr>
        <td >2</td>
        <td ><input type="text" name="m32a1" id="m32a1" size = "3"/></td>
        <td ><input type="text" name="m32a2" id="m32a2" size = "3"/></td>
        <td ><input type="text" name="m32b1" id="m32b1" size = "3"/></td>
        <td ><input type="text" name="m32b2" id="m32b2" size = "3"/></td>
      </tr>
      <tr>
        <td >m3</td>
        <td ><input type="text" name="m33a1" id="m33a1" size = "3"/></td>
        <td ><input type="text" name="m33a2" id="m33a2" size = "3"/></td>
        <td ><input type="text" name="m33b1" id="m33b1" size = "3"/></td>
        <td ><input type="text" name="m33b2" id="m33b2" size = "3"/></td>
      </tr>
       
      <tr align="center">
        <td rowspan="3" width="150">器皿(2)+样品恒重m4(g)</td>
        <td width="10">1</td>
        <td ><input type="text" name="m41a1" id="m41a1" size = "3"/></td>
        <td ><input type="text" name="m41a2" id="m41a2" size = "3"/></td>
        <td ><input type="text" name="m41b1" id="m41b1" size = "3"/></td>
        <td ><input type="text" name="m41b2" id="m41b2" size = "3"/></td>
      </tr>
      <tr>
        <td >2</td>
        <td ><input type="text" name="m42a1" id="m42a1" size = "3"/></td>
        <td ><input type="text" name="m42a2" id="m42a2" size = "3"/></td>
        <td ><input type="text" name="m42b1" id="m42b1" size = "3"/></td>
        <td ><input type="text" name="m42b2" id="m42b2" size = "3"/></td>
      </tr>
      <tr>
        <td >m4</td>
        <td ><input type="text" name="m43a1" id="m43a1" size = "3"/></td>
        <td ><input type="text" name="m43a2" id="m43a2" size = "3"/></td>
        <td ><input type="text" name="m43b1" id="m43b1" size = "3"/></td>
        <td ><input type="text" name="m43b1" id="m43b1" size = "3"/></td>
      </tr>
      <tr align="center">
        <td colspan="2">
          <p>实测结果</p>
          <input name="csjg" type="checkbox" value="200">mg/L
          <input name="csjg" type="checkbox" value="">mg/dm2
        </td>
        <td width="150"><input type="text" name="scjga1" id="scjga1" size = "3"/></td>
        <td width="150"><input type="text" name="scjga2" id="scjga2" size = "3"/></td>
        <td width="150"><input type="text" name="scjgb2" id="scjgb2" size = "3"/></td>
        <td width="150"><input type="text" name="scjgb2" id="scjgb2" size = "3"/></td>
      </tr>
      <tr align="center">
       <td colspan="2">
          <p>平均值</p>
          <input name="pjz" type="checkbox" value="200">mg/L
          <input name="pjz" type="checkbox" value="">mg/dm2
        </td>
        <td width="150" colspan="2"><input type="text" name="pjz1" id="pjz1" size = "3"/></td>
        <td width="150" colspan="2"><input type="text" name="pjz2" id="pjz2" size = "3"/></td>
      </tr>
      <tr align="center">
       <td colspan="2">
          <p>标准值</p>
          <input name="bzz" type="checkbox" value="200">mg/L
          <input name="bzz" type="checkbox" value="">mg/dm2
        </td>
        <td width="150" colspan="2"><input type="text" name="bzz1" id="bzz1" size = "3"/></td>
        <td width="150" colspan="2"><input type="text" name="bzz2" id="bzz2" size = "3"/></td>
      </tr>
      <tr align="center">
       <td colspan="2">单项结论</td>
        <td colspan="2">
          <input name="jpytj" type="checkbox" value="ahege">合格
          <input name="jpytj" type="checkbox" value="afuhe">符合
          <input name="jpytj" type="checkbox" value="abuhege">不合格
          <input name="jpytj" type="checkbox" value="abufuhe">不符合
          <input name="jpytj" type="checkbox" value="">
        </td>
        <td colspan="2">
          <input name="jpytj" type="checkbox" value="bhege">合格
          <input name="jpytj" type="checkbox" value="bfuhe">符合
          <input name="jpytj" type="checkbox" value="bbuhege">不合格
          <input name="jpytj" type="checkbox" value="bbufuhe">不符合
          <input name="jpytj" type="checkbox" value="">
        </td>
      </tr>
      <tr align="center">
       <td colspan="2">备注</td>
        <td colspan="2">
          m2-m0=<input type="text" name="scjga1" id="scjga1" size = "3"/>g ,
                    见<input type="text" name="scjga1" id="scjga1" size = "3"/> 
        </td>
        <td colspan="2">
         m2-m0=<input type="text" name="scjga1" id="scjga1" size = "3"/> g ,
                  见<input type="text" name="scjga1" id="scjga1" size = "3"/> 
        </td>
      </tr>
	</table>
	
	<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width="770" height="130" >  
		<tr>
   			<td width="18" align="center">计算公式</td>
    		<td width="742" height="70"><p >&nbsp;</p>&nbsp;&nbsp;
        		<input style="margin-bottom:18px" type="checkbox" name="公式1" id="公式1" />
        		<img src="/ysjldzxt/image/zfczysjlgs1.jpg" alt="公式1" width="187" height="42" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		<input style="margin-bottom:18px" type="checkbox" name="公式2" id="公式2" />
        		<img src="/ysjldzxt/image/zfczysjlgs2.png" alt="公式2" width="187" height="42" />
      		</td>
  		</tr>
	</table>
	
	<p>校核者：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      检验员：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      检验日期：
	</p>
</body>
</html>