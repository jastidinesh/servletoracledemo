package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyAccount
 */
@WebServlet("/MyAccount")
public class MyAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		String user_check = null;
		user_check = request.getParameter("user1"); 
		if(user_check == null)
		{
			user_check = (String) request.getAttribute("user1");
		}
		if(user_check.equals(""))
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			String query = "select * from user_table where username='"+user_check+"'";
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				while(rs.next())
				{
					request.setAttribute("user1","'"+user_check+"'");
					request.setAttribute("pass",rs.getString("pass"));
					request.setAttribute("email",rs.getString("email"));
					request.setAttribute("fname",rs.getString("fname"));
					request.setAttribute("lname",rs.getString("lname"));
					request.setAttribute("created",rs.getString("created"));
				}
				query = "select * from user_spam_credits where username='"+user_check+"'";
				rs = stmt.executeQuery(query);
				while(rs.next())
				{
					request.setAttribute("spam",rs.getInt("count"));
					request.setAttribute("credit",rs.getInt("credits"));
					request.setAttribute("title",rs.getString("title"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rd=request.getRequestDispatcher("MyAccount.jsp");
			rd.forward(request, response);
		}
	}

}
