<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户信息</title>
<t:base type="jquery,easyui,tools"></t:base>
<script type="text/javascript">
	$(function(){
	});
</script>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:formvalid formid="formobj" dialog="true" layout="table" action="betController.do?saveResult">
	<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td align="right" width="10%" nowrap><label class="Validform_label">期数:</td>
			<td class="value" width="10%">
				<input id="phase" datatype="cms"  class="easyui-combobox" name="phase"
    data-options="valueField:'id',textField:'text',url:'betController.do?phaseCombo&id=phase&text=phase&state=0'">
            </td>
		</tr>
		<tr>
			<td align="right" width="10%" nowrap><label class="Validform_label">开奖结果:</td>
			<td class="value" width="20%">
				 <input id="result" min="2" style="width:60%;" max="6000" datatype="*" class="inputxt" name="result" placeholder="(以,隔开如 1,2,3,4,5,6,7,8,9,10)" value="" type="text">
            </td>
		</tr>
	</table>
</t:formvalid>
</body>