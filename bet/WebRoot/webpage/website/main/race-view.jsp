<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>排名竞猜</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<!--标准mui.css-->
		<link rel="stylesheet" href="plug-in/mui/css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/app.css"/>
		<link rel="stylesheet" type="text/css" href="plug-in/mui/css/bet.css"/>
		<style>
			.info-title{
				color: #000000;
				font-weight: bold;
				font-size: 12px;
			}
			.time{
				color: red;
				font-size: 14px;
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
.mui-loader {
				position: absolute;
				top: 25%;
				width: 100%;
				height: 60%;
				color: #888;
				font-size: 20px;
				font-weight:bold;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">排名竞猜（第${phaseInfo.nextPhase}期）</h1>
			<button class="mui-btn mui-btn-link mui-pull-right" onclick="confirmBetAmount()">投注</button>
		</header>
		
		<div class="mui-content">
		<c:if test="${IS_STOP == 'true' }"><div class="mui-loader">当前尚未开盘...</div></c:if>
		<c:if test="${IS_STOP == null }">
			<div class="mui-table-view-divider" id="openPhase">
				<span class="info-title">${phaseInfo.openPhase}期:</span>
				<c:forEach items="${phaseInfo.openResult }" var="o"><span class="mui-badge mui-badge-<fmt:formatNumber type="number" value="${o }"></fmt:formatNumber>"><fmt:formatNumber type="number" value="${o }"></fmt:formatNumber></span> </c:forEach>
			</div>
			<div class="mui-table-view-divider">
				<input type="hidden" name="fpTime" id="fpTime" value='${phaseInfo.fpTime }'/>
				<input type="hidden" name="nextPhase" id="nextPhase" value='${phaseInfo.nextPhase }'/>
				<span class="info-title">距封盘:</span>
				<span class="time fp-time">--:--</span> 
				<span class="info-title">距开奖:</span>
				<span class="time kj-time">--:--</span>
			</div>
			<div class="mui-table-view">
				<ul class="mui-table-view">
					<li class="mui-table-view-cell mui-collapse li-bet" index="0"><a class="mui-navigate-right" href="#">冠军</a>
						<div class="mui-collapse-content" style="padding-top: 5px;">
						<div class="mui-table-view-divider">
        					<div class="bet-row-xs-3">
        						赛道
        					</div>
        					<div class="bet-row-xs-4">
        						赔率
        					</div>
        					<div>
        						投注额
        					</div>
        				</div>
        				<form id="betForm1">
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-1">1</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-2">2</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-3">3</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-4">4</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-5">5</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-6">6</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-7">7</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-8">8</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-9">9</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-10">10</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				
						</form>
						</div>
					</li>
					<li class="mui-table-view-cell mui-collapse li-bet" index="1"><a class="mui-navigate-right" href="#">亚军</a>
						<div class="mui-collapse-content" style="padding-top: 5px;">
						<div class="mui-table-view-divider">
        					<div class="bet-row-xs-3">
        						赛道
        					</div>
        					<div class="bet-row-xs-4">
        						赔率
        					</div>
        					<div>
        						投注额
        					</div>
        				</div>
        				<form id="betForm2">
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-1">1</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-2">2</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-3">3</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-4">4</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-5">5</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-6">6</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-7">7</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-8">8</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-9">9</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-10">10</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				
						</form>
						</div>
					</li>
					<li class="mui-table-view-cell mui-collapse li-bet" index="2"><a class="mui-navigate-right" href="#">第3名</a>
						<div class="mui-collapse-content" style="padding-top: 5px;">
						<div class="mui-table-view-divider">
        					<div class="bet-row-xs-3">
        						赛道
        					</div>
        					<div class="bet-row-xs-4">
        						赔率
        					</div>
        					<div>
        						投注额
        					</div>
        				</div>
        				<form id="betForm3">
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-1">1</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-2">2</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-3">3</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-4">4</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-5">5</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-6">6</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-7">7</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-8">8</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-9">9</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-10">10</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				
						</form>
						</div>
					</li>
					<li class="mui-table-view-cell mui-collapse li-bet" index="3"><a class="mui-navigate-right" href="#">第4名</a>
						<div class="mui-collapse-content" style="padding-top: 5px;">
						<div class="mui-table-view-divider">
        					<div class="bet-row-xs-3">
        						赛道
        					</div>
        					<div class="bet-row-xs-4">
        						赔率
        					</div>
        					<div>
        						投注额
        					</div>
        				</div>
        				<form id="betForm4">
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-1">1</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-2">2</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-3">3</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-4">4</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-5">5</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-6">6</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-7">7</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-8">8</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-9">9</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-10">10</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
						</form>
						</div>
					</li>
					<li class="mui-table-view-cell mui-collapse li-bet" index="4"><a class="mui-navigate-right" href="#">第5名</a>
						<div class="mui-collapse-content" style="padding-top: 5px;">
						<div class="mui-table-view-divider">
        					<div class="bet-row-xs-3">
        						赛道
        					</div>
        					<div class="bet-row-xs-4">
        						赔率
        					</div>
        					<div>
        						投注额
        					</div>
        				</div>
        				<form id="betForm5">
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-1">1</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-2">2</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-3">3</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-4">4</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-5">5</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-6">6</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-7">7</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-8">8</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-9">9</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-10">10</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				
						</form>
						</div>
					</li>
					<li class="mui-table-view-cell mui-collapse li-bet" index="5"><a class="mui-navigate-right" href="#">第6名</a>
						<div class="mui-collapse-content" style="padding-top: 5px;">
						<div class="mui-table-view-divider">
        					<div class="bet-row-xs-3">
        						赛道
        					</div>
        					<div class="bet-row-xs-4">
        						赔率
        					</div>
        					<div>
        						投注额
        					</div>
        				</div>
        				<form id="betForm6">
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-1">1</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-2">2</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-3">3</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-4">4</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-5">5</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-6">6</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-7">7</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-8">8</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-9">9</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-10">10</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				
						</form>
						</div>
					</li>
					<li class="mui-table-view-cell mui-collapse li-bet" index="6"><a class="mui-navigate-right" href="#">第7名</a>
						<div class="mui-collapse-content" style="padding-top: 5px;">
						<div class="mui-table-view-divider">
        					<div class="bet-row-xs-3">
        						赛道
        					</div>
        					<div class="bet-row-xs-4">
        						赔率
        					</div>
        					<div>
        						投注额
        					</div>
        				</div>
        				<form id="betForm7">
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-1">1</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-2">2</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-3">3</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-4">4</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-5">5</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-6">6</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-7">7</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-8">8</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-9">9</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-10">10</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				
						</form>
						</div>
					</li>
					<li class="mui-table-view-cell mui-collapse li-bet" index="7"><a class="mui-navigate-right" href="#">第8名</a>
						<div class="mui-collapse-content" style="padding-top: 5px;">
						<div class="mui-table-view-divider">
        					<div class="bet-row-xs-3">
        						赛道
        					</div>
        					<div class="bet-row-xs-4">
        						赔率
        					</div>
        					<div>
        						投注额
        					</div>
        				</div>
        				<form id="betForm8">
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-1">1</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-2">2</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-3">3</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-4">4</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-5">5</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-6">6</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-7">7</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-8">8</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-9">9</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-10">10</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				
						</form>
						</div>
					</li>
					<li class="mui-table-view-cell mui-collapse li-bet" index="8"><a class="mui-navigate-right" href="#">第9名</a>
						<div class="mui-collapse-content" style="padding-top: 5px;">
						<div class="mui-table-view-divider">
        					<div class="bet-row-xs-3">
        						赛道
        					</div>
        					<div class="bet-row-xs-4">
        						赔率
        					</div>
        					<div>
        						投注额
        					</div>
        				</div>
        				<form id="betForm9">
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-1">1</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-2">2</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-3">3</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-4">4</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-5">5</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-6">6</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-7">7</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-8">8</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-9">9</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-10">10</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				
						</form>
						</div>
					</li>
					<li class="mui-table-view-cell mui-collapse li-bet" index="9"><a class="mui-navigate-right" href="#">第10名</a>
						<div class="mui-collapse-content" style="padding-top: 5px;">
						<div class="mui-table-view-divider">
        					<div class="bet-row-xs-3">
        						赛道
        					</div>
        					<div class="bet-row-xs-4">
        						赔率
        					</div>
        					<div>
        						投注额
        					</div>
        				</div>
        				<form id="betForm10">
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-1">1</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-2">2</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-3">3</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-4">4</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-5">5</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-6">6</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-7">7</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-8">8</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-9">9</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				<div class="bet-row">
        					<div class="bet-row-xs-3">
        						<span class="mui-badge mui-badge-10">10</span>
        					</div>
        					<div class="bet-row-xs-4">
        						<span class="odds">9.7</span>
        					</div>
        					<div>
        						<input class="bet-amount" onkeyup="isInteger(this)"
        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
        					</div>
        				</div>
        				
						</form>
						</div>
					</li>
				</ul>
			</div>
			<div class="mui-button-row">
						<!--<a onclick="confirmBetAmount('1')" class="mui-btn mui-btn-primary" >投注</a>-->
						<a onclick="confirmBetAmount('1')"class="mui-btn mui-btn-primary" >投注</a>
						&nbsp;&nbsp;
						<a class="mui-btn mui-btn-danger" onclick="resetAmount('1')">重填</a>
						</div>
						</c:if>
		</div>
		<div id="modal" class="mui-modal">
				<header class="mui-bar mui-bar-nav">
					<a class="mui-icon mui-icon-close mui-pull-right" href="#modal"></a>
					<h1 class="mui-title">注单确认</h1>
				</header>
				<div class="mui-content" id="modal-content" style="height: 100%;">
					
				</div>
			</div>
	</body>
	<script src="plug-in/mui/js/mui.min.js"></script>
	<script src="plug-in/mui/js/alarm.js"></script>
	<script>
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
		function refreshPhaseInfo(){
			//请求 开奖信息  距离开奖时间 当前期数 上期结果  
			//在开奖时间45秒之内 则封盘  
			//距离开奖时间大于45秒  开启封盘倒计时 
			mui.ajax('betController.do?getPhaseInfo',{
				dataType:'json',//服务器返回json格式数据
				type:'get',//HTTP请求类型
				success:function(data){
					mui("#fpTime")[0].value = data.fpTime;
					mui("#nextPhase")[0].value = data.nextPhase;
					clearInterval(fpTimer.flag);
					clearInterval(kjTimer.flag);
					fpTimer = new Alarm(0,parseInt(data.fpTime),function(second,minute){
						mui(".fp-time")[0].innerHTML=minute+":"+second;
					},fp);
					kjTimer = new Alarm(0,parseInt(data.kjTime),function(second,minute){
						mui(".kj-time")[0].innerHTML=minute+":"+second;
					},kj);
					fpTimer.start();
					kjTimer.start();
					var openPhaseHtml = "<span class='info-title'>"+data.openPhase+"期:</span> ";
					for(var i in data.openResult){
						var result = data.openResult[i];
						openPhaseHtml+=" <span class='mui-badge mui-badge-"+parseInt(result)+"'>"+parseInt(result)+"</span>";
					}
					mui("#openPhase")[0].innerHTML = openPhaseHtml;
					mui(".mui-title")[0].innerHTML = "排名竞猜（第"+data.nextPhase+"期）";
				}
			});
		}
		//封盘方法
		function fp(){
			mui("#fpTime")[0].value = "0";
			mui(".fp-time")[0].innerHTML="00:00";
			mui(".bet-amount").each(function(index,item){
				var parentNode = item.parentNode;
				parentNode.innerHTML = "<span class='fp-span' style='color: red;'>---封盘---</span>";
			});
		}
		//开奖方法 --请求开奖数据  下一期信息  
		//-- 下期开奖时间 45秒之前 开启盘口
		//--
		function kj(){
        	mui(".fp-span").each(function(index,item){
        		var parentNode = item.parentNode;
        		parentNode.innerHTML = "<input class='bet-amount' onkeyup='isInteger(this)'"
            						 +"type='number' value='' name='amount' placeholder='' style='text-align:center' />分";
        	});
        	refreshPhaseInfo();
        	mui.later(refreshPhaseInfo,20000);
		}
		
		var fpTimer = new Alarm(0,parseInt("${phaseInfo.fpTime}"),function(second,minute){
			mui(".fp-time")[0].innerHTML=minute+":"+second;
		},fp);
		var kjTimer = new Alarm(0,parseInt("${phaseInfo.kjTime}"),function(second,minute){
			mui(".kj-time")[0].innerHTML=minute+":"+second;
		},kj);
		mui.ready(function(){
			var comfirmSuccess = localStorage.getItem("comfirmSuccess");
			if(comfirmSuccess == true || "true"==comfirmSuccess){
				resetAmount();
				localStorage.removeItem("comfirmSuccess");
			}
			var type = localStorage.getItem("type");
			if(type != null){ 
				type = parseInt(type)
				var oldCls = mui(".li-bet")[type].getAttribute("class");
				oldCls += " mui-active";
				mui(".li-bet")[type].setAttribute("class",oldCls);
			}
			localStorage.removeItem("type");
			localStorage.removeItem("betList");
			fpTimer.start();
			kjTimer.start();
			var refreshTimer = setInterval(refreshPhaseInfo,60000);
		});
		function isInteger(obj){
			var value = obj.value;
			if(!isNaN(value)&& value!=0){
				obj.value = Math.floor(value);
			}else{
				obj.value = "";
			}
		}
		function confirmBetAmount(){
			var betList = [];
			var totalAmount = 0;
			var fpTime = mui("#fpTime")[0].value;
			if(parseInt(fpTime) <= 0){
				mui.toast("已经封盘，不能进行投注。");
				return;
			}
			for(var type=1;type<11;type++){
				mui.each(mui("#betForm"+type+" .bet-amount"),function(index,item){
					if(item.value != ""){
						var bet = {};
						bet.amount = item.value;
						bet.game = "1";
						bet.phase = mui("#nextPhase")[0].value;
						bet.type = type;
						bet.odds = mui("#betForm"+type+" .odds")[index].innerHTML
						bet.target=mui("#betForm"+type+" .mui-badge")[index].innerHTML;
						var odds = parseFloat(mui("#betForm"+type+" .odds")[index].innerHTML);
						bet.odds = odds;
						//bet.winAmount = odds*parseInt(item.value)-parseInt(item.value);
						betList.push(bet);
						totalAmount += parseInt(item.value);
					}
				});
			}
			/* if(totalAmount > parseFloat("${LOCAL_CLINET_USER.point}")){
				mui.toast("您的积分不足，请修改投注积分！");
				return;
			} */
			if(betList.length == 0){
				mui.toast("您没有输入任何投注积分，请输入！");
				return;
			}
			localStorage.setItem("betList",JSON.stringify(betList));
			localStorage.setItem("type",mui(".mui-active")[0].getAttribute("index"));
			mui.openWindow("betController.do?comfirmBetOrder","comfirm-bet");
		}
		function resetAmount(){
			mui.each(mui(".bet-amount"),function(index,item){
				item.value="";
			})
		}
	</script>
</html>