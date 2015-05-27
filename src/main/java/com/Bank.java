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
 * Servlet implementation class Bank
 */
@WebServlet("/Bank")
public class Bank extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bank() {
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
		
		String user = null;
		user = request.getParameter("user"); 
		if(user == null)
		{
			user = (String) request.getAttribute("user");
		}
		if(user.equals(""))
		{
			response.sendRedirect("index.jsp");
		}
		else
		{
			ArrayList<String> name= new ArrayList<String>();
			ArrayList<Long> num= new ArrayList<Long>();
			ArrayList<String> created= new ArrayList<String>();
			ArrayList<String> name1= new ArrayList<String>();
			ArrayList<Long> num1= new ArrayList<Long>();
			ArrayList<String> created1= new ArrayList<String>();
			ArrayList<String> type= new ArrayList<String>();
			ArrayList<String> exp= new ArrayList<String>();
			
			DBConnect db = new DBConnect();
			Connection con = db.get_connection();
			Statement stmt = null;
			ResultSet rs = null;
			String query = "select * from bank where user_name='"+user+"'";
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				int i=0;
				while(rs.next())
				{
					name.add("'"+rs.getString("accname")+"'");
					long temp =rs.getLong("accnum"); 
					num.add(temp);
					created.add("'"+rs.getString("created")+"'");
					i++;
				}
				request.setAttribute("count", i);
				request.setAttribute("name", name);
				request.setAttribute("num", num);
				request.setAttribute("created", created);
				
				query = "select * from card where user_name='"+user+"'";
				rs = stmt.executeQuery(query);
				i=0;
				while(rs.next())
				{
					name1.add("'"+rs.getString("namecard")+"'");
					long temp =rs.getLong("cardnum"); 
					num1.add(temp);
					type.add("'"+rs.getString("type")+"'");
					exp.add("'"+rs.getString("exp")+"'");
					created1.add("'"+rs.getString("created")+"'");
					i++;
				}
				request.setAttribute("count1", i);
				request.setAttribute("name1", name1);
				request.setAttribute("num1", num1);
				request.setAttribute("type", type);
				request.setAttribute("exp", exp);
				request.setAttribute("created1", created1);
				
				query = "select * from user_table where username='"+user+"'";
				rs = stmt.executeQuery(query);
				rs.next();
				request.setAttribute("balance",rs.getInt("balance"));
				request.setAttribute("user","'"+user+"'");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rd=request.getRequestDispatcher("Bank.jsp");
			rd.forward(request, response);
		}
	}

}
