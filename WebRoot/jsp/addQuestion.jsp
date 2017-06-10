<%@page import="com.yhl.ex.bean.Paper"%>
<%@page import="com.yhl.ex.bean.PaperDetail"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<title>添加试题</title>
<base target="_self" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<style type="text/css">
.marginLayout {
	margin: 10px;
}

input {
	margin: 5px;
}

.textWidth {
	width: 200px;
}
</style>
<script type="text/javascript">
	function close() {
		window.close();
	}
	function addQuestion() {
		document.getElementsByName("formAddQuestion").submit();
	}
	document.getElementsByName("oneChoice").style.display = "none";
	document.getElementsByName("moreChoice").style.display = "none";
</script>
  </head>
  
  <body>
   	<%
		int qType = (Integer) session.getAttribute("qType");
		PaperDetail paperDetail = (PaperDetail) session.getAttribute("paperDetail");
		Paper paper = paperDetail.getPaper();
	%>
	<div class="marginLayout">
		<form action="" method="post" name="formAddQuestion">
			<table class="marginLayout" width="500px">
				<tr>
					<td align="right">
					<font>科目名称:</font></td>
					<td><input class="textWidth" type="text"
						value="<%=paperDetail.getSubName()%>" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td align="right"><font>题目类型:</font></td>
					<td><select name="qType" onchange="changeQOp(this.value)">
							<option value="1" selected="selected">单选</option>
							<option value="2">多选</option>
							<option value="3">上机</option>
					</select></td>
				</tr>
				<tr>
					<td align="right"><font>题目内容:</font></td>
					<td><textarea rows="5" cols="30" name="qTitle">
					</textarea></td>
				</tr>
				<div name="oneChoice">
					<tr>
						<td align="right"><font>题目选项:</font></td>
						<td><input type="radio" name="answer">A<input
							class="textWidth" type="text" name="optionA"><br /> <input
							type="radio" name="answer">B<input class="textWidth"
							type="text" name="optionB"><br /> <input type="radio"
							name="answer">C<input class="textWidth" type="text"
							name="optionC"><br /> <input type="radio" name="answer">D<input
							class="textWidth" type="text" name="optionD"><br /></td>
					</tr>
				</div>
				<div name="moreChoice">
					<tr>
						<td align="right"><font>题目选项:</font></td>
						<td><input type="checkBox" name="answer">A<input
							class="textWidth" type="text" name="optionA"><br /> <input
							type="checkBox" name="answer">B<input class="textWidth"
							type="text" name="optionB"><br /> <input type="checkBox"
							name="answer">C<input class="textWidth" type="text"
							name="optionC"><br /> <input type="checkBox"
							name="answer">D<input class="textWidth" type="text"
							name="optionD"><br /></td>
					</tr>
				</div>

				<tr>
					<td align="right"><font>难易程度:</font></td>
					<td><select name="qDif">
							<option value="1">简单</option>
							<option value="2">普通</option>
							<option value="3">困难</option>
					</select></td>
				</tr>
				<tr>
					<td align="right"><font>对应章节:</font></td>
					<td><input class="textWidth" type="text" name="qst"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						 <input type="button" value="添加"onclick="addQuestion()">
						 <input type="reset" value="重置">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	function changeQOp(qType) {
	if (qType == 1) {
			document.getElementsByName("oneChoice").style.display = "block";
			document.getElementsByName("moreChoice").style.display = "none";
		} else if (qType == 2) {
			document.getElementsByName("moreChoice").style.display = "block";
			document.getElementsByName("oneChoice").style.display = "none";
		}else{
			document.getElementsByName("oneChoice").style.display = "none";
			document.getElementsByName("moreChoice").style.display = "none";
		}
	}
</script>
  </body>
</html>
