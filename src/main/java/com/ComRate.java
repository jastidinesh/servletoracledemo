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
 * Servlet implementation class ComRate
 */
@WebServlet("/ComRate")
public class ComRate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComRate() {
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
		if(request.getParameter("user").equals(""))
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			String user =(request.getParameter("user"));
			String rate_str=(request.getParameter("rate"));
			String com_str=(request.getParameter("com_id"));
			int rate = Integer.parseInt(rate_str);
			int com_id = Integer.parseInt(com_str);
			
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			try {
				stmt = con.createStatement();
				String query = "select * from lap_rating where username='"+user+"' and comid="+com_id;
				rs = stmt.executeQuery(query);
				if(rs.next())
				{
					query = "update lap_rating set rating="+rate+" where username='"+user+"' and comid="+com_id;
				}
				else
				{
					query = "insert into lap_rating values('"+user+"',"+com_id+","+rate+")";
				}
				stmt.executeUpdate(query);
				System.out.println("Inserted Into Ratings");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("user",user);
			request.setAttribute("res_id",com_id);
			RequestDispatcher rd=request.getRequestDispatcher("/LapCom");
			rd.forward(request, response);
		}
	}

}
