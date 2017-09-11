<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:url var="readUrl" value="/vendor/list" />
<c:url var="createUrl" value="/vendor/create" />
<c:url var="updateUrl" value="/vendor/update" />
<c:url var="deleteUrl" value="/vendor/delete" />
<title>Insert title here</title>
</head>
</script>
<br>
<p />
<br>
<p />
<br>
<p />
<kendo:grid title="그리드" name="grid" pageable="true" sortable="true"
	scrollable="true" height="380">
	<kendo:grid-editable mode="incell" />
	<kendo:grid-toolbar>
		<kendo:grid-toolbarItem name="create" text="생성" />
		<kendo:grid-toolbarItem name="save" text="저장" />
	</kendo:grid-toolbar>
	<kendo:grid-columns>
		<kendo:grid-column title="회사번호" field="viNum" />
		<kendo:grid-column title="회사이름" field="viName" />
		<kendo:grid-column title="회사정보" field="viDesc" />
		<kendo:grid-column title="회사주소" field="viAddress" />
		<kendo:grid-column title="회사연락처" field="viPhone" />
		<kendo:grid-column title="설립시기" field="viCredat" />
		<kendo:grid-column title="설립시간" field="viCretim" />
		<kendo:grid-column command="destroy" title="삭제" />
	</kendo:grid-columns>

	<kendo:dataSource pageSize="20" batch="true">
		<kendo:dataSource-transport>
			<kendo:dataSource-transport-read url="${readUrl}" dataType="json"
				type="POST" contentType="application/json" />

			<!--2.  데이터 보내기를 위한 정의 -->
			<kendo:dataSource-transport-create url="${createUrl}" dataType="json"
				type="POST" contentType="application/json" />
			<kendo:dataSource-transport-update url="${updateUrl}" dataType="json"
				type="POST" contentType="application/json" />
			<kendo:dataSource-transport-destroy url="${deleteUrl}"
				dataType="json" type="POST" contentType="application/json" />

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
			<kendo:dataSource-schema-model id="viNum">
				<kendo:dataSource-schema-model-fields>
					<kendo:dataSource-schema-model-field name="viNum" type="number"
						editable="false" />
					<kendo:dataSource-schema-model-field name="viName" type="string">
						<kendo:dataSource-schema-model-field-validation required="true" />
					</kendo:dataSource-schema-model-field>
					<kendo:dataSource-schema-model-field name="viNum" defaultValue="1">
						<kendo:dataSource-schema-model-field-validation required="true"
							min="1" />
					</kendo:dataSource-schema-model-field>
					<kendo:dataSource-schema-model-field name="viCredat"
						editable="false" type="date" />
					<kendo:dataSource-schema-model-field name="viCretim"
						editable="false">
					</kendo:dataSource-schema-model-field>
				</kendo:dataSource-schema-model-fields>
			</kendo:dataSource-schema-model>
		</kendo:dataSource-schema>
	</kendo:dataSource>
</kendo:grid>
</body>
</html>