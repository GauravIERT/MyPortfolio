<%@ page import="java.sql.*" %>
<html>
<body>
<h1>Database Programming </h1>

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
			out.print(rs.getInt(1));
			out.print("\t"+rs.getString(2));
			out.print("\t"+rs.getInt(3));
			out.println("\t"+rs.getString(4));

		}
	}catch(Exception e)
	{
		out.println(e.toString());
	}

%>
</body>
</html>
