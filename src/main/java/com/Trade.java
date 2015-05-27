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
 * Servlet implementation class Trade
 */
@WebServlet("/Trade")
public class Trade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Trade() {
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
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			String query = null;
			
			int com_id = Integer.parseInt(id);	
			String author = request.getParameter("author");
			String trade = request.getParameter("trade");
			String price_str = request.getParameter("price");
			int price = Integer.parseInt(price_str);
			RequestDispatcher rd = null;
			int bank=0;
			
			if(trade.equals("Sell"))
			{
				try {
					stmt = con.createStatement();
					query = "select * from bank where user_name='"+user_check+"'";
					rs = stmt.executeQuery(query);
					if(rs.next())
						bank++;
					query = "select * from card where user_name='"+user_check+"'";
					rs = stmt.executeQuery(query);
					if(rs.next())
						bank++;
					if(bank >1)
					{
						query = "select balance from user_table where username='"+user_check+"'";
						rs = stmt.executeQuery(query);
						rs.next();
						int balance = rs.getInt("balance");
						if(balance >= price)
						{
							balance = balance-price;
							query = "update user_table set balance="+balance+" where username='"+user_check+"'";
							stmt.executeUpdate(query);
							query = "select balance from user_table where username='"+author+"'";
							rs = stmt.executeQuery(query);
							rs.next();
							balance = rs.getInt("balance");
							balance = balance+price;
							query = "update user_table set balance="+balance+" where username='"+author+"'";
							stmt.executeUpdate(query);
							System.out.println("Balance Updated");
							query ="update trade set status=0 where id="+com_id;
							stmt.executeUpdate(query);
							System.out.println("Trade Status Updated");
							query = "select buy from lap_credits";
							int credits;
							rs = stmt.executeQuery(query);
							rs.next();
							credits = rs.getInt("buy");
							query ="update user_credits set credits=(select credits from user_credits where username='"+user_check+"')+"+credits+" where"+
									" username='"+user_check+"'";
							stmt.executeUpdate(query);
							System.out.println("Updated Credits");
							query = "select credits from user_credits where username='"+user_check+"'";
							String title = null;
							rs = stmt.executeQuery(query);
							rs.next();
							credits = rs.getInt("credits");
							title = FindTitleFromCredit.get_title(credits);
							query = "update user_credits set title='"+title+"' where username='"+user_check+"'";
							stmt.executeUpdate(query);
							System.out.println("Updated Title");
							
							
							request.setAttribute("user","'"+request.getParameter("user")+"'");
							request.setAttribute("com_id",com_id);
							request.setAttribute("status1","Purchase Successful");
							request.setAttribute("author", "'"+author+"'");
							request.setAttribute("content", "'"+request.getParameter("content")+"'");
							request.setAttribute("type", "'"+request.getParameter("type")+"'");
							request.setAttribute("created", "'"+request.getParameter("created")+"'");
							request.setAttribute("brand", "'"+request.getParameter("brand")+"'");
							request.setAttribute("spam", request.getParameter("spam"));
							request.setAttribute("trade", "'"+request.getParameter("trade")+"'");
							request.setAttribute("price", request.getParameter("price"));
							request.setAttribute("status", 0);
	
							rd=request.getRequestDispatcher("Trade.jsp");
							rd.forward(request, response);
							return;
						}
						else
						{
							request.setAttribute("user","'"+request.getParameter("user")+"'");
							request.setAttribute("com_id",com_id);
							request.setAttribute("error","Insufficient Balance");
							request.setAttribute("author", "'"+author+"'");
							request.setAttribute("content", "'"+request.getParameter("content")+"'");
							request.setAttribute("type", "'"+request.getParameter("type")+"'");
							request.setAttribute("created", "'"+request.getParameter("created")+"'");
							request.setAttribute("brand", "'"+request.getParameter("brand")+"'");
							request.setAttribute("spam", request.getParameter("spam"));
							request.setAttribute("trade", "'"+request.getParameter("trade")+"'");
							request.setAttribute("price", request.getParameter("price"));
							request.setAttribute("status", 1);
	
							rd=request.getRequestDispatcher("Trade.jsp");
							rd.forward(request, response);
							return;
						}
					}
					else
					{
						request.setAttribute("user","'"+request.getParameter("user")+"'");
						request.setAttribute("com_id",com_id);
						request.setAttribute("error","Bank And Card Details Not Found.Plz add them and try again.");
						request.setAttribute("author", "'"+author+"'");
						request.setAttribute("content", "'"+request.getParameter("content")+"'");
						request.setAttribute("type", "'"+request.getParameter("type")+"'");
						request.setAttribute("created", "'"+request.getParameter("created")+"'");
						request.setAttribute("brand", "'"+request.getParameter("brand")+"'");
						request.setAttribute("spam", request.getParameter("spam"));
						request.setAttribute("trade", "'"+request.getParameter("trade")+"'");
						request.setAttribute("price", request.getParameter("price"));
						request.setAttribute("status", 1);

						rd=request.getRequestDispatcher("Trade.jsp");
						rd.forward(request, response);
						return;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				try {
					stmt = con.createStatement();
					query = "select balance from user_table where username='"+user_check+"'";
					rs = stmt.executeQuery(query);
					rs.next();
					int balance = rs.getInt("balance");
					rs = stmt.executeQuery(query);
					balance = balance+price;
					query = "update user_table set balance="+balance+" where username='"+user_check+"'";
					stmt.executeUpdate(query);
					query = "select balance from user_table where username='"+author+"'";
					rs = stmt.executeQuery(query);
					rs.next();
					balance = rs.getInt("balance");
					balance = balance-price;
					query = "update user_table set balance="+balance+" where username='"+author+"'";
					stmt.executeUpdate(query);
					System.out.println("Balance Updated");
					query = "select buy from lap_credits";
					int credits;
					rs = stmt.executeQuery(query);
					rs.next();
					credits = rs.getInt("buy");
					query ="update user_credits set credits=(select credits from user_credits where username='"+user_check+"')+"+credits+" where"+
							" username='"+user_check+"'";
					stmt.executeUpdate(query);
					System.out.println("Updated Credits");
					query = "select credits from user_credits where username='"+user_check+"'";
					String title = null;
					rs = stmt.executeQuery(query);
					rs.next();
					credits = rs.getInt("credits");
					title = FindTitleFromCredit.get_title(credits);
					query = "update user_credits set title='"+title+"' where username='"+user_check+"'";
					stmt.executeUpdate(query);
					System.out.println("Updated Title");
					
					request.setAttribute("user","'"+request.getParameter("user")+"'");
					request.setAttribute("com_id",com_id);
					request.setAttribute("status1","Purchase Successful");
					request.setAttribute("author", "'"+author+"'");
					request.setAttribute("content", "'"+request.getParameter("content")+"'");
					request.setAttribute("type", "'"+request.getParameter("type")+"'");
					request.setAttribute("created", "'"+request.getParameter("created")+"'");
					request.setAttribute("brand", "'"+request.getParameter("brand")+"'");
					request.setAttribute("spam", request.getParameter("spam"));
					request.setAttribute("trade", "'"+request.getParameter("trade")+"'");
					request.setAttribute("price", request.getParameter("price"));
					request.setAttribute("status", 0);

					rd=request.getRequestDispatcher("Trade.jsp");
					rd.forward(request, response);
					return;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
	}

}
