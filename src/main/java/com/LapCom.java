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
 * Servlet implementation class LapCom
 */
@WebServlet("/LapCom")
public class LapCom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LapCom() {
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
		
		String id = null;
		String user_check = null;
		user_check = request.getParameter("user");
		id = request.getParameter("com_id");
		if(user_check.equals(""))
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			int com_id = Integer.parseInt(id);
			String author = null;
			String content = null;
			String type = null;
			String brand = null;
			String created = null;
			String trade = null;
			String price = null;
			Boolean spam = false;
			int status = 1;
			int avg_rating ,rating;
			
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			String query = "select * from lap_comm where id="+com_id;
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				rs.next();
				author = "'"+rs.getString("author")+"'";
				content = "'"+rs.getString("content")+"'";
				type = "'"+rs.getString("type")+"'";
				brand = "'"+rs.getString("brand")+"'";
				created = "'"+rs.getString("created")+"'";
				
				query = "select value from spamlap where username='"+user_check+"' and comid="+com_id;
				rs = stmt.executeQuery(query);
				if(rs.next())
				{
					if(rs.getInt("value") == 1)
						spam = true;
					else
						spam =false;
				}
				else
					spam = (false);
				query = "select avg(rating) from lap_rating where comid="+com_id;
				rs = stmt.executeQuery(query);
				rs.next();
				avg_rating = rs.getInt("avg");
				request.setAttribute("avg_rating",avg_rating);
				
				query = "select rating from lap_rating where comid="+com_id+" and username='"+user_check+"'";
				rs = stmt.executeQuery(query);
				if(rs.next())
					rating = rs.getInt("rating");
				else
					rating = 0;
				request.setAttribute("rating",rating);
				request.setAttribute("user","'"+user_check+"'");
				request.setAttribute("author", author);
				request.setAttribute("com_id", com_id);
				request.setAttribute("content", content);
				request.setAttribute("type", type);
				request.setAttribute("created", created);
				request.setAttribute("brand", brand);
				request.setAttribute("spam", spam);
				
				RequestDispatcher rd;
				
				if(type.equals("'E-Commerce'"))
				{
					query = "select * from trade where id="+com_id;
					rs = stmt.executeQuery(query);
					rs.next();
					trade = "'"+rs.getString("trade")+"'";
					price = rs.getString("price");
					status = rs.getInt("status");
					
					request.setAttribute("trade", trade);
					request.setAttribute("price", price);
					request.setAttribute("status", status);
					
					rd=request.getRequestDispatcher("Trade.jsp");
					rd.forward(request, response);
					return;
				}
				rd =request.getRequestDispatcher("LapCom.jsp");
				rd.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
