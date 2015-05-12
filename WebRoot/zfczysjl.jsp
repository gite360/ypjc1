<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zfczysjl.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

    <style type="text/css">
     
      
    </style>
  </head>
  
  <body>
    <!-- <form name="form1" method="post" action="zfczServlet"> -->
      <!-- <table align="center" border="1" bordercolor="black" style="width=80%" align="left" > -->
      <table align="center" border="1" bordercolor="black"  style="width=80%" align="left">
        <tr>
          <td>样品简称（必要时）</td>         
          <td>&nbsp</td>
          <td rowspan="2">检验依据</td>
          <td rowspan="2">
            <input name="jyyj" type="checkbox" value="GB9681-1988">GB9681-1988
            <input name="jyyj" type="checkbox" value="GB9683-1988">GB9683-1988
            <input name="jyyj" type="checkbox" value="GB9687-1988">GB9687-1988
            <input name="jyyj" type="checkbox" value="GB9688-1988">GB9688-1988
            <input name="jyyj" type="checkbox" value="GB9689-1988">GB9689-1988
            <input name="jyyj" type="checkbox" value="GB9690-2009">GB9690-2009
            <input name="jyyj" type="checkbox" value="GB13113-1991">GB13113-1991
            <input name="jyyj" type="checkbox" value="GB14942-1994">GB14942-1994
            <input name="jyyj" type="checkbox" value="GB17326-1998">GB17326-1998
            <input name="jyyj" type="checkbox" value="GB17327-1998">GB17327-1998
            <input name="jyyj" type="checkbox" value="GB4806.1-1994">GB4806.1-1994
            <input name="jyyj" type="checkbox" value="GB4806.2-1994">GB4806.2-1994
            <input name="jyyj" type="checkbox" value="GB16332-1996">GB16332-1996
            <input name="jyyj" type="checkbox" value="GB/T5009">GB/T5009
            <input name="jyyj" type="checkbox" value="">
          </td>           
        </tr>
        <tr>
          <td>样品数量分配</td>
          <td>&nbsp</td>
        </tr>
        </table>
        <table align="center" border="1" bordercolor="black"  style="width=80%" align="left">
          <tr>
            <td width="20%">仪器名称及规格型号</td>
            <td width="20%">仪器编号</td>
            <td width="20%">仪器检定有效期</td>          
            <td width="20%">使用参数</td>
            <td width="20%">检验地点</td>
          </tr>
          <tr>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>&nbsp</td>
          </tr>
          <tr>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>&nbsp</td>
          </tr>
          <tr>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>&nbsp</td>
          </tr>
          <tr>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>&nbsp</td>
            <td>&nbsp</td>
          </tr>
        </table>
        
        <table align="center" border="1" bordercolor="black"  style="width=80%" align="left">
          <tr>
            <td colspan="2">检查项目</td>
            <td>
              <input name="jyxm" type="checkbox" value="4%乙酸">4%乙酸
              <input name="jyxm" type="checkbox" value="20%乙醇">20%乙醇
              <input name="jyxm" type="checkbox" value="65%乙醇">65%乙醇
              <input name="jyxm" type="checkbox" value="正己烷">正己烷
              <input name="jyxm" type="checkbox" value="水">水
            </td> 
            <td>
              <input name="jyxm" type="checkbox" value="20℃">20℃
              <input name="jyxm" type="checkbox" value="60℃">60℃
              <input name="jyxm" type="checkbox" value="95℃">95℃
              <input name="jyxm" type="checkbox" value="室温">室温
              <input name="jyxm" type="checkbox" value="">
            </td> 
            <td>
              <input name="jyxm" type="checkbox" value="0.5h（30min)">0.5h（30min)
              <input name="jyxm" type="checkbox" value="1 h">1 h
              <input name="jyxm" type="checkbox" value="2 h">2 h
              <input name="jyxm" type="checkbox" value="6 h">6 h
              <input name="jyxm" type="checkbox" value="">
            </td>        
            <td>
              <input name="jyxm" type="checkbox" value="4%乙酸">4%乙酸
              <input name="jyxm" type="checkbox" value="20%乙醇">20%乙醇
              <input name="jyxm" type="checkbox" value="65%乙醇">65%乙醇
              <input name="jyxm" type="checkbox" value="正己烷">正己烷
              <input name="jyxm" type="checkbox" value="水">水
            </td> 
            <td>
              <input name="jyxm" type="checkbox" value="20℃">20℃
              <input name="jyxm" type="checkbox" value="60℃">60℃
              <input name="jyxm" type="checkbox" value="95℃">95℃
              <input name="jyxm" type="checkbox" value="室温">室温
              <input name="jyxm" type="checkbox" value="">
            </td> 
            <td>
              <input name="jyxm" type="checkbox" value="0.5h（30min)">0.5h（30min)
              <input name="jyxm" type="checkbox" value="1 h">1 h
              <input name="jyxm" type="checkbox" value="2 h">2 h
              <input name="jyxm" type="checkbox" value="6 h">6 h
              <input name="jyxm" type="checkbox" value="">
            </td>        
          </tr>
          <tr>
            <td colspan="2"><input name="cdytj" type="checkbox" value="测定用体积V1(mL)" >测定用体积V1(mL)</td> 
            <td colspan="3">
              <input name="cdytj" type="checkbox" value="200">200
              <input name="cdytj" type="checkbox" value="">
            </td>
            <td colspan="3">
              <input name="cdytj" type="checkbox" value="200">200
              <input name="cdytj" type="checkbox" value="">
            </td>
          </tr>
          <tr>
            <td colspan="2"><input name="jpmj" type="checkbox" value="浸泡面积S(cm2)">浸泡面积S(cm2)</td> 
            <td colspan="3">
              <input name="jpmj" type="checkbox" value="100,S=5*10*2">100,S=5*10*2
              <input name="jpmj" type="checkbox" value="S=">S  =
            </td>
            <td colspan="3">
              <input name="jpmj" type="checkbox" value="100,S=5*10*2">100,S=5*10*2
              <input name="jpmj" type="checkbox" value="S=">S  =
            </td>
          </tr>
          <tr>
            <td colspan="2"><input name="jpytj" type="checkbox" value="浸泡液体积V">浸泡液体积V</td> 
            <td colspan="3">
              <input name="jpytj" type="checkbox" value="200">200
              <input name="jpytj" type="checkbox" value="">
            </td>
            <td colspan="3">
              <input name="jpytj" type="checkbox" value="200">200
              <input name="jpytj" type="checkbox" value="">
            </td>
          </tr>
          <tr>
            <td rowspan="4">器皿(1)恒重m0(g)</td>
          </tr>
          <tr>
             <td>1</td>
             <td colspan="3">
              &nbsp
             </td>
             <td colspan="3">
              &nbsp
             </td>
          </tr>
          <tr>
             <td>2</td>
             <td colspan="3">
              &nbsp
             </td>
             <td colspan="3">
              &nbsp
             </td>
          </tr>
          <tr>
             <td>m0</td>
             <td colspan="3">
              &nbsp
             </td>
             <td colspan="3">
              &nbsp
             </td>
          </tr>
          <tr>
            <td rowspan="4">器皿(1)+试剂空白恒重m2(g)</td>
          </tr>
          <tr>
             <td>1</td>
             <td colspan="3">
              &nbsp
             </td>
             <td colspan="3">
              &nbsp
             </td>
          </tr>
          <tr>
             <td>2</td>
             <td colspan="3">
              &nbsp
             </td>
             <td colspan="3">
              &nbsp
             </td>
          </tr>
          <tr>
             <td>m2</td>
             <td colspan="3">
              &nbsp
             </td>
             <td colspan="3">
              &nbsp
             </td>
          </tr>
          <table align="center" border="1" bordercolor="black"  style="width=80%" align="left">
            <tr>
              <td >平行测定次数</td>
              <td width="25%">&nbsp</td>
              <td>&nbsp</td>
              <td>&nbsp</td>
              <td>&nbsp</td>
            </tr>
          </table> 
        <tr>
          <td></td>        
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
    
	
      </table>
   <!--  </form> -->
  </body>
</html>
