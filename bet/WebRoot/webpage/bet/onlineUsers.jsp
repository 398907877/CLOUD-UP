<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<script>
    $(function() {
	});
    function onLoadSuccess(data){
    	if($("#refreshBtn").length==0){
    		$(".panel-title").append("<a href='javascript:void(0)' id='refreshBtn' class='l-btn l-btn-plain'>点此刷新</a>");
        	$("#refreshBtn").on("click",function(){
        		$("#onlineUsers").datagrid("reload");
        	});
    	}
    }
</script>
<t:datagrid name="onlineUsers" title="在线用户列表" actionUrl="betController.do?onlineUsersData" 
    fit="true" pagination="true" showRefresh="true" showPageList="true" onLoadSuccess="onLoadSuccess" fitColumns="true" idField="id" >
	<t:dgCol title="id" field="id" hidden="true"></t:dgCol>
	<t:dgCol title="用户名" field="username" query="false"></t:dgCol>
	<t:dgCol title="真实姓名" sortable="false" field="realname" query="false"></t:dgCol>
	<t:dgCol title="积分" field="point" query="false"></t:dgCol>
</t:datagrid>