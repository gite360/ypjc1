	function postcontent(){
	var json = "http://localhost:8080/Zj/Test?title=重金属以pb计";
	var arr = document.getElementsByTagName("input");
	//json = escape(json);
	//���title
//	if(document.getElementById("title")&&document.getElementById("title").value!=""){
//		json+=(document.getElementById("title").value);
//		alert(document.getElementById("title").value);
//	}
	//文件ID
	if(document.getElementById("id")&&document.getElementById("id").value!=""){
		json+=("&id="+document.getElementById("id").value);
	}else{
		window.alert("Need an No. ");
		return;
	}
	//样本名呈
	if(document.getElementById("name")&&document.getElementById("name").value!="")
		json+=("&name="+document.getElementById("name").value.toString());
	console.warn("%s",json);
	//样本数量
	if(document.getElementById("num")&&document.getElementById("num").value!="")
		json+=("&num="+document.getElementById("num").value);
	//复选框
	for(var i=0;i<arr.length;i++){
	   if(arr[i].type == "checkbox" && arr[i].checked){
		   //溶液
		   if(arr[i].id == "ry2"&&
				   document.getElementById("ry3")&&
				   document.getElementById("ry3").value!="") 
			   json+=("&tjr="+document.getElementById("ry3").value);
		   //温度
		   if(arr[i].id == "tjw4"&&
				   document.getElementById("tjw5")&&
				   document.getElementById("tjw5").value!="") 
			   json+=("&tjw="+document.getElementById("tjw5").value);
		   //体积
		   if(arr[i].id == "tjt4"&&
				   document.getElementById("tjt5")&&
				   document.getElementById("tjt5").value!="") 
			   json+=("&tjt="+document.getElementById("tjt5").value);
		   //小于标准
		   if(arr[i].id == "qy1"&&
				   document.getElementById("qhl1")&&
				   document.getElementById("qhl1").value!=""){
			   json+=("&result="+document.getElementById("qhl1").value);
			   json+=("&dw=mg/L")
		   }
		   //小于标准2
		   if(arr[i].id == "qy2"&&
				   document.getElementById("qhl2")&&
				   document.getElementById("qhl2").value!=""){
			   json+=("&result="+document.getElementById("qhl2").value);
			   json+=("&dw=mg/dm2")
		   }
		 //深于
		   if(arr[i].id == "sy1"&&
				   document.getElementById("shl1")&&
				   document.getElementById("shl1").value!=""){
			   json+=("&result=>"+document.getElementById("shl1").value);
			   json+=("&dw=mg/L")
		   }
		   //深于2
		   if(arr[i].id == "sy2"&&
				   document.getElementById("shl2")&&
				   document.getElementById("shl2").value!=""){
			   json+=("&result=>"+document.getElementById("shl2").value);
			   json+=("&dw=mg/dm2")
		   }
		   if(arr[i].id != "ry2"&& arr[i].id != "tjw4" 
			   && arr[i].id != "tjt4" && arr[i].id != "sy1" && arr[i].id != "sy2"
				   && arr[i].id != "qy1" && arr[i].id != "qy2" )
			   json+=("&"+arr[i].value);
		   //
		 }
	}	
	//chart1.setDataURL(json);
//	json = URLEncoder.encode(json, "UTF-8");
//	json = escape(json);
	json = encodeURI(json);  
	location.href = json;
	console.warn("%s",json);
}