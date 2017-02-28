<%@ page import="java.util.*, com.web.jdbc.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="css/style.css">
		<title>Students</title>
	</head>
	
		<%
			// get students from request object (set up in servlet)
			List<Student> theStudents = (List<Student>)request.getAttribute("STUDENT_LIST");
		%>
	
	<body>
		
		<div id="wrapper">
			<div id="header">
				<h2>Student Directory</h2>
			</div>
		</div>
		
		<div id="container">
			<div id="content">
				<table>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>E-mail</th>
					</tr>
					<% for (Student tempStudent : theStudents) { %>
						<tr>
							<td><%= tempStudent.getFirstName() %></td>
							<td><%= tempStudent.getLastName() %></td>
							<td><%= tempStudent.getEmail() %></td>
						</tr>
					<% } %>
				</table>
			</div>
		</div>
	</body>
</html>













