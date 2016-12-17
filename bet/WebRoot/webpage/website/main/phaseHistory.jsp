<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>历史开奖</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="plug-in/mui/css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/app.css"/>
		
		<style type="text/css">
			.mui-badge-his {
    font-size: 12px;
    line-height: 1;
    display: inline-block;
    padding: 3px 6px;
    color: #333;
    border-radius: 100px;
    background-color: rgba(0,0,0,.15);
}
		</style>
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/bet.css"/>
</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">历史开奖</h1>
		</header>
		<div class="mui-content">
			<ul class="mui-table-view">
				<c:forEach items="${phaseHistory }" var="p">
					<li class="mui-table-view-cell">${p.phase }期
					<c:set value="${fn:split(p.result,',') }" var="nums"></c:set>
					<c:forEach items="${nums }" var="n"><span class="mui-badge-his mui-badge-<fmt:formatNumber type="number" value="${n }"></fmt:formatNumber>"><fmt:formatNumber type="number" value="${n }"></fmt:formatNumber></span></c:forEach>
					</li>
				</c:forEach>
			</ul>
		</div>
		<script src="plug-in/mui/js/mui.min.js"></script>
		<script src="plug-in/mui/js/mui.enterfocus.js"></script>
		<script src="plug-in/mui/js/app.js"></script>
		<script>
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
		</script>
	</body>
</html>