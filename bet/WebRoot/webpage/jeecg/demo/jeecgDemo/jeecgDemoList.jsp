<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
<div region="center"  style="padding:0px;border:0px">
<t:datagrid name="jeecgDemoList" title="DEMO示例列表" autoLoadData="true" actionUrl="jeecgDemoController.do?datagrid"  fitColumns="true"
	idField="id" fit="true" queryMode="group" checkbox="true" queryBuilder="true">
	<%--   update-end--Author:tanghan  Date:20130713 for添加checkbox--%>
	<%--update-begin--Author:fangwenrong  Date:20150510 for：添加各项显示长度，解决显示排版问题--%>
	<t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
	<t:dgCol title="用户名" field="userName" query="true" frozenColumn="true" extend="{style:{width:'300px';color:'red'};value:'小王';datatype:'*';}" width="120"></t:dgCol>
	<t:dgCol title="电话号码" sortable="false" field="mobilePhone" query="true"  width="120"></t:dgCol>
	<t:dgCol title="办公电话" field="officePhone" width="120"></t:dgCol>
	<t:dgCol title="创建日期" field="createDate" editor="datebox" formatter="yyyy-MM-dd hh:mm:ss" query="true" queryMode="group" width="200"></t:dgCol>
	<t:dgCol title="邮箱" field="email" width="200"></t:dgCol>
	<t:dgCol title="年龄" sortable="true" editor="numberbox" field="age" width="80"></t:dgCol>
	<t:dgCol title="工资" field="salary" width="120" queryMode="group" query="true"></t:dgCol>
	<t:dgCol title="生日" field="birthday" formatter="yyyy/MM/dd" width="120"></t:dgCol>
	<t:dgCol title="性别" sortable="true" field="sex" dictionary="sex" query="true" width="60"></t:dgCol>
	<t:dgCol title="状态" field="status" replace="未处理_0,已处理_1" width="60" query="true"></t:dgCol>
	<t:dgCol title="操作" field="opt" width="150"></t:dgCol>
	<%--update-end--Author:fangwenrong  Date:20150510 for：添加各项显示长度，解决显示排版问题--%>
<!--	<t:dgFunOpt exp="status#eq#0" operationCode="szqm" funname="szqm(id)" title="审核" />-->
	<t:dgDelOpt operationCode="del" title="删除" url="jeecgDemoController.do?del&id={id}" exp="status#eq#0" urlStyle="color: red; padding-left: 10px;"/>
	<t:dgDelOpt operationCode="del" title="删除" url="jeecgDemoController.do?del&id={id}" exp="status#eq#1"  urlStyle="color: green; padding-right: 10px;"/>
	<t:dgToolBar operationCode="add" title="录入" icon="icon-add" url="jeecgDemoController.do?addorupdate" funname="add"></t:dgToolBar>
	<t:dgToolBar operationCode="edit" title="编辑" icon="icon-edit" url="jeecgDemoController.do?addorupdate" funname="update"></t:dgToolBar>
	<t:dgToolBar operationCode="mobileAdd" title="Mobile录入" icon="icon-add" url="jeecgDemoController.do?addorupdatemobile" funname="addMobile"></t:dgToolBar>
	<t:dgToolBar operationCode="edit" title="Mobile编辑" icon="icon-edit" url="jeecgDemoController.do?addorupdatemobile" funname="updateMobile"></t:dgToolBar>
	<t:dgToolBar operationCode="detail" title="查看" icon="icon-search" url="jeecgDemoController.do?addorupdate" funname="detail"></t:dgToolBar>
	<t:dgToolBar operationCode="print" title="打印" icon="icon-print" url="jeecgDemoController.do?print" funname="detail"></t:dgToolBar>
	<t:dgToolBar title="批量删除" icon="icon-remove" url="jeecgDemoController.do?doDeleteALLSelect" funname="deleteALLSelect"></t:dgToolBar>
	<t:dgToolBar title="Xml导入" icon="icon-put" url="transdata.do?doMigrateIn" funname="doMigrateIn"></t:dgToolBar>
	<t:dgToolBar title="xml导出" icon="icon-putout" url="transdata.do?doMigrateOut" funname="doMigrateOut"></t:dgToolBar>
	<t:dgToolBar  title="加载百度" icon="icon-print" url="#" funname="testReloadPage"></t:dgToolBar>
</t:datagrid></div>
</div>
<script type="text/javascript">
	function testReloadPage(){
		document.location = "http://www.baidu.com"; 
	}
	function szqm(id) {
		createwindow('审核', 'jeecgDemoController.do?doCheck&id=' + id);
	}
	function getListSelections(){
		var ids = '';
		var rows = $("#jeecgDemoList").datagrid("getSelections");
		for(var i=0;i<rows.length;i++){
			ids+=rows[i].id;
			ids+=',';
		}
		ids = ids.substring(0,ids.length-1);
		return ids;
	}	
	//表单 sql导出
	function doMigrateOut(title,url,id){
		url += '&ids='+ getListSelections();
		window.location.href= url;
	}
	function doMigrateIn(){
		openuploadwin('Xml导入', 'transdata.do?toMigrate', "jeecgDemoList");
	}
	$(document).ready(function(){
		$("input[name='createDate_begin']").attr("class","Wdate").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
		$("input[name='createDate_end']").attr("class","Wdate").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
		$("input[name='birthday']").attr("class","Wdate").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
	});

	function addMobile(title,addurl,gname,width,height){
		window.open(addurl);
	}
	
	function updateMobile(title,url, id,width,height){
		gridname=id;
		var rowsData = $('#'+id).datagrid('getSelections');
		if (!rowsData || rowsData.length==0) {
			tip('请选择编辑项目');
			return;
		}
		if (rowsData.length>1) {
			tip('请选择一条记录再编辑');
			return;
		}
		
		url += '&id='+rowsData[0].id;
		window.open(url);
	}
</script>