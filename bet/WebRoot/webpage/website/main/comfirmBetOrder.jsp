<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>注单确认</title>
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
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">注单确认</h1>
			<button class="mui-btn mui-btn-link mui-pull-right" onclick="betOrder()">投注</button>
		</header>
		<div class="mui-content">
			<div class="mui-table-view">
				<ul class="mui-table-view">
							<li class="mui-table-view-cell mui-active mui-collapse"><a class="mui-navigate-right" href="#">排名竞猜</a>
								<ul class="mui-table-view mui-table-view-chevron game1">
									
								</ul>
							</li>
							<li class="mui-table-view-cell mui-collapse mui-active"><a class="mui-navigate-right" href="#">冠亚组合</a>
								<ul class="mui-table-view mui-table-view-chevron game2">
									
								</ul>
							</li>
							<li class="mui-table-view-cell mui-collapse mui-active"><a class="mui-navigate-right" href="#">两面盘</a>
								<ul class="mui-table-view mui-table-view-chevron game3">
									
								</ul>
							</li>
							<li class="mui-table-view-cell footer">
							</li>
				</ul>
				<div class="mui-button-row">
						<button type="button" class="mui-btn mui-btn-primary" onclick="betOrder();">确认</button>&nbsp;&nbsp;
						<button type="button" class="mui-btn mui-btn-danger" onclick="mui.back();">取消</button>
					</div>
			</div>
		</div>
	</body>
	<script src="plug-in/mui/js/mui.min.js"></script>
	<script>
	mui.ready(function(){
		var rankingList = JSON.parse(window.localStorage.getItem("rankingList"));
		var top2List = JSON.parse(window.localStorage.getItem("top2List"));
		var twoList = JSON.parse(window.localStorage.getItem("twoList"));
			var totalAmount = 0;
			var totalLength = 0;
			var rankingLiHtml = "";
			mui.each(rankingList,function(index,item){
				var type = item.type;
				var typeName = "第"+type+"名";
				if("1" == type){
					typeName = "冠军";
				}else if("2" == type){
					typeName = "亚军";
				}
				totalAmount += parseInt(item.amount);
				totalLength++;
				var li ="<li class='mui-table-view-cell'>"+typeName+"[<span class='mui-badge-ext mui-badge-"+item.target+"'>"+item.target+"</span>] &nbsp  "
				+"<span class='odds'>&nbsp@"+item.odds+"&nbspX&nbsp"+item.amount+"</span></li>";
				rankingLiHtml+= li;
			});
			mui(".game1")[0].innerHTML = rankingLiHtml;
			var twoLiHtml = "";
			mui.each(twoList,function(index,item){
				var type = item.type;
				var typeName = "第"+type+"名";
				if("1" == type){
					typeName = "冠军";
				}else if("2" == type){
					typeName = "亚军";
				}
				totalLength++;
				totalAmount += parseInt(item.amount);
				var li ="<li class='mui-table-view-cell'>"+typeName+"[<span class='mui-badge-ext'>"+item.target+"</span>] &nbsp  "
				+"<span class='odds'>&nbsp@"+item.odds+"&nbspX&nbsp"+item.amount+"</span></li>";
				twoLiHtml+= li;
			});
			mui(".game3")[0].innerHTML = twoLiHtml;
			var top2LiHtml = "";
			mui.each(top2List,function(index,item){
				totalAmount += parseInt(item.amount);
				totalLength++;
				var li ="<li class='mui-table-view-cell'>冠亚和[<span class='mui-badge-ext'>"+item.target+"</span>] &nbsp  "
				+"<span class='odds'>&nbsp@"+item.odds+"&nbspX&nbsp"+item.amount+"</span></li>";
				top2LiHtml+= li;
			});
			mui(".game2")[0].innerHTML = top2LiHtml;
			/* var comfirmHtml = "<div class='mui-card'><ul class='mui-table-view'>"
				+lis+"</ul><div class='mui-card-footer' style='color:red;text-align:center;'><span>共￥"+totalAmount+"/"+betList.length+"笔，确定下注吗?<span></div>"
				+"</div>"; */
			var footerHtml ="<span style='color:red;text-align:center;'>共￥"+totalAmount+"/"+totalLength+"笔，确定下注吗?<span>";
			mui(".footer")[0].innerHTML = footerHtml;
	});
	function betOrder(){
		var rankingList = JSON.parse(window.localStorage.getItem("rankingList"));
		var top2List = JSON.parse(window.localStorage.getItem("top2List"));
		var twoList = JSON.parse(window.localStorage.getItem("twoList"));
		var betList = twoList.concat(top2List).concat(rankingList);
		mui.ajax('betController.do?betConf',{
			data:{betList:JSON.stringify(betList)},
			dataType:'json',//服务器返回json格式数据
			type:'post',//HTTP请求类型
			success:function(data){
				mui.toast(data.msg);
				if(data.success){
					localStorage.setItem("comfirmSuccess", data.success);
					if (/(iPhone|iPad|iPod|Safari)/i.test(navigator.userAgent)) {             
			            window.location.href = window.document.referrer;
					}else{
						mui.back();
					}
				}
				
			}
		});
	}
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
	</script>
</html>