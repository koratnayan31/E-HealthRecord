<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String s1="";
String u=request.getParameter("username");
String p=request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3308/ehr","root","root");
Statement s =c.createStatement();
ResultSet results = s.executeQuery("SELECT * FROM state");
while (results.next()) {
	 
	 
	  String uname = results.getString(1);
	  String pass = results.getString(2);
	 
	 // out.println( fname+" "+lname+" "+uname+" "+pass+" "+results.getRow());
	
	  if(u.equalsIgnoreCase(uname) && p.equals(pass))
	  {		
		  
				  response.sendRedirect("distshow.jsp");
				  session.removeAttribute("l");
				  return ;
	  }
		  
	 else
		  {		session.setAttribute("l","invalid password");
				s1="l_login.jsp";
		  }
		  
} 
		
	response.sendRedirect(s1);
	
	  
	 
	

s.close();
c.close();
%>
</body>
</html>