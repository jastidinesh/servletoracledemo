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
 * Servlet implementation class AddBank
 */
@WebServlet("/AddBank")
public class AddBank extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBank() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("flag").equals("false") && !request.getParameter("user").equals(""))
		{
			request.setAttribute("user","'"+request.getParameter("user")+"'");
			request.setAttribute("error","'no'");
			RequestDispatcher rd=request.getRequestDispatcher("/AddBank.jsp");
			rd.forward(request, response);
			return;
		}
		else if(request.getParameter("user").equals(""))
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			String query = "select * from bank where accnum="+request.getParameter("acc-number");
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				if(rs.next())
				{
					request.setAttribute("user","'"+request.getParameter("user")+"'");
					request.setAttribute("error","'This Bank Account Is Already Registered'");
					RequestDispatcher rd=request.getRequestDispatcher("/AddBank.jsp");
					rd.forward(request, response);
					return;
				}
				query = "insert into bank values('"+request.getParameter("user")+"','"+request.getParameter("acc-name")+"',"
						+request.getParameter("acc-number")+","+request.getParameter("routing-number")+","+"to_date('"
								+ getCurrentTimeStamp() + "', 'yyyy/mm/dd hh24:mi:ss'))";
				stmt.executeUpdate(query);
				System.out.println("Inserted Into Bank");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("user1",request.getParameter("user"));
			RequestDispatcher rd=request.getRequestDispatcher("/MyAccount");
			rd.forward(request, response);
			
		}
	}
	
	private static String getCurrentTimeStamp() {
		 
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		java.util.Date today = new java.util.Date();
		return dateFormat.format(today.getTime());
 
	}

}
