<%@page import="com.yhl.ex.bean.PageBean"%>
<%@page import="com.yhl.ex.bean.Question"%>
<%@page import="com.yhl.ex.bean.PaperDetail"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>试卷详情</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	span{
		display: none;
	}
	th{
		background-color: #666;
	}
	font{
		color:#fff;
	}
	</style>
	<script type="text/javascript">
	function showAddQuestion(){
		var width = (screen.width-500)/2;
		var height = (screen.height-500)/2;
		var res = window.open("jsp/addQuestion.jsp","window","width=500px,height=500px,top="+height+", left="+width+", toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
	}
	</script>
  </head>
  <body>
	<%
  	int qType = (Integer)session.getAttribute("qType");
	PaperDetail paperDetail = (PaperDetail)session.getAttribute("paperDetail");
	PageBean pageBean = paperDetail.getPageBean();
	List<Object> questions = pageBean.getData();
	%>
	<div>
		<h3 align="center"><%=paperDetail.getPaper().getpName() %></h3>
		<br />
		<input type="button" value="添加试题" onclick="showAddQuestion();">
		<input type="button" value="选择文件" onclick="">
		<input type="button" value="导入" onclick="">
		<input type="button" value="下载试题模板" onclick="">
	</div>
	<fieldset id="marginTop">
		<table width="100%" align="center" id="marginTop" border="0.5" bordercolor="#eee" cellspacing="1">
		<tr>
			<th><font>序号</font></th>
			<th><font>类型</font></th>
			<th width="300"><font>题目内容</font></th>
			<th><font>选项A</font></th>
			<th><font>选项B</font></th>
			<th><font>选项C</font></th>
			<th><font>选项D</font></th>
			<th><font>答案</font></th>
			<th><font>难度</font></th>
			<th><font>所属科目</font></th>
			<th><font>操作</font></th>
		</tr>
		<%
		for(int i=0;i<questions.size();i++){
			Question question = (Question)questions.get(i);
			out.println("<tr>");
			
			out.println("<td>");
			out.println(i);
			out.println("</td>");
			
			out.println("<td>");
			switch(question.getQtId()){
			case 1:
				out.println("单选");
				break;
			case 2:
				out.println("多选");
				break;
			case 3:
				out.println("上机");
				break;
			}
			out.println("</td>");
			
			out.println("<td>");
			out.println(question.getqTitle());
			out.println("</td>");
			
			out.println("<td>");
			out.println(question.getOptionA());
			out.println("</td>");
			
			out.println("<td>");
			out.println(question.getOptionB());
			out.println("</td>");
			
			out.println("<td>");
			out.println(question.getOptionC());
			out.println("</td>");
			
			out.println("<td>");
			out.println(question.getOptionD());
			out.println("</td>");
			
			out.println("<td>");
			out.println(question.getAnswer());
			out.println("</td>");
			
			out.println("<td>");
			switch(question.getQdId()){
			case 1:
				out.println("简单");
				break;
			case 2:
				out.println("普通");
				break;
			case 3:
				out.println("困难");
				break;
			}
			out.println("</td>");
			
			out.println("<td>");
			out.println("Java");
			out.println("</td>");
			
			out.println("<td>");
			out.println("<a href=''>编辑</a>");
			out.println("<a href=''>删除</a>");
			out.println("</td>");
			
			out.println("</tr>");
		}
		%>
	</table>
	<div align="right" id="marginTop">
		第<%=pageBean.getP() %>页，
		共<%=pageBean.getPageTotal() %>页&nbsp;&nbsp;
		<a href="questionManage?cmd=paperDetail&p=1&qType=1&pid=<%=paperDetail.getPaper().getpId() %>">首页</a>&nbsp;
		<a href="questionManage?cmd=paperDetail&p=<%=pageBean.getP()+1 %>&qType=1&pid=<%=paperDetail.getPaper().getpId() %>">上一页</a>&nbsp;
		<a href="questionManage?cmd=paperDetail&p=<%=pageBean.getP()-1 %>&qType=1&pid=<%=paperDetail.getPaper().getpId() %>">下一页</a>&nbsp;
		<a href="questionManage?cmd=paperDetail&p=<%=pageBean.getPageTotal() %>&qType=1&pid=<%=paperDetail.getPaper().getpId() %>">末页</a>
	</div>
	
	</fieldset>
  </body>
</html>
