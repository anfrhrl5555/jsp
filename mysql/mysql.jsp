<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head><title>tomcat mysql test</title></head>
<body>

tomcat with db connection test
<table width="100%" border="1">
<tr>
	<td>Name</td><td>ID</td>
</tr>
<%
	// MySQL JDBC Driver Loading
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:mysql://mysql-service:3306/test";
		String dbUser = "test";
		String dbPass = "test";
		
		String query = "select * from test";
		
		// Create DB Connection 
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// Create Statement 
		stmt = conn.createStatement();
		
		// Run Qeury
		rs = stmt.executeQuery(query);
		
		// Print Result (Run by Query) 
		while(rs.next()) {
%>
<tr>
	<td><%= rs.getString("id") %></td>
	<td><%= rs.getString("age") %></td>
</tr>
<%
		}
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// Close Statement 
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		
		// Close Connection
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
</table>

</body>
</html>
