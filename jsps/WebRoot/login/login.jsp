<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'login.jsp' starting page</title>

</head>

<body>
	<%! //定義若干個數據庫的鏈接常量
	private static final String URL = "jdbc:mysql://localhost:3306/users";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	
	%>
	<%	
	Connection con = null;//數據庫鏈接
	PreparedStatement pstmt = null; //sql預處理
	ResultSet rs = null;//結果集	
	String name = request.getParameter("username");
	String pwd = request.getParameter("password");	
	try{
		Class.forName(DRIVER);//是否有sql驅動
		con = DriverManager.getConnection(URL, USERNAME, PASSWORD);//鏈接數據庫
		String sql = "SELECT username FROM user WHERE username=? and password=? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, pwd);		
		rs = pstmt.executeQuery();
		if(rs.next()){
		%>
		<jsp:forward page="succese.jsp">
		<jsp:param name="name" value="<%=name%>" />
   		<jsp:param name="pwd" value="<%=pwd%>" />
 		</jsp:forward>
		<%
		}else{
		%>
			<jsp:forward page="error.jsp">
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
