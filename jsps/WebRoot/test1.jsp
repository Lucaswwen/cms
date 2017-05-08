<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'test1.jsp' starting page</title>
  </head>
  
  <body>
    <table border="1">
    	<%
    		for(int i = 1 ; i<= 9;i++){
	    		out.print("<tr>");
	    		for(int j =1;j<=9 ;j++){
	    			out.print("<td>");
	    				out.print(i*j);
	    			out.print("</td>");
	    		}	    			
	    		out.print("</tr>");
    		}  		
    	%>
    </table>
  </body>
</html>
