<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>赛况直播</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<!--标准mui.css-->
		<link rel="stylesheet" href="plug-in/mui/css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/app.css"/>
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/bet.css"/>

	</head>
	<body >


		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">赛车直播</h1>
		</header>
		<div    style="height: 100%" class="mui-content">
				
	
	<iframe   id="MarRight"  src="http://m.yx22.com/shipin.html?from=singlemessage&isappinstalled=0" 
	
	> </iframe>
	
		</div>
	
	
	</body>
	<script src="plug-in/mui/js/mui.min.js"></script>
	<script src="plug-in/mui/js/alarm.js"></script>
	<script type="text/javascript">

	mui.ready(function(){

		defaulIframePageHeight();

		});


	
    function defaulIframePageHeight() {
        var ifm = document.getElementById("MarRight");
        var subWeb = document.frames ? document.frames["MarRight"].document : ifm.contentDocument;
        if (ifm != null && subWeb != null) {
            ifm.height = subWeb.body.scrollHeight;
        }

    }
	</script>
</html>