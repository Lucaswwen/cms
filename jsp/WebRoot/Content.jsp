<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="utf8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'Content.jsp' starting page</title>

<style type="text/css">
table.hovertable {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}

table.hovertable th {
	background-color: #c3dde0;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}

table.hovertable tr {
	background-color: #d4e3e5;
}

table.hovertable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
</style>

</head>

<body>
	<%!//定義若干個數據庫的鏈接常量
	private static final String URL = "jdbc:mysql://localhost:3306/users";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	Connection con = null;//數據庫鏈接
	PreparedStatement pstmt = null; //sql預處理
	ResultSet rs = null;//結果集
	int page=1;
	%>

	<table class="hovertable">
		<tr>
			<th>编号</th>
			<th>姓名</th>
			<th>年龄</th>
			<th>性别</th>
			<th>地址</th>
			<th>手机</th>
		</tr>
		<%
			try {
				Class.forName(DRIVER);//是否有sql驅動
				con = DriverManager.getConnection(URL, USERNAME, PASSWORD);//鏈接數據庫
				String sql = "SELECT * FROM user limit 0,10";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
		%>
		<tr onmouseover="this.style.backgroundColor='#ffff66';"
			onmouseout="this.style.backgroundColor='#d4e3e5';">
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("age")%></td>
			<td><%=rs.getString("sex")%></td>
			<td><%=rs.getString("address")%></td>
			<td><%=rs.getString("phone")%></td>
		</tr>
		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (!con.isClosed()) {
						con.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		%>

	</table>
	<input type="button" value="上一页" />
	<input type="button" value="下一页" onclick="next()" />
	<script type="text/javascript">
		function next() {
			<%
			
			%>
		}
	</script>
</body>
</html>
