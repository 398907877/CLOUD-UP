<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<script>
    $(function() {
    	$("#memberAccountForm").append("<span>"
               +" <span style='vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 80px;text-align:right;' title='时间 '>时间: </span>"
                +"<input type='text' name='operatetime_begin' id='operatetime_begin' style='width: 150px; height: 30px;' class='Wdate' onfocus=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\">");
    	appendTotalCount("${total.amount}","${total.result}")
	});
    function onLoadSuccess(data){
    	appendTotalCount(data.totalAmount,data.totalResult)
    }
    function appendTotalCount(totalAmount,totalResult){
    	var totalCount = "<span>总投注："+totalAmount+"</span><span>总输赢："+totalResult+"</span>";
    	$(".datagrid-toolbar").eq(1).children(":first").html(totalCount);
    }
</script>
<t:datagrid name="memberAccount" title="会员盈亏表" actionUrl="betController.do?accountMemberDataGrid" onLoadSuccess="onLoadSuccess"
    fit="true" fitColumns="true" idField="userid" queryMode="group" sortName="username" sortOrder="desc">
	<t:dgCol title="id" field="userid" hidden="true"></t:dgCol>
	

	
	<t:dgCol title="登录账号" sortable="true" field="username" query="true"></t:dgCol>
	
	

	
	<t:dgCol title="投注额" field="amount" query="false"></t:dgCol>
	<t:dgCol title="赢/输" field="result" query="false" ></t:dgCol>
	
		<t:dgCol title="用户名" field="realname"  ></t:dgCol>
	
			
</t:datagrid>