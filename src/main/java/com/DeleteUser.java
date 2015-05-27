package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
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
		
		DBConnect db = new DBConnect();
		Connection con = db.get_connection();
		Statement stmt = null;
		String user = request.getParameter("user");
		try {
			stmt = con.createStatement();
			String query ="Delete from user_credits where username='"+user+"'";
			stmt.executeUpdate(query);
			System.out.println("Deleted From Credits");
			query ="Delete from user_spam where username='"+user+"'";
			stmt.executeUpdate(query);
			System.out.println("Deleted From Spam");
			query ="Delete from bank where username='"+user+"'";
			stmt.executeUpdate(query);
			System.out.println("Deleted From Bank");
			query ="Delete from card where username='"+user+"'";
			stmt.executeUpdate(query);
			System.out.println("Deleted From Card");
			query ="Delete from comments where username='"+user+"'";
			stmt.executeUpdate(query);
			query ="Delete from lap_comm where username='"+user+"'";
			stmt.executeUpdate(query);
			query ="Delete from rating where username='"+user+"'";
			stmt.executeUpdate(query);
			query ="Delete from restaurant where author='"+user+"'";
			stmt.executeUpdate(query);
			query ="Delete from user_table where username='"+user+"'";
			stmt.executeUpdate(query);
			System.out.println("Deleted From User Table");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd;
		if(request.getParameter("user1").equals("res_leader"))
			rd =request.getRequestDispatcher("/ResAdmin?user=res_leader");
		else
			rd =request.getRequestDispatcher("/ComAdmin?user=com_leader");
		rd.forward(request, response);
	}

}
