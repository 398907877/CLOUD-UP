<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<script>
    $(function() {
	});
</script>
<t:datagrid name="memberAccount" title="会员盈亏表" actionUrl="betController.do?accountMemberDataGrid" 
    fit="true" fitColumns="true" idField="userid" queryMode="group" sortName="username" sortOrder="desc">
	<t:dgCol title="id" field="userid" hidden="true"></t:dgCol>
	<t:dgCol title="common.username" sortable="true" field="username" query="true"></t:dgCol>
	<t:dgCol title="总投注额" field="amount" query="false"></t:dgCol>
	<t:dgCol title="总赢/输" field="result" query="false" ></t:dgCol>
</t:datagrid>