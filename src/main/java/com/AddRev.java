package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddRev
 */
@WebServlet("/AddRev")
public class AddRev extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRev() {
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
			String desc =(request.getParameter("review"));
			String  id=(request.getParameter("res_id"));
			
			int res_id = Integer.parseInt(id);
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			String query = "select count(*) from reviews";
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				rs.next();
				int rev_id = rs.getInt("count(*)") + 1;
				query = "insert into reviews values("+rev_id+",'"+res_id+"','"+user+"','"+desc+"',"+
						"to_date('"+getCurrentTimeStamp()+"', 'yyyy/mm/dd hh24:mi:ss'))";
				rs = stmt.executeQuery(query);
				System.out.println("Inserted Into Review");
				query = "select review from res_credits";
				int credits;
				rs = stmt.executeQuery(query);
				rs.next();
				credits = rs.getInt("review");
				query ="update user_credits set credits=(select credits from user_credits where username='"+user+"')+"+credits+" where"+
						" username='"+user+"'";
				stmt.executeUpdate(query);
				System.out.println("Updated Credits");
				query = "select credits from user_credits where username='"+user+"'";
				String title = null;
				rs = stmt.executeQuery(query);
				rs.next();
				credits = rs.getInt("credits");
				title = FindTitleFromCredit.get_title(credits);
				query = "update user_credits set title='"+title+"' where username='"+user+"'";
				stmt.executeUpdate(query);
				System.out.println("Updated Title");
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
	
	private static String getCurrentTimeStamp() {
		 
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		java.util.Date today = new java.util.Date();
		return dateFormat.format(today.getTime());
 
	}

}
