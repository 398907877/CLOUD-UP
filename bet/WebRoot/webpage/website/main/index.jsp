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
		<script src="plug-in/mui/js/mui.min.js"></script>
		<script src="plug-in/mui/js/mui.enterfocus.js"></script>
		<script src="plug-in/mui/js/app.js"></script>
		
				<script src="plug-in/jquery/jquery-1.8.0.min.js"></script>
	
		
	</head>
<body>
	<header class="mui-bar mui-bar-nav">
			<h1 class="mui-title">首页</h1>
		</header>
		<nav class="mui-bar mui-bar-tab">
			<a id="index" class="mui-tab-item mui-active" href="#index-content">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-chat">
				<span class="mui-icon mui-icon-email"></span>
				<span class="mui-tab-label">消息</span>
			</a>
			<a  id="my" class="mui-tab-item" href="#my-content">
				<span class="mui-icon mui-icon-gear"></span>
				<span class="mui-tab-label">我的</span>
			</a>
		</nav>
		<div class="mui-content">
			<div id="index-content" class="mui-control-content mui-active">
			<div id="Gallery" class="mui-slider" style="margin-top:15px;">
				<div class="mui-slider-group">
		
					
					<div class="mui-slider-item">
						<ul class="mui-table-view mui-grid-view mui-grid-9">
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="betController.do?raceView2">
									<span class="mui-icon-extra mui-icon mui-icon-extra-grech"></span>
									<div class="mui-media-body">赛车排名</div>
								</a>
							</li>
									<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="http://m.yx22.com/shipin.html?from=singlemessage&isappinstalled=0">
								
									<span class="mui-icon-extra mui-icon-extra-custom"></span>
									<div class="mui-media-body">实时赛况</div>
								</a>
							</li>
							
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="betController.do?myBetOrder">
									<span class="mui-icon-extra mui-icon-extra-order"></span>
									<div class="mui-media-body">我的注单</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="betController.do?phaseHistory">
									<span class="mui-icon-extra mui-icon-extra-trend"></span>
									<div class="mui-media-body">历史开奖</div>
								</a>
							</li>
							<!--  
								<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon-extra mui-icon-extra-rank"></span>
									<div class="mui-media-body">冠亚</div>
								</a>
							</li>
							
							
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon-extra mui-icon-extra-gold"></span>
									<div class="mui-media-body">单双</div>
								</a>
							</li>-->
						
					
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="betController.do?rule">
									<span class="mui-icon mui-icon-gear"></span>
									<div class="mui-media-body">游戏规则</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="betController.do?ihavenothing">
									<span class="mui-icon mui-icon-info"></span>
									<div class="mui-media-body">免责说明</div>
								</a>
							</li>
							<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
								<a href="#">
									<span class="mui-icon mui-icon-more"></span>
									<div class="mui-media-body">更多</div>
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
			<div id="tabbar-with-chat" class="mui-control-content">
			
			</div>
			<div id="my-content" class="mui-control-content mui-page">
						<ul class="mui-table-view mui-table-view-chevron">
							<li class="mui-table-view-cell mui-media">
								<a class="mui-navigate-right" href="#account">
									<img class="mui-media-object mui-pull-left head-img" id="head-img" src="webpage/source/images/logo.png">
									<div class="mui-media-body">
										${ LOCAL_CLINET_USER.userName}
										<p id="point" class='mui-ellipsis'>积分：${LOCAL_CLINET_USER.point }</p>
									</div>
								</a>
							</li>
						</ul>
						<ul class="mui-table-view mui-table-view-chevron">
							<li class="mui-table-view-cell">
								<a href="userController.do?changepwd" class="mui-navigate-right">修改密码</a>
							</li>
						</ul>
						<ul class="mui-table-view mui-table-view-chevron">
							<li class="mui-table-view-cell">
								<a href="#notifications" class="mui-navigate-right">消息通知</a>
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
								<a   href="adminLoginController.do?applogout"  >退出登录</a>
							</li>
						</ul>
					
			</div>
		</div>
</body>

<script type="text/javascript">
var btn = document.getElementById("my");
//监听点击事件
btn.addEventListener("tap",function () {

	var userid = "${LOCAL_CLINET_USER.id}";


$.ajax({
	   type: "POST",
	   url: "betController.do?getUserPoint",
	   dataType: "json",
	   data: "userId="+userid,
	   success: function(msg){


$("#point").html("积分："+msg.wujiajun);
	     
	   }
	});
});
//触发submit按钮的点击事件
mui.trigger(btn,'tap');
mui.ready(function(){
	var tabname = localStorage.getItem("maintab");
	if(tabname != null){
		var current = document.getElementById(tabname);
		var defaultTab =  document.getElementById("index");
		if(defaultTab != current){
			current.classList.add('mui-active');
			defaultTab.classList.remove('mui-active');
			document.getElementById("index-content").classList.remove('mui-active');
			document.getElementById(tabname+"-content").classList.add('mui-active');
		}
		localStorage.removeItem("maintab");
	}
});


</script>
</html>
