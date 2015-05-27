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
 * Servlet implementation class Comment
 */
@WebServlet("/Comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Comment() {
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
		String id1 = null;
		String user_check = null;
		user_check = request.getParameter("user");
		id = request.getParameter("rev_id");
		id1 = request.getParameter("res_id");
		if(user_check.equals(null) || user_check.equals(""))
		{
			user_check = (String) request.getAttribute("user");
		}
		if(id.equals(null))
		{
			id = (String) request.getAttribute("rev_id");
		}
		if(id1.equals(null))
		{
			id1 = (String) request.getAttribute("res_id");
		}
		if(user_check.equals(""))
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			int res_id = Integer.parseInt(id1);
			int rev_id = Integer.parseInt(id);
			
			ArrayList<Integer> com_id= new ArrayList<Integer>();
			ArrayList<String> author= new ArrayList<String>();
			ArrayList<String> content= new ArrayList<String>();
			ArrayList<String> created= new ArrayList<String>();
			
			String res_name = null;
			String res_loc = null;
			String res_desc = null;
			
			String review_con = null;
			
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			String query = "select * from restaurant where id="+res_id;
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				rs.next();
				res_name = "'"+rs.getString("name")+"'";
				res_loc = "'"+rs.getString("location")+"'";
				res_desc = "'"+rs.getString("description")+"'";
				
				query = "select * from reviews where id="+rev_id;
				rs = stmt.executeQuery(query);
				rs.next();
				review_con = "'"+rs.getString("content")+"'";
				
				query = "select * from comments where revid="+rev_id;
				rs = stmt.executeQuery(query);
				
				int i=0;
				while(rs.next())
				{
					com_id.add(rs.getInt("id"));
					author.add("'"+rs.getString("author")+"'");
					content.add("'"+rs.getString("content")+"'");
					created.add("'"+rs.getString("created")+"'");
					i++;
				}
				
				request.setAttribute("res_name", res_name);
				request.setAttribute("res_loc", res_loc);
				request.setAttribute("res_desc", res_desc);
				request.setAttribute("res_id", res_id);
				
				request.setAttribute("rev_con", review_con);
				request.setAttribute("rev_id", rev_id);
				
				request.setAttribute("count", i);
				request.setAttribute("id", com_id);
				request.setAttribute("content", content);
				request.setAttribute("author", author);
				request.setAttribute("created", created);
				request.setAttribute("user","'"+user_check+"'");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rd=request.getRequestDispatcher("Comment.jsp");
			rd.forward(request, response);
		}
	}

}
