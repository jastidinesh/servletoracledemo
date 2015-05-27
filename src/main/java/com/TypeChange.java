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
 * Servlet implementation class TypeChange
 */
@WebServlet("/TypeChange")
public class TypeChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TypeChange() {
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
		
		String user_check = null;
		user_check = request.getParameter("user");
		if(user_check.equals(null) || user_check.equals(""))
		{
			user_check = (String) request.getAttribute("user");
		}
		if(user_check.equals(""))
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			String type_filter = request.getParameter("type");
			ArrayList<Integer> id= new ArrayList<Integer>();
			ArrayList<String> author= new ArrayList<String>();
			ArrayList<String> content= new ArrayList<String>();
			ArrayList<String> type= new ArrayList<String>();
			ArrayList<String> created= new ArrayList<String>();
			ArrayList<String> brand= new ArrayList<String>();
			
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			String query = "select * from lap_comm where type='"+type_filter+"'";
			if(type_filter.equals("Trade"))
				query = "select * from lap_comm where type='E-Commerce'";
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				int i=0;
				while(rs.next())
				{
					id.add(rs.getInt("id"));
					author.add("'"+rs.getString("author")+"'");
					content.add("'"+rs.getString("content")+"'");
					type.add("'"+rs.getString("type")+"'");
					created.add("'"+rs.getString("created")+"'");
					brand.add("'"+rs.getString("brand")+"'");
					i++;
				}
				request.setAttribute("count", i);
				request.setAttribute("id", id);
				request.setAttribute("type", type);
				request.setAttribute("content", content);
				request.setAttribute("author", author);
				request.setAttribute("created", created);
				request.setAttribute("brand", brand);
				request.setAttribute("user","'"+user_check+"'");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rd=request.getRequestDispatcher("Laptops.jsp");
			rd.forward(request, response);
		}
	}

}
