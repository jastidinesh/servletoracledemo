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
 * Servlet implementation class ResCreditsUpdate
 */
@WebServlet("/ResCreditsUpdate")
public class ResCreditsUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResCreditsUpdate() {
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
		
		String user = request.getParameter("user");
		if(!user.equals("res_leader"))
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			String res = request.getParameter("res");
			String rev = request.getParameter("rev");
			String com = request.getParameter("com");
			
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			String query = "delete from res_credits";
			try {
				stmt = con.createStatement();
				stmt.executeUpdate(query);
				query = "insert into res_credits values("+Integer.parseInt(res)+","+Integer.parseInt(rev)+","+Integer.parseInt(com)+")";
				stmt.executeUpdate(query);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rd=request.getRequestDispatcher("/ResCredits?user=res_leader");
			rd.forward(request, response);
			
		}
	}

}
