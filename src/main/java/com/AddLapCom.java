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
 * Servlet implementation class AddLapCom
 */
@WebServlet("/AddLapCom")
public class AddLapCom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLapCom() {
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
			String lap_com =(request.getParameter("lap_com"));
			String type =(request.getParameter("type"));
			String brand =(request.getParameter("brand"));
			String trade = null;
			int price = 0;
			if(type.equals("E-Commerce"))
			{
				trade=(request.getParameter("trade"));
				String  price_str=(request.getParameter("price"));
				price = Integer.parseInt(price_str);
			}
			
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			String query = "select count(*) from lap_comm";
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				rs.next();
				int id = rs.getInt("count(*)")+1;
				query = "insert into lap_comm values("+id+",'"+user+"','"+lap_com+"','"+type+"','"+brand+"',"+
						"to_date('"+getCurrentTimeStamp()+"', 'yyyy/mm/dd hh24:mi:ss'))";
				stmt.executeUpdate(query);
				System.out.println("Inserted Into Lap Comm");
				if(type.equals("E-Commerce"))
				{
					query = "insert into trade values("+id+",'"+trade+"',"+price+",1)";
					stmt.executeUpdate(query);
					System.out.println("Inserted Into Trade");
				}
				query = "select com from lap_credits";
				int credits;
				rs = stmt.executeQuery(query);
				rs.next();
				credits = rs.getInt("com");
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
			RequestDispatcher rd=request.getRequestDispatcher("/Laptops");
			rd.forward(request, response);
		}
		
	}
	
	private static String getCurrentTimeStamp() {
		 
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		java.util.Date today = new java.util.Date();
		return dateFormat.format(today.getTime());
 
	}
}
