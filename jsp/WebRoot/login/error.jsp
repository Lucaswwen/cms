<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>error!</title>
  </head>
  
  <body>
    <h1>很抱歉，登陸失敗</h1>
 		 你的賬戶是：<%=request.getParameter("name") %>
  	 	請再次核對您的登陸信息！
  </body>
</html>
