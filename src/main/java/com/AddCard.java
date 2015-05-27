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
 * Servlet implementation class AddCard
 */
@WebServlet("/AddCard")
public class AddCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCard() {
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
		
		if(request.getParameter("flag").equals("false") && !request.getParameter("user").equals(""))
		{
			request.setAttribute("user","'"+request.getParameter("user")+"'");
			request.setAttribute("error","'no'");
			RequestDispatcher rd=request.getRequestDispatcher("/AddCard.jsp");
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
			String query = "select * from card where cardnum="+request.getParameter("card-number");
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				if(rs.next())
				{
					request.setAttribute("user","'"+request.getParameter("user")+"'");
					request.setAttribute("error","'This Card Is Already Registered'");
					RequestDispatcher rd=request.getRequestDispatcher("/AddCard.jsp");
					rd.forward(request, response);
					return;
				}
				query = "insert into card values('"+request.getParameter("user")+"','"+request.getParameter("card-holder-name")+"',"
						+request.getParameter("card-number")+",'"+request.getParameter("card-type")+"','"+
						request.getParameter("expiry-month")+" "+request.getParameter("expiry-year")+"',"+request.getParameter("cvv")+","+"to_date('"
								+ getCurrentTimeStamp() + "', 'yyyy/mm/dd hh24:mi:ss'))";
				stmt.executeUpdate(query);
				System.out.println("Inserted Into Card");
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
