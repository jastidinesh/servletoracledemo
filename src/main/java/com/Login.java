package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
    	resp.sendRedirect("index.jsp");
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		
		DBConnect db = new DBConnect();
		Connection con = db.get_connection();
		
		Statement stmt = null;
		String query_user = "select * from user_table where username='"+user+"'";
		boolean flag_password = false;
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query_user);
			while (rs.next())
			{
					if(pass.equals(rs.getString("pass")))
						flag_password = true;
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		if(flag_password)
		{
			if(user.equals("res_leader"))
			{
				request.setAttribute("user",user);
				RequestDispatcher rd=request.getRequestDispatcher("/ResAdmin");
				rd.forward(request, response);
			}
			else if(user.equals("com_leader"))
			{
				request.setAttribute("user",user);
				RequestDispatcher rd=request.getRequestDispatcher("/ComAdmin");
				rd.forward(request, response);
			}
			else
			{
				request.setAttribute("user",user);
				RequestDispatcher rd=request.getRequestDispatcher("/Select");
				rd.forward(request, response);
			}
		}
		else
		{
			response.sendRedirect("index.jsp?status=Invalid User");
		}
	}
}

