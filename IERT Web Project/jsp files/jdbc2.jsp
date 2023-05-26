<%@ page import="java.sql.*" %>
<html>
<body>
<table border="2" width="600px" style="font-family:arial;font-size:14px;">
<tr>
	<td colspan="4" style="background-color:black;color:white">
		User Details
	</td>
</tr>
<tr>
	<td>User ID</td>
	<td>Name</td>
	<td>Age</td>
	<td>Address</td>
</tr>
<%
	Connection con=null;
	Statement st;
	ResultSet rs;
	try{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
		st=con.createStatement();
		rs=st.executeQuery("select * from student");
		
		while(rs.next())
		{
			%>
			<tr>
			<td><% out.print(rs.getInt(1)); %></td>
			<td><% out.print(rs.getString(2)); %></td>
			<td><% out.print(rs.getInt(3)); %></td>
			<td><% out.print(rs.getString(4)); %></td>
			</tr>
		<%
		}
	}catch(Exception e)
	{
		out.println(e.toString());
	}

%>
</table>
</body>
</html>
