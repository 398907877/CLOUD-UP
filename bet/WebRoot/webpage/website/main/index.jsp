<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="plug-in/mui/css/mui.min.css">
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/icons-extra.css" />
		<style type="text/css">
		.mui-icon-extra{
			font-size:2.4em
			}
		.mui-media-body{
			font-weight: bold;
		}
		</style>
		<script src="plug-in/mui/js/mui.min.js"></script>
		<script src="plug-in/mui/js/mui.enterfocus.js"></script>
		<script src="plug-in/mui/js/app.js"></script>
	</head>
<body>
	<header class="mui-bar mui-bar-nav">
			<h1 class="mui-title">首页</h1>
		</header>
		<nav class="mui-bar mui-bar-tab">
			<a class="mui-tab-item mui-active" href="#tabbar">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-chat">
				<span class="mui-icon mui-icon-email"><span class="mui-badge">9</span></span>
				<span class="mui-tab-label">消息</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-map">
				<span class="mui-icon mui-icon-gear"></span>
				<span class="mui-tab-label">我的</span>
			</a>
		</nav>
		<div class="mui-content">
			<div id="Gallery" class="mui-slider" style="margin-top:15px;">
				<div class="mui-slider-group">
					<div class="mui-slider-item">
						<ul class="mui-table-view mui-grid-view mui-grid-9">
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon-extra mui-icon mui-icon-extra-grech"></span>
									<div class="mui-media-body">赛车排名</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-email"><span class="mui-badge">5</span></span>
									<div class="mui-media-body">Email</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-chatbubble"></span>
									<div class="mui-media-body">Chat</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-location"></span>
									<div class="mui-media-body">location</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-search"></span>
									<div class="mui-media-body">Search</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-phone"></span>
									<div class="mui-media-body">Phone</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-gear"></span>
									<div class="mui-media-body">Setting</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-info"></span>
									<div class="mui-media-body">about</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-more"></span>
									<div class="mui-media-body">more</div>
								</a>
							</li>
						</ul>
					</div>
					<div class="mui-slider-item">
						<ul class="mui-table-view mui-grid-view mui-grid-9">
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-home"></span>
									<div class="mui-media-body">Home</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-email"><span class="mui-badge">5</span></span>
									<div class="mui-media-body">Email</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-chatbubble"></span>
									<div class="mui-media-body">Chat</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-location"></span>
									<div class="mui-media-body">location</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-search"></span>
									<div class="mui-media-body">Search</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-phone"></span>
									<div class="mui-media-body">Phone</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-gear"></span>
									<div class="mui-media-body">Setting</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-info"></span>
									<div class="mui-media-body">about</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-more"></span>
									<div class="mui-media-body">more</div>
								</a>
							</li>
						</ul>
					</div>
					<div class="mui-slider-item">
						<ul class="mui-table-view mui-grid-view mui-grid-9">
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-home"></span>
									<div class="mui-media-body">Home</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-email"><span class="mui-badge">5</span></span>
									<div class="mui-media-body">Email</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-chatbubble"></span>
									<div class="mui-media-body">Chat</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-location"></span>
									<div class="mui-media-body">location</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-search"></span>
									<div class="mui-media-body">Search</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-phone"></span>
									<div class="mui-media-body">Phone</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-gear"></span>
									<div class="mui-media-body">Setting</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-info"></span>
									<div class="mui-media-body">about</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-more"></span>
									<div class="mui-media-body">more</div>
								</a>
							</li>
						</ul>
					</div>

				</div>
				<div class="mui-slider-indicator">
					<div class="mui-indicator mui-active"></div>
					<div class="mui-indicator"></div>
					<div class="mui-indicator"></div>
				</div>
			</div>
		</div>
</body>
</html>
