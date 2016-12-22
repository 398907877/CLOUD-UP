<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<script>
    $(function() {
    	$("input[name='createtime_begin']").attr("class","Wdate"); 
    	$("input[name='createtime_begin']").attr("onfocus","WdatePicker({dateFmt:'yyyy-MM-dd'})");
    	$("input[name='createtime_end']").attr("class","Wdate"); 
    	$("input[name='createtime_end']").attr("onfocus","WdatePicker({dateFmt:'yyyy-MM-dd'})");
    	
	});
    function formattGame(value,row){
    	if(value == "q"){
    		return "排名竞猜";
    	}else if(value=="2"){
    		return "冠亚组合";
    	}else{
    		return "两面盘"
    	}
    }
    function formattType(value,row){
    	if(row.game==2){
    		return "冠亚和"
    	}
    	if(value == 1){
    		return "冠军";
    	}
    	if(value == 2){
    		return "亚军";
    	}
    	return "第"+value+"名";
    }
</script>
<t:datagrid name="betOrderList" title="未结算注单" actionUrl="betController.do?betOrdersDataGridAll" 
    fit="true" fitColumns="true" idField="id" queryMode="group" sortName="username" sortOrder="desc">
	<t:dgCol title="id" field="id" hidden="true"></t:dgCol>
	<t:dgCol title="common.username" sortable="true" field="username" query="true"></t:dgCol>
	<t:dgCol title="期" field="phase"></t:dgCol>
	<t:dgCol title="玩法" field="game" formatterjs="formattGame"></t:dgCol>
	<t:dgCol title="类型" field="type" formatterjs="formattType"></t:dgCol>
	<t:dgCol title="赔率" field="odds" query="false"></t:dgCol>
	<t:dgCol title="投注目标" field="target" query="false"></t:dgCol>
	<t:dgCol title="投注额" field="amount" query="false"></t:dgCol>
	<t:dgCol title="可赢额" field="winamount" query="false" ></t:dgCol>
	<t:dgCol title="输/赢" field="result" query="false" ></t:dgCol>
	<t:dgCol title="下注时间" field="createtime" query="true" queryMode="group" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
</t:datagrid>