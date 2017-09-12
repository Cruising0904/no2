<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="pVar" value="1.3.2" />
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<c:set var="nowUrl" value="${pageContext.request.requestURI}" />
<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
<%--<script src="<c:url value="/resources/js/jquery-ui-1.9.2.custom.js?version=${pVar}"/>"></script>
<script src="<c:url value="/resources/js/jquery.fileupload.js?version=${pVar}"/>"></script>
<script src="<c:url value="/resources/js/jquery.iframe-transport.js?version=${pVar}"/>"></script> --%>
<script src="<c:url value="/resources/ui/common.js?version=${pVar}"/>"></script>
<script
	src="<c:url value="/resources/ui/btsp3.7.7/js/bootstrap.min.js?version=${pVar}"/>"></script>
<script
	src="<c:url value="/resources/ui/btsp3.7.7/js/bootstrap-table.js?version=${pVar}"/>"></script>
<script
	src="<c:url value="/resources/ui/btsp3.7.7/js/bootstrap-table.js?version=${pVar}"/>"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.4.0/jszip.min.js"></script>
<script src="<c:url value='/resources/js/kendo.all.min.js' />"></script>
<script src="<c:url value='/resources/js/kendo.timezones.min.js' />"></script>
<script src="<c:url value='/resources/shared/js/console.js'/>"></script>
<script src="<c:url value='/resources/shared/js/prettify.js'/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/ui/btsp3.7.7/css/bootstrap-theme.min.css?version=${pVar}"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/ui/btsp3.7.7/css/bootstrap.min.css?version=${pVar}"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/ui/btsp3.7.7/css/bootstrap-table.css?version=${pVar}"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/ui/common.css?version=${pVar}"/>" />
<link href="<c:url value='/resources/css/web/kendo.common.min.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/web/kendo.rtl.min.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/web/kendo.default.min.css'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/web/kendo.default.mobile.min.css'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/dataviz/kendo.dataviz.min.css'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/dataviz/kendo.dataviz.default.min.css'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/shared/styles/examples-offline.css'/>"
	rel="stylesheet" />
<script>
$(document).ready(function(){
	var nowUrl = "${nowUrl}";
	var obj = $("a[href='" + nowUrl + "']").parent().attr("class","active");
})
var KendoItem = function(obj, grid,url, keyStr){
	var selectValue = obj.dataItem(obj.select())[keyStr];
	this.key = keyStr;
	this.param = {};
	this.param[keyStr]=selectValue;
	var gridObj = grid.data("kendoGrid");
	gridObj.dataSource.transport.param = this.param;
	var reload = function(options){
        $.ajax({
        	type : "post",
			url : url,
			dataType : "json",
			data : JSON.stringify(this.param),
		    beforeSend: function(xhr) {
		        xhr.setRequestHeader("Content-Type", "application/json");
		    },
		    success : function(result){
		    	options.success(result);
			},
			error : function(xhr){
				alert(xhr.responseText);
			}
        });
	}
	this.send = function(){
	    gridObj.dataSource.transport.read = reload;
		gridObj.dataSource.read();
	}
}
var JSException = function(msg){
	alert(msg);
	console.log(msg);
}
var pageMove = function(page){
	page = page.replace("/",":");
	location.href = "${rootPath}/url/" + page;
}
var AjaxUtil = function (url, params, type, dataType){
	if(!url){
		alert("url정보가 없습니다.");
		return null;
	}
	this.url = "${rootPath}/" + url;
	
	//this.param = JSON.stringify(initData);
	var generateJSON = function(params){
		if(!params) return "";
		var paramArr = params.split(",");
		var data = {};
		for(var i=0,max=paramArr.length;i<max;i++){
			var key = paramArr[i]
			if($("#" + key).length>1){
				throw new JSException("동일 ID값이 존재함.");
			}else if($("#" + key).length==0){
				throw new JSException(key+"에 해당하는 ID가 존재하지 않음.");
			}
			data[key] = $("#" + key).val();
		}
		return  JSON.stringify(data);
	}
	this.type = type?type:"POST";
	this.dataType = dataType?dataType:"json";
	this.param = generateJSON(params);
	this.callbackSuccess = function(json){
    	var url = json.url;
   // 	var data = json.data;
    	var msg = json.msg;
    	if(msg){
    		alert(msg);
    	}
    	if(url){
        	pageMove(url);
    	}
	}
	
	this.setCallbackSuccess = function(callback){
		this.callbackSuccess = callback;
	}
	
	this.send = function(){
		$.ajax({ 
	        type     : this.type
	    ,   url      : this.url
	    ,   dataType : this.dataType 
	    ,   beforeSend: function(xhr) {
	        xhr.setRequestHeader("Accept", "application/json");
	        xhr.setRequestHeader("Content-Type", "application/json");
	    }
	    ,   data     : this.param
	    ,   success : this.callbackSuccess
	    ,   error : function(xhr, status, e) {
		    	alert("에러 : "+e);
		},
		complete : function(e) {
		}
		});
	}
}
</script>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${rootPath}/main.jsp">HOME</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="/sql/url/vendor:list">회사정보</a></li>
				<li><a href="/sql/url/goods:list">상품정보</a></li>
				<li><a href="/sql/url/user:user_list">유저정보</a></li>
			</ul>

		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>
	
	<br><p><br><p><br><p>