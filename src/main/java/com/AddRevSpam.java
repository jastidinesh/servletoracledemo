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
 * Servlet implementation class AddSpam
 */
@WebServlet("/AddSpam")
public class AddRevSpam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRevSpam() {
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
			String rev_str=(request.getParameter("rev_id"));
			String res_str=(request.getParameter("res_id"));
			int rev_id = Integer.parseInt(rev_str);
			int res_id = Integer.parseInt(res_str);
			
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			try {
				stmt = con.createStatement();
				String query = "select value from spamrev where username='"+user+"' and revid="+rev_id;
				rs = stmt.executeQuery(query);
				if(rs.next())
				{
					if(rs.getInt("value") == 1)
					{
						query = "update spamrev set value=0"+" where username='"+user+"' and revid="+rev_id;
						stmt.executeUpdate(query);
						query = "update user_spam set count=(select count from user_spam where username='"+user+"')-1 "
								+ " where username='"+user+"'";
						stmt.executeUpdate(query);
						System.out.println(query);
					}
					else
					{
						query = "update spamrev set value=1"+" where username='"+user+"' and revid="+rev_id;
						stmt.executeUpdate(query);
						query = "update user_spam set count=(select count from user_spam where username='"+user+"')+1 "
								+ " where username='"+user+"'";
						stmt.executeUpdate(query);
						System.out.println(query);
					}
				}
				else
				{
					query = "insert into spamrev values('"+user+"',"+rev_id+",1)";
					stmt.executeUpdate(query);
					query = "update user_spam set count=(select count from user_spam where username='"+user+"')+1 "
							+ " where username='"+user+"'";
					System.out.println(query);
					stmt.executeUpdate(query);
				}
				System.out.println("Inserted Into Spams");
				System.out.println("Spam Updated");
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
