package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResAdmin
 */
@WebServlet("/ResAdmin")
public class ResAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResAdmin() {
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
			
		DBConnect db = new DBConnect();
		Connection con = db.get_connection();
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from user_spam_credits";
		ArrayList<String> username = new ArrayList<String>();
		ArrayList<Integer> credit = new ArrayList<Integer>();
		ArrayList<String> title = new ArrayList<String>();
		ArrayList<Integer> spam = new ArrayList<Integer>();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			int i=0;
			while(rs.next())
			{
				if(!rs.getString("username").equals("res_leader") && !rs.getString("username").equals("com_leader"))
				{
					username.add("'"+rs.getString("username")+"'");
					credit.add(rs.getInt("credits"));
					title.add("'"+rs.getString("title")+"'");
					spam.add(rs.getInt("count"));
					i++;
				}
				
			}
			request.setAttribute("count", i);
			request.setAttribute("user",username);
			request.setAttribute("credit",credit);
			request.setAttribute("title", title);
			request.setAttribute("spam",spam);
			request.setAttribute("user1","'res_leader'");
			RequestDispatcher rd = request.getRequestDispatcher("ResAdmin.jsp");
			rd.forward(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
