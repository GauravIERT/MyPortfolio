<%@ page import="java.sql.*" %>
<html>
<body>
<form method="get" action="">
<table width="600px" border="2">
<tr>
	<td colspan="2" style="background-color:black;color:white">
	Record Insert Window
	</td>
</tr>
<tr>
	<td>User ID </td>
	<td><input type="text" name="t1" required /></td>
</tr>
<tr>
	<td>Name </td>
	<td><input type="text" name="t2" required /></td>
</tr>
<tr>
	<td>Age</td>
	<td><input type="text" name="t3" /></td>
</tr>
<tr>
	<td>Address</td>
	<td><input type="text" name="t4" /></td>
</tr>
<tr>
	<td></td>
	<td><input type="submit" value="Insert" name="b1" /></td>
</tr>
<tr>
<td colspan="2">
<%
if(request.getParameter("b1")!=null)
{
	int gid=Integer.parseInt(request.getParameter("t1"));
	String name=request.getParameter("t2");
	int age=Integer.parseInt(request.getParameter("t3"));
	String addr=request.getParameter("t4");

	Connection con=null;
	Statement st;
	try{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnnit","root","");
		st=con.createStatement();
		String sql="insert into student values("+gid+",'"+name+"',"+age+",'"+addr+"')";
		int res=st.executeUpdate(sql);
		if(res!=0)
		{
			out.println("Record Inserted. <br> <a href='jdbc2.jsp'>For Detail Click Here</a>");
		}
		else
		{
			out.println("Record Not Inserted");
		}
		
	}catch(Exception e)
	{
		out.println(e.toString());
	}

}
%>
</td>
</tr>
</table>
</form>
</body>
</html>
