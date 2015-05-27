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
 * Servlet implementation class AddRate
 */
@WebServlet("/AddRate")
public class AddRate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRate() {
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
			String rev_str=(request.getParameter("rev_id"));
			String res_str=(request.getParameter("res_id"));
			int rate = Integer.parseInt(rate_str);
			int rev_id = Integer.parseInt(rev_str);
			int res_id = Integer.parseInt(res_str);
			
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			try {
				stmt = con.createStatement();
				String query = "select * from rating where username='"+user+"' and revid="+rev_id;
				rs = stmt.executeQuery(query);
				if(rs.next())
				{
					query = "update rating set rating="+rate+" where username='"+user+"' and revid="+rev_id;
				}
				else
				{
					query = "insert into rating values('"+user+"',"+rev_id+","+rate+")";
				}
				stmt.executeUpdate(query);
				System.out.println("Inserted Into Ratings");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("user",user);
			request.setAttribute("res_id",res_id);
			RequestDispatcher rd=request.getRequestDispatcher("/Review");
			rd.forward(request, response);
		}
	}

}
