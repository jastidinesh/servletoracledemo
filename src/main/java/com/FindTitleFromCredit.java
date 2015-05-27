package com;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class FindTitleFromCredit {

	public static String get_title(int credit)
	{
		DBConnect db = new DBConnect();
		Connection con = db.get_connection();
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from credit_chart";
		int start,end;
		String title;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next())
			{
				start = rs.getInt("credit_start");
				end = rs.getInt("credit_end");
				title = rs.getString("title");
				
				if(credit >= start && credit <= end)
				{
					return title;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
}
