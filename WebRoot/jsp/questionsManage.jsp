<%@page import="com.yhl.ex.bean.QuestionsItem"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>题库管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<style type="text/css">
.group{
	text-align: center;
	width:200px;
	height:60px;
	margin:10px 10px;
	float:left;
	border:solid 1px black;
	padding:5px;
}
</style>
<body>
	<form action="questionManage?cmd=questions" method="post">
	<select name="major">
		<option value="1">高软</option>
		<option value="2">3G4G</option>
		<option value="3">网络营销</option>
		<option value="4">UI</option>
		<option value="5">前端</option>
	</select>
	<select name="stage">
		<option value="1">G1</option>
		<option value="2">G2</option>
		<option value="3">G3</option>
	</select>
	<input type="submit" value="查询" >
	</form>
	<br>
	<%
	List<QuestionsItem> questions = (List<QuestionsItem>)session.getAttribute("questions");
  	for(int i=0;i<questions.size();i++){
  		QuestionsItem questionsItem = questions.get(i);
	%>
	<div align="center" class="group">
		<%=questionsItem.getSubName() %>&nbsp;&nbsp;<%=questionsItem.getStageName() %><br>
		<a href="questionManage?cmd=paperDetail&qType=1&pid=<%=questionsItem.getPaper().getpId() %>" target="manFrame">机试题：<%=questionsItem.getMachineCount() %></a><br>
		<a href="questionManage?cmd=paperDetail&qType=2&pid=<%=questionsItem.getPaper().getpId() %>" target="manFrame">笔试题:<%=questionsItem.getChoiceCount() %></a>
	</div>
	<%
  	}
  	%>

</body>
</html>
