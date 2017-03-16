<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="css/style.css">
		<title>Students</title>
	</head>
	
	<body>
		
		<div id="wrapper">
			<div id="header">
				<h2>Student Directory</h2>
			</div>
		</div>
		
		<div id="container">
			<div id="content">
			
				<input type="button" value="Add Student"
					onclick="window.location.href='add-student-form.jsp'; return false;"
					class="button"
				/>
			
				<table>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>E-mail</th>
						<th>Action</th>
					</tr>
					<c:forEach var="tempStudent" items="${STUDENT_LIST}">
					
						<!-- set up a link for each student -->
						<c:url var="updateLink" value="StudentControllerServlet">
							<c:param name="command" value="LOAD" />
							<c:param name="studentId" value="${tempStudent.id}" />
						</c:url>
						
						<!-- set up a link for each student -->
						<c:url var="deleteLink" value="StudentControllerServlet">
							<c:param name="command" value="DELETE" />
							<c:param name="studentId" value="${tempStudent.id}" />
						</c:url>
						
						<tr>
							<td> ${tempStudent.firstName} </td>
							<td> ${tempStudent.lastName} </td>
							<td> ${tempStudent.email} </td>
							<td> 
								<a href="${updateLink}">Update</a> | 
								<a href="${deleteLink}"
								onclick="if (!(confirm('Are you sure you want to delete this entry?'))) return false"
								>Delete</a>
							</td>
							
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</body>
</html>













