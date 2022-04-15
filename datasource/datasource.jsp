<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%
	Context ctx = null;
	DataSource ds = null;
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = "select *from test";
		try 
	{
		ctx = new InitialContext();
		ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/mysql");
		//ds = (DataSource) ctx.lookup("jdbc/mysql");
		con = ds.getConnection();
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		while (rs.next())
		{
			out.print(rs.getString(1));
			out.print(rs.getString(2));
		}
	} 
		catch ( Exception e ) 
	{
		out.println(e);
	} 
		finally 
	{
		if ( ps != null ) try { ps.close(); } catch(Exception e) {}
		if ( con != null ) try { con.close(); } catch(Exception e) {}
	}
%>
