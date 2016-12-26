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

    background-color: rgba(0,0,0,.15);
}
		</style>
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/bet.css"/>
</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a    href="loginController.do?login" class=" mui-btn mui-btn-link mui-pull-left">首页</a>
			<h1 class="mui-title">历史开奖</h1>
		</header>
		<div class="mui-content">
			<ul class="mui-table-view">
				<c:forEach items="${phaseHistory }" var="p">
					<li class="mui-table-view-cell">${p.phase }期
					<span class="mui-badge-his mui-badge-${p.ranking1 }">${p.ranking1 }</span>
					<span class="mui-badge-his mui-badge-${p.ranking2 }">${p.ranking2 }</span>
					<span class="mui-badge-his mui-badge-${p.ranking3 }">${p.ranking3 }</span>
					<span class="mui-badge-his mui-badge-${p.ranking4 }">${p.ranking4 }</span>
					<span class="mui-badge-his mui-badge-${p.ranking5 }">${p.ranking5 }</span>
					<span class="mui-badge-his mui-badge-${p.ranking6 }">${p.ranking6 }</span>
					<span class="mui-badge-his mui-badge-${p.ranking7 }">${p.ranking7 }</span>
					<span class="mui-badge-his mui-badge-${p.ranking8 }">${p.ranking8 }</span>
					<span class="mui-badge-his mui-badge-${p.ranking9 }">${p.ranking9 }</span>
					<span class="mui-badge-his mui-badge-${p.ranking10 }">${p.ranking10 }</span>
					<br />冠亚和：${p.top2 } -- ${p.top2b } -- ${p.top2d }
					<br />1~5龙虎：${p.ranking1lh } -- ${p.ranking2lh } -- ${p.ranking3lh } -- ${p.ranking4lh } -- ${p.ranking5lh }
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