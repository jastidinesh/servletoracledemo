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
 * Servlet implementation class ComCredits
 */
@WebServlet("/ComCredits")
public class ComCredits extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComCredits() {
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
		String user_check = request.getParameter("user");
		if(!user_check.equals("com_leader"))
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			ArrayList<Integer> credit_chart_start= new ArrayList<Integer>();
			ArrayList<Integer> credit_chart_end= new ArrayList<Integer>();
			ArrayList<String> credit_chart_title= new ArrayList<String>();
			
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			String query = "select * from credit_chart";
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				int i=0;
				while(rs.next())
				{
					credit_chart_start.add(rs.getInt("credit_start"));
					credit_chart_end.add(rs.getInt("credit_end"));
					credit_chart_title.add("'"+rs.getString("title")+"'");
					i++;
				}
				request.setAttribute("count", i);
				request.setAttribute("start", credit_chart_start);
				request.setAttribute("end", credit_chart_end);
				request.setAttribute("title", credit_chart_title);
				
				query = "select * from lap_credits";
				rs = stmt.executeQuery(query);
				while(rs.next())
				{
					request.setAttribute("com", rs.getInt("com"));
					request.setAttribute("buy", rs.getInt("buy"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("user","'com_leader'");
			RequestDispatcher rd=request.getRequestDispatcher("ComCredits.jsp");
			rd.forward(request, response);
		}
	}

}
