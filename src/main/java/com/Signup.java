package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		String user=request.getParameter("username");
		String pass=request.getParameter("pwd2");
		String email=request.getParameter("email");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String pin=request.getParameter("pin");
		String errmsg = null;
		
		DBConnect db = new DBConnect();
		Connection con =db.get_connection();
		Statement stmt = null;
		String query = null;
		String query_user = "select * from user_table where username='"+user+"'";
		String query_email = "select * from user_table where email='"+email+"'";
		boolean flag_user = false;
		boolean flag_email = false;
		ResultSet rs;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query_user);
			while (rs.next())
			{
					flag_user = true;
			}
			System.out.println("Done User Check-SignUp");
			rs = stmt.executeQuery(query_email);
			while (rs.next())
			{
				flag_email = true;
				
			}
			System.out.println("Done Email Check-SignUp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag_email)
		{
			errmsg = "The Email Is Already Registered";
			response.sendRedirect("Signup.jsp?errmsg="+errmsg);
			return;
		}
		if(flag_user)
			{
				errmsg = "The Username Already In Use";
				response.sendRedirect("Signup.jsp?errmsg="+errmsg);
				return;
			}
		
		query = "Insert into user_table values('"+user+"','"+pass+"','"+email+"',"+"to_date('"
				+ getCurrentTimeStamp() + "', 'yyyy/mm/dd hh24:mi:ss')"+
				","+0+",'"+fname+"','"+lname+"',"+pin+")";
		try {
			System.out.println("Inserting into User");
			stmt.executeUpdate(query);
			System.out.println("Inserting into Credit");
			query = "Insert into user_credits values('"+user+"',0,'"+FindTitleFromCredit.get_title(0)+"')";
			stmt.executeUpdate(query);
			System.out.println("Inserting into Spam");
			query = "Insert into user_spam values('"+user+"',0)";
			stmt.executeUpdate(query);
			System.out.println("Done Inserting");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private static String getCurrentTimeStamp() {
		 
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		java.util.Date today = new java.util.Date();
		return dateFormat.format(today.getTime());
 
	}
}


