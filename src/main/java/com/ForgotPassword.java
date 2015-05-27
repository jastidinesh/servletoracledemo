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
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String user=request.getParameter("user");
		int pin=Integer.parseInt(request.getParameter("pin"));
		
		DBConnect db = new DBConnect();
		Connection con = db.get_connection();
		ResultSet rs = null;
		Statement stmt = null;
		String query = "select * from user_table where username='"+user+"'";
		String password = "";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next())
			{
				if(pin == rs.getInt("pin"))
					password = rs.getString("pass");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(password.equals(""))
		{
			RequestDispatcher rd=request.getRequestDispatcher("ForgotPassword.jsp?pass=Pin Dosent Match Or User Not Found Try Again");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("ForgotPassword.jsp?pass=Your Password:"+password);
			rd.forward(request, response);
		}
	}

}
