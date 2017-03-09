<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Add Student</title>
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	
	<body>
		<div id="wrapper">
			<div id="header">
				<h2>Student Directory</h2>
			</div>
		</div>
	
		<div id="container">
			<h3>Add Student</h3>
			
			<form action="StudentControllerServlet" method="GET">
			
				<input type="hidden" name="command" value="ADD">
				First Name:<input type="text" name="firstName"><br>
				Last Name:<input type="text" name="lastName"><br>
				Email:<input type="text" name="email"><br>
				<input type="submit" value="Save" class="button">
			
			</form>
			
			<a href="StudentControllerServlet">Back to Directory List</a>
		
		</div>
	
	</body>
</html>