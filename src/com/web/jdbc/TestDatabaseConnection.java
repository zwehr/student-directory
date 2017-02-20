package com.web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class TestDatabaseConnection
 */
@WebServlet("/TestDatabaseConnection")
public class TestDatabaseConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Define datasource/connection pool for Resource Injection
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Step 1: Set up PrintWriter
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		
		// Step 2: Get connection to database
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
		// Step 3: Create SQL statements
		String sql = "select * from student";
		st = conn.createStatement();
		
		// Step 4: Execute SQL query
		rs = st.executeQuery(sql);
		
		// Step 5: Process the result set
		while (rs.next()) {
			String email = rs.getString("email");
			out.println(email);
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
