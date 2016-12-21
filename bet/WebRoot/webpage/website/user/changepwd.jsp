<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<html class="ui-page-login">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title></title>
		<link href="plug-in/mui/css/mui.min.css" rel="stylesheet" />
		<link href="plug-in/mui/css/style.css" rel="stylesheet" />
		<style>
			.area {
				margin: 20px auto 0px auto;
			}
			.mui-input-group:first-child {
				margin-top: 20px;
			}
			.mui-input-group label {
				width: 22%;
			}
			.mui-input-row label~input,
			.mui-input-row label~select,
			.mui-input-row label~textarea {
				width: 78%;
			}
			.mui-checkbox input[type=checkbox],
			.mui-radio input[type=radio] {
				top: 6px;
			}
			.mui-content-padded {
				margin-top: 25px;
			}
			.mui-btn {
				padding: 10px;
			}
			.mui-input-row label~input, .mui-input-row label~select, .mui-input-row label~textarea{
				margin-top: 1px;
			}
		</style>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">修改密码</h1>
		</header>
		<div class="mui-content">
			<form class="mui-input-group">
				<div class="mui-input-row">
					<label>旧密码</label>
					<input id='password' type="password" class="mui-input-clear mui-input" placeholder="请输入旧密码"/>
				</div>
				<div class="mui-input-row">
					<label>新密码</label>
					<input id='newPassword' type="password" class="mui-input-clear mui-input" placeholder="请输入新密码 "/>
				</div>
			</form>
			<div class="mui-content-padded">
				<button id="changeBtn" class="mui-btn mui-btn-block mui-btn-primary">提交</button>
			</div>
		</div>
		<script src="plug-in/mui/js/mui.min.js"></script>
		<script>
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
		mui.ready(function(){
			document.getElementById("changeBtn").addEventListener('tap', function(event) {
				var pwdInfo = {};
				pwdInfo.password = document.getElementById("password").value;
				pwdInfo.newpassword = document.getElementById("newPassword").value;
				if (pwdInfo.newpassword.length < 6) {
					return mui.toast('密码最短为 6 个字符');
				}
				mui.post("userController.do?savenewpwd",pwdInfo,function(data){
	    	 		var d = mui.parseJSON(data);
	    	 		mui.toast(d.msg);
	         		if (d.success) {
	         			localStorage.setItem("maintab","my");
	        	 		if (/(iPhone|iPad|iPod|Safari)/i.test(navigator.userAgent)) {             
		            		window.location.href = window.document.referrer;
						}else{
							mui.back();
						}
	         		}
	         	}); 
			});
		});
		</script>
	</body>

</html>