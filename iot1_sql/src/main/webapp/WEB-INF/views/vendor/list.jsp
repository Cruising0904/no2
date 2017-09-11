<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<title>Insert title here</title>
</head>


<body>
<script>
function callback(results){
	alert("DBMS:vendor_info에 해당하는 총 " + results.length + "개의 Database를 불러옵니다.");
	var result = "";
	for(var i=0, max=results.length; i<max; i++){
		var vendor = results[i];
	//	result+= "," + goods.giNum + goods.giName+ goods.giDesc+ goods.viNum+ goods.giCreadat+ goods.giCretim
		result+="<tr>";
		result+="<td class='text-center'>" + vendor.viNum + "</td>";
		result+="<td class='text-center'>" + vendor.viName + "</td>";
		result+="<td class='text-center'>" + vendor.viDesc + "</td>";
		result+="<td class='text-center'>" + vendor.viAddress + "</td>";
		result+="<td class='text-center'>" + vendor.viPhone + "</td>";
		result+="<td class='text-center'>" + vendor.viCredat + "</td>";
		result+="<td class='text-center'>" + vendor.viCretim + "</td>";
		result+="</tr>";
		
	}
	$("#result_tbody").html(result);
}

$(document).ready(function(){
	$("input[type='button']").click(function(){
		var au = new AjaxUtil("/vendor/list");
		au.setCallbackSuccess(callback);
		au.send();
	})
})
</script>
<br><p/><br><p/><br><p/>
<form action="${rootPath}/vendor/list" method = "post">
<center><input  class="btn_global"  type="button" value="보내긔"></center>
<table id="table" data-height="460"
         class="table table-bordered table-hover">
         <thead>
            <tr>
               <th data-field="vinum" class="text-center">vinum</th>
               <th data-field="viname" class="text-center">viname</th>
               <th data-field="videsc" class="text-center">videsc</th>
               <th data-field="viaddress" class="text-center">viaddress</th>
               <th data-field="viphone" class="text-center">viphone</th>
               <th data-field="vicredat" class="text-center">vicredat</th>
               <th data-field="vicretim" class="text-center">vicretim</th>
            </tr>
         </thead>
<tbody id="result_tbody">
</form>
</body>
</html>