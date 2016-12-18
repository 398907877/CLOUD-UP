<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>免责说明</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="plug-in/mui/css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/app.css"/>
		
		
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/bet.css"/>
</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a    href="loginController.do?login" class=" mui-btn mui-btn-link mui-pull-left">首页</a>
			<h1 class="mui-title">免责说明</h1>
		</header>
		<div class="mui-content">
			<br/><br/><br/><br/><br/>
		<h4   style="color: green">本软件仅供开发学习交流，不得用于任何商业行为及赌博等违法行为。否则产生的一切后果由使用者本人承担。</h4>
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