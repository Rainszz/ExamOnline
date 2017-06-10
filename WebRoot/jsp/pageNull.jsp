<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>空页面</title>
    
<style type="text/css">
body {
	font-size: 20px;
	color: #007AB5;
}	
</style>
</head>
  
  <body>
  <center>
      	这个人很懒，比 田小个子  还懒，什么都没留下。
  </center>
  </body>
</html>
