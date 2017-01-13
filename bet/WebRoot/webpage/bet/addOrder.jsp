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
	//乘    
	function floatMul(arg1,arg2)   {     
	    var m=0,s1=arg1.toString(),s2=arg2.toString();     
	    try{m+=s1.split(".")[1].length}catch(e){}     
	    try{m+=s2.split(".")[1].length}catch(e){}     
	    return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m);     
	}  
	function gameChange(record){
		var game = "RANKING";
		if("2" == record.value){
			game = "TOP"
		}else if("3" == record.value){
			game="TWO"
		}
		$('#typeSelect').combobox('clear');
		$('#typeSelect').combobox('reload',"betController.do?typeCombo&id=typegroupcode&text=typegroupname&game="+game);  
	}
	function typeChange(record){
		$('#target').combobox('clear');
		var type = record.id;
		var t = type.charAt(type.length-1);
		$("#type").val(t);
		$('#target').combobox('reload',"betController.do?targetCombo&id=typename&text=typecode&type="+record.id);  
	}
	function targetChange(record){
		$("#odds").val(record.id);
		var amount = $("#amount").val();
		if( amount != "" && !isNaN(amount)){
			$("#winamount").val(parseInt(amount)*parseFloat(record.id));
		}
	}
	function amountBlur(){
		var amount = $("#amount").val();
		if( amount != "" && !isNaN(amount)){
			$("#winamount").val(floatMul(parseInt(amount),parseFloat($("#odds").val())));
		}
	}
</script>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:formvalid formid="formobj" dialog="true" layout="table" action="betController.do?saveOrder">
	<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td align="right" width="25%" nowrap>
                <label class="Validform_label">  投注用户:  </label>
            </td>
			<td class="value" width="85%">
			<input id="userid" datatype="cms" class="easyui-combobox" name="user.id"
    data-options="valueField:'id',textField:'text',url:'userController.do?userCombo&id=id&text=userName'">
            </td>
		</tr>
		<tr>
			<td align="right" width="10%" nowrap><label class="Validform_label">期数:</td>
			<td class="value" width="10%">
				<input id="phase" datatype="cms"  class="easyui-combobox" name="phase"
    data-options="valueField:'id',textField:'text',url:'betController.do?phaseCombo&id=phase&text=phase'">
            </td>
		</tr>
		<tr>
			<td align="right" width="10%" nowrap><label class="Validform_label">玩法:</td>
			<td class="value" width="10%">
               <select id="game" datatype="cms"  class="easyui-combobox" data-options="onSelect:gameChange" name="game">
    				<option value="1">赛车排名</option>
    				<option value="2">冠亚组合</option>
    				<option value="3">两面盘</option>
				</select>
            </td>
		</tr>
		<tr>
			<td align="right" width="10%" nowrap><label class="Validform_label">类型:</td>
			<td class="value" width="10%">
				<input type="hidden" name="type" id="type" value=""/>
               <input id="typeSelect" datatype="cms"  class="easyui-combobox" 
    data-options="onSelect:typeChange,valueField:'id',textField:'text',url:'betController.do?typeCombo&game=RANKING&id=typegroupcode&text=typegroupname'">
            </td>
		</tr>
		<tr>
			<td align="right" width="10%" nowrap><label class="Validform_label">投注目标:</td>
			<td class="value" width="10%">
               <input id="target" datatype="cms"  class="easyui-combobox" name="target"
    data-options="onSelect:targetChange,valueField:'text',textField:'text',url:'betController.do?typeCombo&type=g&id=typecode&text=typecode'">
            </td>
		</tr>
		<tr>
			<td align="right" width="10%" nowrap><label class="Validform_label">赔率:</td>
			<td class="value" width="10%">
				 <input id="odds" class="inputxt" name="odds" value="0" readonly="readonly">
            </td>
		</tr>
		<tr>
			<td align="right" width="10%" nowrap><label class="Validform_label">投注额:</td>
			<td class="value" width="10%">
				 <input id="amount" min="2" max="6000" datatype="*,numrange" onblur="amountBlur();" class="inputxt" name="amount" value="" type="number">
            </td>
		</tr>
		<tr>
			<td align="right" width="10%" nowrap><label class="Validform_label">可赢额:</td>
			<td class="value" width="10%">
				 <input id="winamount" class="inputxt" name="winamount"  type="number" readonly="readonly">
            </td>
		</tr>
	</table>
</t:formvalid>
</body>