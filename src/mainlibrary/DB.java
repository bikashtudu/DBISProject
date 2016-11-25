/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainlibrary;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author bikash
 */
public class DB {
    

	public static Connection getConnection(){
		Connection con=null;
		try{
                            Properties props = new Properties(); 
    props.put("user", "root");         
    props.put("password", "1234");
    props.put("useUnicode", "true");
    props.put("useServerPrepStmts", "false"); // use client-side prepared statement
    props.put("characterEncoding", "UTF-8"); // ensure charset is utf8 here

			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library",props);
		}catch(ClassNotFoundException | SQLException e){System.out.println(e);}
		return con;
	}

}
