<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>重金属（以铅计）原始记录</title>
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
	text-align:center;
	}
    body,td,th {
	font-size: 12px;
	left: auto;
	top: 3px;
	right: auto;
	bottom: 3px;
	}
    </style>
	<script language="JavaScript" src="zjs.js">
	
	</script>
</head>
<body>
	<h1 id="title">重金属（以铅计）原始记录</h1></br>
		<p>选择适用的在复选框上打勾&nbsp;<input  type="button" onclick="postcontent()" value="保存">
		&nbsp;&nbsp;No:<input id="id" type="text" size="3"></p>
		<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width="770" height="185" >
 			<tr>
   				<td width="86" height="83" align="center"> 
    				<p> 样品简称</p>
    				<p>（必要时）</p>
    			</td>
    			<td width="202">
       					<input type="text" name="名称" id="name" style="width:198px; height:25px;"/>
    			</td>
    			<td width="18" rowspan="2" align="center">检验依据</td>
   				<td width="433" rowspan="2">   
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB9681-1998"/>GB9681-1998&nbsp;
       					<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB9682-1998"/>GB9682-1998&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB9683-1998"/>GB9683-1998&nbsp;&nbsp;
      				 	<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB9687-1998"/>GB9687-1998&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB9688-1998"/>GB9688-1998&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB9690-1998"/>GB9690-2009&nbsp;
     					<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB13113-1991"/>GB13113-1991&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB14942-1994"/>GB14942-1994&nbsp;
                        <input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB11676-2012"/>GB11676-2012&nbsp;
         				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB11678-1998"/>GB11678-1998&nbsp;
       		 			<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB13116-1991"/>GB13116-1991&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB4806.1-1994"/>GB4806.1-1994&nbsp;
          				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB4806.2-1994"/>GB4806.2-1994&nbsp;
       				    <input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB16332-1996"/>GB16332-1996&nbsp;
       				    <input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB17326-1998"/>GB17326-1998&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB17327-1998"/>GB17327-1998&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GBGB/T5009"/>GBGB/T5009&nbsp;
        				<input style="margin-top:0px" type="checkbox" name="checkbox" id="checkbox" value="standard=GB------"/>GB------&nbsp;
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
   			<td width="154" height="22" align="center">仪器名称及规格编号</td>
    		<td width="153" align="center">仪器编号</td>
    		<td width="192" align="center">仪器检定有效期</td>
    		<td width="132" align="center">使用参数</td>
    		<td width="125" align="center">检定地点</td>
  		</tr>
  		<tr>
    		<td height="22" align="center">钢直尺</td>
    		<td align="center">
        		QG-B-A1-<input type="text" name="编号1" id="编号1" size = "3"/>
        	</td>
    		<td align="center">&nbsp;</td>
    		<td align="center">/</td>
    		<td align="center">&nbsp;</td>
  		</tr>
  		<tr>
    		<td height="22" align="center">电热鼓风干燥箱</td>
    		<td align="center">
     			QG-A-A3-<input type="text" name="编号2" id="编号2" size="3"/>
        	</td>
    		<td align="center">&nbsp;</td>
    		<td align="center">
    			<input type="text" name="使用参数温度" id="使用参数温度" size = "3"/>℃
    		</td>
    		<td align="center">&nbsp;</td>
		</tr>
	</table>
	<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width="770">
  		<tr>
   			<td width="154" height="50" align="left">
   				<p>
                	<input type="checkbox" name="浸泡面积" id="浸泡面积" value="s=浸泡面积S(cm2)"/>浸泡面积S(cm<sup>2</sup>)
                </p>
   				<p>
   					<input style="margin-bottom:8px" type="checkbox" name="s2" id="s2"/>
     	   			<input type="text" name="浸泡面积3" id="s3" size = "6"/>
     	   		</p>
   			</td>
    		<td width="153" nowrap="nowrap">
      			<input type="checkbox" name="面积1" id="面积1" />80 
	  			<input type="checkbox" name="面积2" id="面积2" />
        		<input type="text" name="自定义面积" id="自定义面积" size = "4"/>
   			</td>
    		<td width="192" align="center">浸泡液体积V(mL)</td>
    		<td width="258"><form id="form3" name="form3" method="post" action="">
      			<input type="checkbox" name="体积1" id="体积1" />200 &nbsp;&nbsp;
      			<input type="checkbox" name="体积" id="体积" />
        		<input type="text" name="自定义体积" id="自定义体积" size = "6"/>
    		<td class="clearfloat"></td>
  		</tr>
  		<tr>
    		<td width="154" height="50" align="center">
    			<p> 测试用体积</p>
    			<p style="line-height:0"> V<sub>2</sub>(mL)</p>
    		</td>
    		<td colspan="3" align="left"><form id="form4" name="form4" method="post" action="">
      			<input type="checkbox" name="测试体积1" id="测试体积1" /> 20.0 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     
      			<input type="checkbox" name="测试体积2" id="测试体积2" />
        		<input type="text" name="自定义测试体积" id="自定义测试体积" />
     		</td>
  		</tr>
  		<tr>
    		<td height="50" align="center">浸 泡 条 件</td>
    		<td align="center"><form id="form7" name="form7" method="post" action="">
          		<p><input type="checkbox" name="溶液" id="ry1" value="tjr=4％乙酸"/>4%乙酸</p>
				<p>
					<input style="margin-top:-8px" type="checkbox" name="溶液2" id="ry2" />
          			<input type="text" name="自定义溶液" id="ry3" size = "4"/>
          		</p>
        	</td>
    		<td align="left">
     		 	<p style="line-height:0">
          			<input type="checkbox" name="温度1" id="tjw1" value="tjw=60℃  "/>60℃  
          		</p>
      			<p style="line-height:0">
          			<input style="margin-top:-8px" type="checkbox" name="温度2" value="tjw=95℃  "/>95℃   
          		</p>
      			<p style="line-height:0">
          			<input style="margin-top:-8px" type="checkbox" name="温度3" id="tjw3" value="tjw=回流  "/> 回流
      			</p>
      			<p style="line-height:0">
          			<input style="margin-top:-8px"  type="checkbox" name="温度4" id="tjw4" />
          			<input style="margin-top:-8px"  type="text" name="自定义温度" id="tjw5" size = "2"/>
      			</p>
    		</td>
    		<td align="left">
      			<p style="line-height:0">
      				<input type="checkbox" name="时间1" id="时间1" value="tjt=0.5H（30min）"/>0.5H（30min）
      			</p>
      			<p style="line-height:0">
        			<input style="margin-top:-8px" type="checkbox" name="时间2" id="时间2" value="tjt=2h"/>2h
        		</p>
     			 <p style="line-height:0">
     				<input style="margin-top:-8px" type="checkbox" name="时间3" id="时间3" value="tjt=6h"/>6h
     			</p>
      			<p style="line-height:0">
      				<input style="margin-top:-8px" type="checkbox" name="时间4" id="tjt4" />
      				<input style="margin-top:-8px" type="text" name="自定时间" id="tjt5" size= "12"/>
      			</p>
    		</td>
  		</tr>
  		<tr>
    		<td height="50" align="center">标准使用液编号</td>
    		<td align="center">
          		2015-1-1-<input type="text" name="使用液编号" id="使用液编号" size = "3"/>
        	</td>
    		<td align="center">有效日期</td>
    		<td align="center">
      			<input type="text" name="有效日期" id="有效日期" />
    		</td>
  		</tr>
  		<tr>
    		<td height="50" align="center">
    			<p>铅标准溶液浓度</p>
    			<p style="line-height:0">C(μg/mL)</p>
    		</td>
    		<td align="center">8.0</td>
    		<td align="center">铅标准溶液使用体积V<sub>1</sub>（mL）</td>
    		<td align="center">
      			<input type="checkbox" name="铅溶液体积" id="铅溶液体积" />2.0&nbsp;&nbsp;
       			<input type="checkbox" name="铅溶液体积2" id="铅溶液体积2" />       
       			<input type="text" name="自定义铅使用体积" id="自定义铅使用体积" size = "15"/>
  			</td>
  		</tr>
	</table>
	<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width="770" height="125" >
  		<tr>
   			<td width="18" rowspan="3" align="center">    实测结果</td>
   			<td width="200" height="22" align="center">样品管呈色</td>
    		<td width="200" align="center">样品含量</td>
    		<td width="200" align="center">标准值</td>
    		<td width="138" align="center">单项结论</td>
	  </tr>
  		<tr>
    		<td height="50"><input type="checkbox" name="深" id="深" />深于标准管</td>
    		<td>
    			<p>
					<input type="checkbox" name="深于1" id="sy1" />＞
					<input type="text" name="含量1" id="shl1" size  = "6" />mg/L
				</p>
				<p>
					<input style="margin-bottom:8px" type="checkbox" name="深于2" id="sy2" />＞
					<input type="text" name="含量2" id="shl2" size  = "6"/>mg/dm<sup>2</sup>
				</p>
    		</td>
    		<td rowspan="2">
        		<p>
        			<input type="checkbox" name="标准1" id="标准1" />&#8804;
        			<input type="text" name="标准含量1" id="标准含量1" size  = "6" />mg/L
        		</p>
        		<p>
        			<input type="checkbox" name="标准2" id="标准2" />&#8804;
        			<input type="text" name="标准含量2" id="标准含量2" size  = "6"/>mg/dm<sup>2</sup>
        		</p>
    		</td>
    		<td rowspan="2"><form id="form20" name="form20" method="post" action="">
        		<p><input type="checkbox" name="结论1" id="结论1" />合格</p>
        		<p><input style="margin-top:-5px" type="checkbox" name="结论2" id="结论2" />符合</p>
       	 		<p><input style="margin-top:-5px" type="checkbox" name="结论3" id="结论3" />不合格</p>
        		<p><input style="margin-top:-5px" type="checkbox" name="结论4" id="结论4" />不符合</p>
        		<p>
                	<input style="margin-top:-5px" type="checkbox" name="结论5" id="结论5" />
        			<input type="text" name="结论5" id="结论5" size  = "6"/>
                </p>
      		</td>
  		</tr>
  		<tr>
    		<td height="50"><input type="checkbox" name="浅" id="浅" /> 浅于标准管，由计算公式</td>
    		<td>
    			<p>
    				<input type="checkbox" name="浅于1" id="qy1" /> ＜
        			<input type="text" name="浅含量1" id="qhl1" size  = "6" />mg/L
        		</p>
        		<p>
       				<input style="margin-bottom:8px" type="checkbox" name="浅于2" id="qy2" />＜
        			<input type="text" name="浅含量2" id="qhl2" size  = "6"/>mg/dm<sup>2</sup>
        		</p>
    		</td>
  		</tr>
	</table>
	<table bgcolor="#ffffff" border="1" cellspacing="0" cellpadding="0" bordercolordark="#ffffff" bordercolorlight="#000000" width="770" height="130" >  
		<tr>
   			<td width="18" align="center">计算公式</td>
    		<td width="742" height="70"><p >&nbsp;</p>&nbsp;&nbsp;
        		<input style="margin-bottom:18px" type="checkbox" name="公式1" id="公式1" />
        		<img src="/Zj/image/Untitled-2_wps8F1C.tmp.png" alt="公式1" width="134" height="42" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		<input style="margin-bottom:18px" type="checkbox" name="公式2" id="公式2" />
        		<img src="/Zj/image/Untitled-2_wps6437.tmp.png" alt="公式2" width="87" height="42" />
      		</td>
  		</tr>
  		<tr>
    		<td width="18" align="center">备注</td>
    		<td height="48">&nbsp;</td>
 	 	</tr>
	</table>
	<p>校核者：&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      检验员：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      检验日期：
	</p>
</body>
</html>