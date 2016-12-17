<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="plug-in/mui/css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/app.css"/>
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/bet.css"/>
		<style>
			.title{
				margin: 20px 15px 7px;
				color: #6d6d72;
				font-size: 15px;
			}
			.mui-bar .mui-btn-link {
    font-size: 16px;
    line-height: 25px;
    top: 8px;
    padding: 1px 4px;
    color: #fff;
    background-color: #7188CA;
    border: solid 1px #7188ca;
}
.head {
				height: 40px;
			}
			#head {
				line-height: 40px;
			}
			.head-img {
				width: 40px;
				height: 40px;
			}
			#head-img1 {
				position: absolute;
				bottom: 10px;
				right: 40px;
				width: 40px;
				height: 40px;
			}
			.mui-page .mui-table-view:first-child {
				margin-top: 15px;
			}
			.mui-page .mui-table-view:last-child {
				margin-bottom: 30px;
			}
			.mui-table-view {
				margin-top: 20px;
			}
			
			.mui-table-view span.mui-pull-right {
				color: #999;
			}
			.mui-table-view-divider {
				background-color: #efeff4;
				font-size: 14px;
			}
			.mui-table-view-divider:before,
			.mui-table-view-divider:after {
				height: 0;
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">我的</h1>
		</header>
		<div class="mui-content">
			<div class="mui-scroll-wrapper ">
					<div class="mui-scroll">
						<ul class="mui-table-view mui-table-view-chevron">
							<li class="mui-table-view-cell mui-media">
								<a class="mui-navigate-right" href="#account">
									<img class="mui-media-object mui-pull-left head-img" id="head-img" src="webpage/source/images/logo.png">
									<div class="mui-media-body">
										${ LOCAL_CLINET_USER.userName}
										<p class='mui-ellipsis'>积分：${LOCAL_CLINET_USER.point }</p>
									</div>
								</a>
							</li>
						</ul>
						<ul class="mui-table-view mui-table-view-chevron">
							<li class="mui-table-view-cell">
								<a href="#account" class="mui-navigate-right">账号与安全</a>
							</li>
						</ul>
						<ul class="mui-table-view mui-table-view-chevron">
							<li class="mui-table-view-cell">
								<a href="#notifications" class="mui-navigate-right">新消息通知</a>
							</li>
							<li class="mui-table-view-cell">
								<a href="#privacy" class="mui-navigate-right">隐私</a>
							</li>
							<li class="mui-table-view-cell">
								<a href="#general" class="mui-navigate-right">通用</a>
							</li>
						</ul>
						<ul class="mui-table-view">
							<li class="mui-table-view-cell" style="text-align: center;">
								<a>退出登录</a>
							</li>
						</ul>
					</div>
				</div>
		</div>
	</body>
	<script src="plug-in/mui/js/mui.min.js"></script>
	<script>
	
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
	</script>
</html>