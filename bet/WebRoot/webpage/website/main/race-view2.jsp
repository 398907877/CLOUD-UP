mui.toast("最大投注额为6000！");<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    background-color: #007aff;
    border: solid 1px #007aff;
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
			#sliderSegmentedControl .mui-control-item{
				line-height:30px;
			}
			 .mui-control-content{
				min-height:450px;
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			<a    href="loginController.do?login" class=" mui-btn mui-btn-link mui-pull-left">首页</a>
			<h1 class="mui-title">排名竞猜（第${phaseInfo.nextPhase}期）</h1>
			<button class="mui-btn mui-btn-link mui-pull-right" onclick="confirmBetAmount()">投注</button>
		</header>
		
		<div class="mui-content">
		<c:if test="${IS_STOP == 'true' }"><div class="mui-loader">当前尚未开盘...</div></c:if>
		<c:if test="${IS_STOP == null }">
			<div class="mui-table-view-divider" id="openPhase">
				<span class="info-title">${phaseInfo.openPhase}期:</span>
				<c:forEach items="${phaseInfo.openResult }" var="o"><span class="mui-badge mui-badge-<fmt:formatNumber type="number" value="${o }"></fmt:formatNumber>"><fmt:formatNumber type="number" value="${o }"></fmt:formatNumber></span> </c:forEach>
			<br/>
			<span  class="info-title" style="color: red">本期中奖人数:${phaseInfo.prizeCount }</span>
			</div>
			<div class="mui-table-view-divider">
				<input type="hidden" name="fpTime" id="fpTime" value='${phaseInfo.fpTime }'/>
				<input type="hidden" name="nextPhase" id="nextPhase" value='${phaseInfo.nextPhase }'/>
				<span class="info-title">距封盘:</span>
				<span class="time fp-time">--:--</span> 
				<span class="info-title">距开奖:</span>
				<span class="time kj-time">--:--</span>
			</div>
			<div id="slider" class="mui-slider">
				<div id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted mui-segmented-control-negative">
					<a class="mui-control-item mui-active" href="#item1mobile">
						排名竞猜
					</a>
					<a class="mui-control-item" href="#item2mobile">
						冠亚组合
					</a>
					<a class="mui-control-item" href="#item3mobile">
						两面盘
					</a>
				</div>
				<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-4"></div>
				<div class="mui-slider-group">
					<div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
						<div id="scroll1" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<form action="" class="form1">
										<div class="mui-table-view">
											<ul class="mui-table-view">
											<c:forEach items="${RANKING }" var="r" varStatus="s">
												<li class="mui-table-view-cell mui-collapse li-bet" index="${s.index }">
													<a class="mui-navigate-right" href="#">${r.key }</a>
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
        											<c:forEach items="${r.value }" var="ri">
        											<div class="bet-row">
							        					<div class="bet-row-xs-3">
							        						<span class="mui-badge mui-badge-${ri.typecode }">${ri.typecode }</span>
							        					</div>
							        					<div class="bet-row-xs-4">
							        						<span class="odds">${ri.typename }</span>
							        					</div>
							        					<div>
							        						<input type="hidden" class="type" value="${s.index+1 }" name="type">
							        						<input class="bet-amount" onkeyup="isInteger(this)"
							        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
							        					</div>
        											</div>
        											</c:forEach>
        												</div>
        										</li>
        										</c:forEach>
        										</div>
										</ul>
								</form>
							</div>
						</div>
					</div>
					<div id="item2mobile" class="mui-slider-item mui-control-content">
						<div id="scroll2" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<form class="form2">
										<div class="mui-table-view-divider">
								        	<div class="bet-row-xs-3">
								        		冠亚和
								        	</div>
								        	<div class="bet-row-xs-4">
								        		赔率
								        	</div>
								        	<div>
								        		投注额
								        	</div>
								        </div>
								        <c:forEach items="${TOP2 }" var="top">
								        <c:forEach items="${top.value }" var="t">
								        <div class="bet-row">
							        					<div class="bet-row-xs-3">
							        						<span class="mui-badge ">${t.typecode }</span>
							        					</div>
							        					<div class="bet-row-xs-4">
							        						<span class="odds">${t.typename }</span>
							        					</div>
							        					<div>
							        					<input type="hidden" value="1" class="type" name="type">
							        						<input class="bet-amount" onkeyup="isInteger(this)"
							        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
							        					</div>
        											</div>
	        							</c:forEach>
									</c:forEach>
								</form>
							</div>
						</div>
					</div>
					<div id="item3mobile" class="mui-slider-item mui-control-content">
						<div id="scroll3" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<form class="form3">
								<div class="mui-table-view">
									<ul class="mui-table-view">
									<c:forEach items="${TWO }" var="two" varStatus="s">
										<li class="mui-table-view-cell mui-collapse li-bet" index="${s.index }">
											<a class="mui-navigate-right" href="#">${two.key }</a>
											<div class="mui-collapse-content" style="padding-top: 5px;">
													<div class="mui-table-view-divider">
								        					<div class="bet-row-xs-3">
								        						结果
								        					</div>
								        					<div class="bet-row-xs-4">
								        						赔率
								        					</div>
								        					<div>
								        						投注额
								        					</div>
	        											</div>
	        										<c:forEach items="${two.value }" var="t">
        											<div class="bet-row">
							        					<div class="bet-row-xs-3">
							        						<span class="mui-badge">${t.typecode }</span>
							        					</div>
							        					<div class="bet-row-xs-4">
							        						<span class="odds">${t.typename }</span>
							        					</div>
							        					<div>
							        						<input type="hidden" class="type" value="${s.index+1 }" name="type">
							        						<input class="bet-amount" onkeyup="isInteger(this)"
							        							 type="number" value="" name="amount" placeholder="" style="text-align:center" />分
							        					</div>
        											</div>
        											</c:forEach>
											</div>
										</li>
									</c:forEach>
									</ul>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
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
			swipeBack:false //启用右滑关闭功能
		});
		function refreshPhaseInfo(){
			//请求 开奖信息  距离开奖时间 当前期数 上期结果  
			//在开奖时间45秒之内 则封盘  
			//距离开奖时间大于45秒  开启封盘倒计时 
			mui.ajax('betController.do?getPhaseInfo',{
				dataType:'json',//服务器返回json格式数据
				type:'get',//HTTP请求类型
				success:function(data){
					if(!data.nextPhase || data.nextPhase == null){
						window.location.reload(true);
						return;
					}
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
					var openPhaseHtml = "<span class='info-title last-phase'>"+data.openPhase+"期:</span>";
					for(var i in data.openResult){
						var result = data.openResult[i];
						openPhaseHtml+=" <span class='mui-badge mui-badge-"+parseInt(result)+"'>"+parseInt(result)+"</span>";
					}
					
					openPhaseHtml += "<br/>"
						+"<span  class='info-title' style='color: red'>本期中奖人数:"+data.prizeCount+"</span>";
						
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
        	mui.later(refreshPhaseInfo,30000);
		}
		
		var fpTimer = new Alarm(0,parseInt("${phaseInfo.fpTime}"),function(second,minute){
			mui(".fp-time")[0].innerHTML=minute+":"+second;
		},fp);
		var kjTimer = new Alarm(0,parseInt("${phaseInfo.kjTime}"),function(second,minute){
			mui(".kj-time")[0].innerHTML=minute+":"+second;
		},kj);
		mui.ready(function(){
			mui('.mui-scroll-wrapper').scroll({
				indicators: true //是否显示滚动条
			});
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
			localStorage.removeItem("rankingList");
			localStorage.removeItem("twoList");
			localStorage.removeItem("top2List");
			<c:if test="${IS_STOP != 'true' }">
			fpTimer.start();
			kjTimer.start();
			var refreshTimer = setInterval(refreshPhaseInfo,60000);
			</c:if>
		});
		function isInteger(obj){
			var value = obj.value;
			if(!isNaN(value)&& value!=0){
				obj.value = Math.floor(value);
				if(value > 6000){
					obj.value = 6000;
					mui.toast("最大投注额为6000！");
				}
				if(value < 1){
					obj.value = 1;
					mui.toast("最小投注额为1！");
				}
			}else{
				obj.value = "";
				mui.toast("投注额需为整数");
			}
		}
		function confirmBetAmount(){
			//var betList = [];
			var fpTime = mui("#fpTime")[0].value;
			if(parseInt(fpTime) <= 0){
				mui.toast("已经封盘，不能进行投注。");
				return;
			}
			var isTz = false;
			var rankingList = [];
			var top2List = [];
			var twoList = [];
			for(var i=1;i<4;i++){
				mui.each(mui(".form"+i+" .bet-amount"),function(index,item){
					if(item.value != ""){
						isTz = true;
						var bet = {};
						bet.amount = item.value;
						bet.game = i;
						bet.phase = mui("#nextPhase")[0].value;
						bet.type = mui(".form"+i+" .type")[index].value
						bet.target=mui(".form"+i+" .mui-badge")[index].innerHTML;
						var odds = parseFloat(mui(".form"+i+" .odds")[index].innerHTML);
						bet.odds = odds;
						//betList.push(bet);
						if(i==1){
							rankingList.push(bet);
						}else if(i==2){
							top2List.push(bet);
						}else{
							twoList.push(bet);
						}
					}
				});
			}
			/* if(totalAmount > parseFloat("${LOCAL_CLINET_USER.point}")){
				mui.toast("您的积分不足，请修改投注积分！");
				return;
			} */
			if(!isTz){
				mui.toast("您没有输入任何投注积分，请输入！");
				return;
			}
			localStorage.setItem("top2List",JSON.stringify(top2List));
			localStorage.setItem("rankingList",JSON.stringify(rankingList));
			localStorage.setItem("twoList",JSON.stringify(twoList));
			//localStorage.setItem("type",mui(".mui-active")[0].getAttribute("index"));
			mui.openWindow("betController.do?comfirmBetOrder","comfirm-bet");
		}
		function resetAmount(){
			mui.each(mui(".bet-amount"),function(index,item){
				item.value="";
			})
		}
	</script>
</html>