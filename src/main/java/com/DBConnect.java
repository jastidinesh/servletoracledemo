package com;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnect {
 
	public   Connection get_connection() {
/*
	 Connection connection = null;
	 URI dbUri;
	try {
		dbUri = new URI(System.getenv("DATABASE_URL"));
	    String username = dbUri.getUserInfo().split(":")[0];
	    String password = dbUri.getUserInfo().split(":")[1];
	    int port = dbUri.getPort();

	    String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ":" + port + dbUri.getPath();
	    
	    try {
			connection = DriverManager.getConnection(dbUrl, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} catch (URISyntaxException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}


	    return connection;*/
		try {
		    Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
		}
		Connection connection = null;
		try {
		    String url = "jdbc:postgresql://ec2-54-197-224-173.compute-1.amazonaws.com:5432/dcdg0tqvshiq59?"
		    		+ "user=owyrervysawpgs&password=pF5BHzfqskN1BbDi3gHE2PE4Kc&"
		    		+ "ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory";
		    Properties props = new Properties();
		    props.setProperty("user", "wkpftjetpstqic");
		    props.setProperty("password", "F9pRGn6QWsgxWOXU6zf5asLqIS");
		    props.setProperty("ssl", "true");
		    connection = DriverManager.getConnection(url, props);
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		return connection;
	}
}