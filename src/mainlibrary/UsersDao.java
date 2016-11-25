/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainlibrary;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author bikash
 */
public class UsersDao {
    
    
    public static boolean validate(String name,String password){
		boolean status=false;
		try{
			Connection con=DB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from Users where UserName=? and UserPass=?");
			ps.setString(1,name);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			status=rs.next();
			con.close();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
    
    public static boolean CheckIfAlready(String UserName)
    {
        boolean status=false;
		try{
			Connection con=DB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from Users where UserName=?");
			ps.setString(1,UserName);
			ResultSet rs=ps.executeQuery();
			status=rs.next();
			con.close();
		}catch(Exception e){System.out.println(e);}
		return status;
        
    }
    
    

    public  static int AddUser(String User, String UserPass, String UserEmail, String Date) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
       
         int status =0;
         try{
        
            Connection con =DB.getConnection();
            PreparedStatement ps= con.prepareStatement("insert into Users(UserPass,RegDate,UserName,Email) values(?,?,?,?)");
            ps.setString(1,UserPass);
            ps.setString(2,Date);
            ps.setString(3,User);
            ps.setString(4,UserEmail);
            status =ps.executeUpdate();
            con.close();
}catch(Exception e){System.out.println(e);}
    return status; 
    
    
    }

    
}
