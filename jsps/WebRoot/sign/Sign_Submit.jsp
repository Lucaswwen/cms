<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
  </head>  
  <body>
    <%!
    private static final String URL = "jdbc:mysql://localhost:3306/users";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	
    %>
    <%
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null; 
    	
    	String name = request.getParameter("username");
    	String pwd = request.getParameter("password");
    	
    	try{
    		Class.forName(DRIVER);
    		con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
    		System.out.println(name);
    		System.out.println(pwd);
    		String sql = "insert into user values(?,?)";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1,name);
    		pstmt.setString(2,pwd);
    		int count = pstmt.executeUpdate();
    		if(count>0){
    		%>
			<jsp:forward page="../login/succese.jsp">
			<jsp:param name="name" value="<%=name%>" />
	   		<jsp:param name="pwd" value="<%=pwd%>" />
	 		</jsp:forward>
			<%
    		}else{
			%>
			<jsp:forward page="../login/error.jsp">
			<jsp:param name="name" value="<%=name%>" />
   			<jsp:param name="pwd" value="<%=pwd%>" />
  			 </jsp:forward>
			<%
			}
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		try{
				if(!con.isClosed()){
					con.close();
				}	
			}catch(Exception e){
				e.printStackTrace();
			}
    	}
    %>
  </body>
</html>
