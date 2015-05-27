package com;


import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResAdmin
 */
@WebServlet("/UpdateCredit")
public class UpdateCredit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCredit() {
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
		
		String user = request.getParameter("user");
		int credit = Integer.parseInt(request.getParameter("credit"));
		
		DBConnect db = new DBConnect();
		Connection con = db.get_connection();
		Statement stmt = null;
		String query = "Update user_credits set credits="+credit+" where username='"+user+"'";
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(query);
			query = "Update user_credits set title='"+FindTitleFromCredit.get_title(credit)+"' where username='"+user+"'";
			stmt.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd;
		if(request.getParameter("user1").equals("res_leader"))
			rd =request.getRequestDispatcher("/ResAdmin?user=res_leader");
		else
			rd =request.getRequestDispatcher("/ComAdmin?user=com_leader");
		rd.forward(request, response);
	}
}
