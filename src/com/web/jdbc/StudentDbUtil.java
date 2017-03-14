package com.web.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class StudentDbUtil {
	private DataSource dataSource;
	
	public StudentDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	public List<Student> getStudents() throws Exception {
		List<Student> students = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection 
			myConn = dataSource.getConnection();
			
			// create SQL statement
			String sql = "select * from student order by last_name";
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				// retrieve data from result set row
				int id = myRs.getInt("id");
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String email = myRs.getString("email");
				
				// create new student object
				Student tempStudent = new Student(id, firstName, lastName, email);
				
				// add it to the list of students
				students.add(tempStudent);
				
			}
			return students;
			
		} finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}
	}

	private void close(Connection myConn, Statement myStmt, ResultSet myRs) {
		try {
			if (myRs != null) {
				myRs.close();
			}
			if (myStmt != null) {
				myStmt.close();
			}
			if (myRs != null) {
				myRs.close();
			}
		} catch (Exception exc) {
			exc.printStackTrace();
		}
	}

	public void addStudent(Student newStudent) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create SQL for insert
			String sql = "insert into student "
					+ "(first_name, last_name, email) "
					+ "values (?, ?, ?)";
			
			myStmt = myConn.prepareStatement(sql);
			
			// set the param values for the student
			myStmt.setString(1, newStudent.getFirstName());
			myStmt.setString(2, newStudent.getLastName());
			myStmt.setString(3, newStudent.getEmail());
			
			// execute SQL insert
			myStmt.execute();
		}
		finally {
			close(myConn, myStmt, null);
		}
		
	}
}