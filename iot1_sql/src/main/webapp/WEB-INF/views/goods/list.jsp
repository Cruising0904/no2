<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<c:url var="readUrl" value="/goods/list"/>
<c:url var="createUrl" value="/goods/create" />
<c:url var="updateUrl" value="/goods/update" />
<c:url var="deleteUrl" value="/goods/delete" />
<c:url var="vendorComboUrl" value="/vendor/combo" />

<c:url var="readUrl" value="/vendor/list"/>
<c:url var="createUrl" value="/vendor/create" />
<c:url var="updateUrl" value="/vendor/update" />
<c:url var="deleteUrl" value="/vendor/delete" />
<title>Insert title here</title>
</head>

<!-- <script>
function callback(results){
	alert("DBMS:goods_info에 해당하는 총 " + results.length + "개의 Database를 불러옵니다.");
	var result = "";
	for(var i=0, max=results.length; i<max; i++){
		var goods = results[i];
	//	result+= "," + goods.giNum + goods.giName+ goods.giDesc+ goods.viNum+ goods.giCredat+ goods.giCretim
		result+="<tr>";
		result+="<td class='text-center'>" + goods.giNum + "</td>";
		result+="<td class='text-center'>" + goods.giName + "</td>";
		result+="<td class='text-center'>" + goods.giDesc + "</td>";
		result+="<td class='text-center'>" + goods.viNum + "</td>";
		result+="<td class='text-center'>" + goods.giCredat + "</td>";
		result+="<td class='text-center'>" + goods.giCretim + "</td>";
		
	}
	$("#result_tbody").html(result);
}

$(document).ready(function(){
	$("input[type='button']").click(function(){
		var au = new AjaxUtil("goods/list");
		au.setCallbackSuccess(callback);
		au.send();
	})
})
</script> -->
<!-- 
<br><p/><br><p/><br><p/>
<form action="${rootPath}/goods/list" method = "post">
<center><input  class="btn_global"  type="button" value="보내긔"></center>
<table id="table" data-height="460"
         class="table table-bordered table-hover">
         <thead>
            <tr>
               <th data-field="ginum" class="text-center">GOODS_NUMBER</th>
               <th data-field="giname" class="text-center">GOODS_NAME</th>
               <th data-field="gidesc" class="text-center">GOODS_DESCRIPTION</th>
               <th data-field="vinum" class="text-center">VANDOR_NUMBER</th>
               <th data-field="giCredat" class="text-center">GOODS_CREATEDATE</th>
               <th data-field="gicretim" class="text-center">GOODS_CRETIM</th>
            </tr>
         </thead>
<tbody id="result_tbody">
</form>
 -->
 
<body>
 <script>
	$(document).ready(function(){
		if(!"${vendors}"){
			location.href="${vendorComboUrl}";
		}
	})
	</script>
<br><p/><br><p/><br><p/>
<kendo:grid title="그리드" name="grid" pageable="true" sortable="true" scrollable="true" height="450">
<kendo:grid-editable mode="incell"/>
      <kendo:grid-toolbar>
      <kendo:grid-toolbarItem name="create" text="생성"/>
			<kendo:grid-toolbarItem name="save" text="저장"/>
		</kendo:grid-toolbar>
		<kendo:grid-columns>
			<kendo:grid-column title="제품번호" field="giNum" />
			<kendo:grid-column title="제품이름" field="giName"/>
			<kendo:grid-column title="제품설명" field="giDesc"/>
			<kendo:grid-column title="회사번호" field="viNum">
            	<kendo:grid-column-values value="${vendors}"/>
			</kendo:grid-column>
			<kendo:grid-column title="생산일자" field="giCredat" format="{0:yyyy-MM-dd}"/>
			<kendo:grid-column title="생산시간" field="giCretim"/>
            <kendo:grid-column command="destroy" title="삭제" />
		</kendo:grid-columns>
            
		<kendo:dataSource pageSize="20" batch="true">
			<kendo:dataSource-transport>
				<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" 
				contentType="application/json"/>
				
	<!--2.  데이터 보내기를 위한 정의 -->	
				<kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="POST" 
				contentType="application/json"/>
				<kendo:dataSource-transport-update url="${updateUrl}" dataType="json" type="POST" 
				contentType="application/json"/>
				<kendo:dataSource-transport-destroy url="${deleteUrl}" dataType="json" type="POST" 
				contentType="application/json"/>
				
				<kendo:dataSource-transport-parameterMap>
					<script>
					function parameterMap(options, type){
						if(type==="read"){
							return JSON.stringify(options);
						}else{
							return JSON.stringify(options.models);
						}
					}
					</script>
					</kendo:dataSource-transport-parameterMap>
			</kendo:dataSource-transport>
		
		<!--3.  입력할 데이터의 각각의 구분값 -->	
			<kendo:dataSource-schema>
				<kendo:dataSource-schema-model id="giNum">
					<kendo:dataSource-schema-model-fields>
						<kendo:dataSource-schema-model-field name="giNum" type="number" editable="false"/>
						<kendo:dataSource-schema-model-field name="giName" type="string">
							<kendo:dataSource-schema-model-field-validation required="true"/>
						</kendo:dataSource-schema-model-field>
						<kendo:dataSource-schema-model-field name="viNum" defaultValue="1" >
							<kendo:dataSource-schema-model-field-validation required="true" min="1"/>
						</kendo:dataSource-schema-model-field>
							<kendo:dataSource-schema-model-field name="giCredat" editable="false" type = "date"/>
							<kendo:dataSource-schema-model-field name="giCretim" editable="false">
						</kendo:dataSource-schema-model-field>
					</kendo:dataSource-schema-model-fields>
				</kendo:dataSource-schema-model>
			</kendo:dataSource-schema>
		</kendo:dataSource>
</kendo:grid>
</body>
</html>