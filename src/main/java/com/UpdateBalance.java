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
 * Servlet implementation class UpdateBalance
 */
@WebServlet("/UpdateBalance")
public class UpdateBalance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBalance() {
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
		
		String user_check = request.getParameter("user_update");
		if(user_check.equals(null) || user_check.equals(""))
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			String query = "update user_table set balance="+request.getParameter("bala")+" where "
					+ "username='"+user_check+"'";
			try {
				stmt = con.createStatement();
				stmt.executeUpdate(query);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("user",user_check);
			RequestDispatcher rd=request.getRequestDispatcher("/Bank");
			rd.forward(request, response);
		}
	}

}
