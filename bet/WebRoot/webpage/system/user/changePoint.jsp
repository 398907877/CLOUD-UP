<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户信息</title>
<t:base type="jquery,easyui,tools"></t:base>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:formvalid formid="formobj" refresh="true" dialog="true" action="userController.do?savePoint" layout="table">
	<input id="id" type="hidden" value="${user.id }"   name="id">
	<table style="width: 550px" cellpadding="0" cellspacing="1" class="formtable">
		<tbody>
			<tr>
				<td align="right" width="10%"><span class="filedzt">剩余积分:</span></td>
				<td class="value">${user.point }</td>
			</tr>
			<tr>
				<td align="right"><span class="filedzt">积分:</span></td>
				<td class="value"><input name="point" type="number" maxlength="9" class="inputxt" datatype="numrange" max="${ maxPoint}" min="-${user.point }" errormsg="请输入整数！"> <span class="Validform_checktip"></span></td>
			</tr>
		</tbody>
	</table>
</t:formvalid>
</body>