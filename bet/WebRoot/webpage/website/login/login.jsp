<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html class="ui-page-login">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>登录</title>
		<link href="plug-in/mui/css/mui.min.css" rel="stylesheet" />
		<link href="plug-in/mui/css/style.css" rel="stylesheet" />
		<link href="webpage/website/login/style.css" rel="stylesheet" />
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<h1 class="mui-title">登录</h1>
		</header>
		<div class="mui-content">
			<img src="webpage/source/images/logo.png" style="width:100%;height:auto;"/>
			<form id='login-form' class="mui-input-group" action="loginController.do?login" check="loginController.do?checkuser">
				<div class="mui-input-row">
					<label>账号</label>
					<input id='account' type="text" class="mui-input-clear mui-input" placeholder="请输入账号">
				</div>
				<div class="mui-input-row">
					<label>密码</label>
					<input id='password' type="password" class="mui-input-clear mui-input" placeholder="请输入密码">
				</div>
			</form>
			<form class="mui-input-group">
				<ul class="mui-table-view mui-table-view-chevron">
					<li class="mui-table-view-cell">
						自动登录
						<div id="autoLogin" class="mui-switch">
							<div class="mui-switch-handle"></div>
						</div>
					</li>
				</ul>
			</form>
			<div class="mui-content-padded">
				<button id='login' class="mui-btn mui-btn-block mui-btn-primary">登录</button>
				<!--<div class="link-area"><a id='reg'>注册账号</a> <span class="spliter">|</span> <a id='forgetPassword'>忘记密码</a>  -->
				</div>
			</div>
			<div class="mui-content-padded oauth-area">

			</div>
		</div>
		<script src="plug-in/mui/js/mui.min.js"></script>
		<script src="plug-in/mui/js/mui.enterfocus.js"></script>
		<script src="plug-in/mui/js/app.js"></script>
		<script>
			(function($, doc) {
				$.init({
					statusBarBackground: '#f7f7f7'
				});
				$.ready(function() {
					//plus.screen.lockOrientation("portrait-primary");
					var settings = app.getSettings();
					var state = app.getState();
					/* var mainPage = $.preload({
						"id": 'main',
						"url": 'main.html'
					});
					var main_loaded_flag = false;
					mainPage.addEventListener("loaded",function () {
						main_loaded_flag = true;
					}); */
					var toMain = function(mainPage) {
						//使用定时器的原因：
						//可能执行太快，main页面loaded事件尚未触发就执行自定义事件，此时必然会失败
						var id = setInterval(function () {
							//if(main_loaded_flag){
								clearInterval(id);
								$.fire(mainPage, 'show', null);
								mainPage.show("pop-in");
							//}
						},20);
					};
					//检查 "登录状态/锁屏状态" 开始
					/* if (settings.autoLogin && state.token && settings.gestures) {
						$.openWindow({
							url: 'unlock.html',
							id: 'unlock',
							show: {
								aniShow: 'pop-in'
							},
							waiting: {
								autoShow: false
							}
						});
					} else if (settings.autoLogin && state.token) {
						toMain();
					} */
					//检查 "登录状态/锁屏状态" 结束
					var loginButton = doc.getElementById('login');
					var accountBox = doc.getElementById('account');
					var passwordBox = doc.getElementById('password');
					var autoLoginButton = doc.getElementById("autoLogin");
					var regButton = doc.getElementById('reg');
					var forgetButton = doc.getElementById('forgetPassword');
					loginButton.addEventListener('tap', function(event) {
						var loginInfo = {
								userName: accountBox.value,
							password: passwordBox.value
						};
						app.login(loginInfo, function(err) {
							if (err) {
								mui.toast(err);
								return;
							}
							var actionurl=document.getElementById('login-form').action;//提交路径
							var mainPage = $.preload({
								"id": 'main',
								"url": actionurl
							});
							var webview = mui.openWindow({
								id:"main",
								url:actionurl,
								extras:{
									name:'mui'  //自定义扩展参数，可以用来处理页面间传值
								},
								 show:{
								      autoShow:true,//页面loaded事件发生后自动显示，默认为true
								      aniShow:"pop-in",//页面显示动画，默认为”slide-in-right“；
								    }
							});
						});
					});
					$.enterfocus('#login-form input', function() {
						$.trigger(loginButton, 'tap');
					});
					autoLoginButton.classList[settings.autoLogin ? 'add' : 'remove']('mui-active')
					autoLoginButton.addEventListener('toggle', function(event) {
						setTimeout(function() {
							var isActive = event.detail.isActive;
							settings.autoLogin = isActive;
							app.setSettings(settings);
						}, 50);
					}, false);
					regButton.addEventListener('tap', function(event) {
						$.openWindow({
							url: 'reg.html',
							id: 'reg',
							preload: true,
							show: {
								aniShow: 'pop-in'
							},
							styles: {
								popGesture: 'hide'
							},
							waiting: {
								autoShow: false
							}
						});
					}, false);
					forgetButton.addEventListener('tap', function(event) {
						$.openWindow({
							url: 'forget_password.html',
							id: 'forget_password',
							preload: true,
							show: {
								aniShow: 'pop-in'
							},
							styles: {
								popGesture: 'hide'
							},
							waiting: {
								autoShow: false
							}
						});
					}, false);
					//
					window.addEventListener('resize', function() {
						//oauthArea.style.display = document.body.clientHeight > 400 ? 'block' : 'none';
					}, false);
					
				});
			}(mui, document));
		</script>
	</body>
</html>