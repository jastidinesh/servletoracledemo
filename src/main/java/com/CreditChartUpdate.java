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
 * Servlet implementation class CreditChartUpdate
 */
@WebServlet("/CreditChartUpdate")
public class CreditChartUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreditChartUpdate() {
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
		if(!user_check.equals("res_leader"))
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			String title = request.getParameter("title");
			String id = request.getParameter("id");
			int id_num = Integer.parseInt(id)+1;
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			Statement stmt1 = null;
			Statement stmt2 = null;
			ResultSet rs2 = null;
			ResultSet rs1 = null;
			try {
				stmt = con.createStatement();
				stmt2 = con.createStatement();
				String query = "update credit_chart set credit_start="+Integer.parseInt(start)+" where id="+id_num;
				stmt.executeUpdate(query);
				query = "update credit_chart set credit_end="+Integer.parseInt(end)+" where id="+id_num;
				stmt.executeUpdate(query);
				query = "update credit_chart set title='"+title+"' where id="+id_num;
				stmt.executeUpdate(query);
				query = "select * from user_table";
				rs2 = stmt.executeQuery(query);
				query = "select * from user_credits";
				stmt1 = con.createStatement();
				rs1 = stmt1.executeQuery(query);
				while(rs2.next())
				{
					rs1.next();
					query = "Update user_credits set title='"+FindTitleFromCredit.get_title(rs1.getInt("credits"))+"' where username='"+rs2.getString("username")+"'";
					stmt2.executeUpdate(query);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rd;
			if(request.getParameter("user").equals("res_leader"))
				rd=request.getRequestDispatcher("/ResCredits?user=res_leader");
			else
				rd=request.getRequestDispatcher("/ComCredits?useer=com_leader");
			rd.forward(request, response);
		}
	}

}
