<%@ page language="java" import="java.util.*,java.io.*" contentType="text/html;charset=utf8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'MyJsp.jsp' starting page</title>

  </head>
  
  <body>
  <h1>跳转操作</h1>
  <%	
   String username="wangweijian";
   %><jsp:forward page="receive.jsp">
		<jsp:param name="name" value="<%=username%>" />
   		<jsp:param name="info" value="123123" />
   </jsp:forward>
  
  </body>
</html>
