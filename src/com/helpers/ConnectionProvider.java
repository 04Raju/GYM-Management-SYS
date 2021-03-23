package com.helpers;
import java.sql.*;
public class ConnectionProvider {

	private static Connection con;
	public static Connection getConnection() 
	{
		try {
		
			if(con == null) {
				//driver class load
				Class.forName("com.mysql.jdbc.Driver");
				//Create a connection.
				con= DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","");
			}
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
}