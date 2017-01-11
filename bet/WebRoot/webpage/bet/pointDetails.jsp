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
    function onLoadSuccess(data){
    	appendTotalCount(data.totalAmount,data.totalResult)
    }
    function appendTotalCount(totalAmount,totalResult){
    	var totalCount = "<span style='color:red;font-size:12px;font-weight:bold;'>===总分："+totalAmount+"===</span>";
    	$(".datagrid-toolbar").eq(1).children(":first").html(totalCount);
    }
</script>
<t:datagrid name="pointDetailList" title="上下分明细" actionUrl="betController.do?pointDetailDatagrid" 
    fit="true" fitColumns="true" idField="id" queryMode="group" onLoadSuccess="onLoadSuccess" sortName="username" sortOrder="desc">
	<t:dgCol title="id" field="id" hidden="true"></t:dgCol>
	<t:dgCol title="common.username" sortable="true" field="username" query="true"></t:dgCol>
	<t:dgCol title="真实姓名" sortable="false" field="realname" query="false"></t:dgCol>
	<t:dgCol title="分数" field="amount" query="false" ></t:dgCol>
	<t:dgCol title="操作人" field="createuser" query="false" ></t:dgCol>
	<t:dgCol title="上/下分时间" field="createtime" query="true" queryMode="group" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
</t:datagrid>