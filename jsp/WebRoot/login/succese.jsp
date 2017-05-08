<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>成功！</title>
  </head> 
  <body>
    <h1>恭喜！登陸成功！</h1>
 		 你的賬戶是：<%=request.getParameter("name") %>
  	 	 你的密碼是：<%=request.getParameter("pwd") %>
  </body>
</html>
