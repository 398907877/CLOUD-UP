<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>我的注单</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="plug-in/mui/css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/app.css"/>
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/bet.css"/>
		<style type="text/css">
			.win-span-0{
				color: #000;
			}
			.win-span-1{
				color: green;
			}
			.win-span-2{
				color:red;
			}
			
.mui-table-view-cell>a:not(.mui-btn) {
    background-color: lightblue;
    }
    .mui-navigate-right:after{
    	color: #000;
    }
    .info-title{
    	color: #000;
    }
		</style>
</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a    href="loginController.do?login" class=" mui-btn mui-btn-link mui-pull-left">首页</a>
			<h1 class="mui-title">我的注单</h1>
		</header>
		<div class="mui-content">
			<div id="segmentedControl" class="mui-segmented-control mui-segmented-control-inverted mui-segmented-control-primary">
				<a class="mui-control-item mui-active" href="#item1">
				未结算注单</a>
				<a class="mui-control-item" href="#item2">
				已结算注单</a>
			</div>
			<div class="mui-table-view-divider">
				<span class="info-title">今日--总投注:${betInfo[0].amount }</span>
				<span class="info-title">输/赢:${betInfo[0].result }</span>
			</div>
			<div id="item1" class="mui-control-content mui-active">
					<div class="mui-card">
					<ul class="mui-table-view">
					<c:forEach items="${ betOrderList}" var="b">
					<c:if test="${b.state=='1' }">
					<li class="mui-table-view-cell mui-collapse mui-active">
						<a class="mui-navigate-right">
							注单号:${b.id }
						</a>
						<div class="mui-collapse-content ">
						<c:set var="type" value="第${b.type }名"></c:set>
							<c:if test="${b.type == '1'}">
								<c:set var="type" value="冠军"></c:set>
							</c:if>
							<c:if test="${b.type == '2'}">
								<c:set var="type" value="亚军"></c:set>
							</c:if>
							<div class="mui-input-row">第${b.phase}期</div>
							<div class="mui-input-row">${type }[<span class="mui-badge-ext mui-badge-${b.target }">${b.target }</span>] &nbsp; <span class="odds">&nbsp;@${b.odds }</span></div>
							<div class="mui-input-row">下注额：${b.amount }</div>
							<div class="mui-input-row">可赢额：${b.winamount }</div>
						</div>
					</li>
					</c:if>
					</c:forEach>
					</ul>
					</div>
				</div>
				<div id="item2" class="mui-control-content">
					<div class="mui-card">
					<ul class="mui-table-view">
					<c:forEach items="${ betOrderList}" var="b">
					<c:if test="${b.state=='2' }">
					<li class="mui-table-view-cell mui-collapse mui-active">
						<a class="mui-navigate-right">
							注单号:${b.id }
						</a>
						<c:set var="type" value="第${b.type }名"></c:set>
							<c:if test="${b.type == '1'}">
								<c:set var="type" value="冠军"></c:set>
							</c:if>
							<c:if test="${b.type == '2'}">
								<c:set var="type" value="亚军"></c:set>
							</c:if>
						<div class="mui-collapse-content ">
							<div class="mui-input-row">第${b.phase}期</div>
							<div class="mui-input-row">${type }[<span class="mui-badge-ext mui-badge-${b.target }">${b.target }</span>] &nbsp; <span class="odds">&nbsp;@${b.odds }</span></div>
							<div class="mui-input-row">下注额：${b.amount }</div>
							<div class="mui-input-row">可赢额：${b.winamount }</div>
							<div class="mui-input-row">赢/输：<span class="win-span-${b.resulttype }">${b.result }</span></div>
						</div>
					</li>
					</c:if>
					</c:forEach>
					</ul>
					</div>
					</div>
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