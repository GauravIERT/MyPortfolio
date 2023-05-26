<%@ page import="java.sql.*" %>
<html>
<body>
<form method="get" action="">
Enter User ID <input type="text" name="t1" required />
<input type="submit" value="Search" name="b1" />
<%
if(request.getParameter("b1")!=null)
{
	int gid=Integer.parseInt(request.getParameter("t1"));
	Connection con=null;
	Statement st;
	ResultSet rs;
	try{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
		st=con.createStatement();
		rs=st.executeQuery("select * from student where id="+gid+"");
		
		if(rs.next())
		{
			%>
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

			<tr>
			<td><% out.print(rs.getInt(1)); %></td>
			<td><% out.print(rs.getString(2)); %></td>
			<td><% out.print(rs.getInt(3)); %></td>
			<td><% out.print(rs.getString(4)); %></td>
			</tr>
		<%
		}
		else
			out.println("No Record Found");
	}catch(Exception e)
	{
		out.println(e.toString());
	}

}
%>
</table>
</form>
</body>
</html>
