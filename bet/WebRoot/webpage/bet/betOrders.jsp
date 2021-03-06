<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<script>
    $(function() {
	});
    function formattGame(value,row){
    	if(value == "1"){
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
    function onLoadSuccess(data){
    	appendTotalCount(data.totalAmount,data.totalResult)
    }
    function appendTotalCount(totalAmount,totalResult){
    	var totalCount = "<span>总投注："+totalAmount+"</span><span><br /> 输/赢："+totalResult+"</span>";
    	$(".datagrid-toolbar").eq(1).children(":first").html(totalCount);
    }
</script>
<t:datagrid name="betOrderList" title="未结算注单" actionUrl="betController.do?betOrdersDataGrid" 
    fit="true" fitColumns="true" idField="phase" queryMode="group" onLoadSuccess="onLoadSuccess" sortName="username" sortOrder="desc">
	<%-- <t:dgCol title="期" sortable="true" field="phase" query="true"></t:dgCol>
	<t:dgCol title="真实姓名" sortable="false" field="user.realname" query="false"></t:dgCol> --%>
	<t:dgCol title="期" field="phase"  query="true"    ></t:dgCol>
	<t:dgCol title="玩法" field="game" formatterjs="formattGame"></t:dgCol>
	<t:dgCol title="类型" field="type" formatterjs="formattType"></t:dgCol>
	<t:dgCol title="赔率" field="odds" query="false"></t:dgCol>
	<t:dgCol title="投注目标" field="target" query="false"></t:dgCol>
	<t:dgCol title="投注额" field="amount" query="false"></t:dgCol>
	<t:dgCol title="可赢额" field="winamount" query="false" ></t:dgCol>
</t:datagrid>
