package mainlibrary;

import java.sql.*;
import javax.swing.JTextField;
public class TransBookDao {
	
public static boolean checkBook(String bookcallno){
	boolean status=false;
	try{
		Connection con=DB.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from Books where BookID=?");
		ps.setString(1,bookcallno);
                ResultSet rs=ps.executeQuery();
		status=rs.next();
		con.close();
	}catch(Exception e){System.out.println(e);}
	return status;
}

     public static boolean BookValidate( String BookID)
    {
    boolean status = false;
    try(Connection con = DB.getConnection()) {
        PreparedStatement ps = con.prepareStatement("select * from Books where BookID = ?"); 
        ps.setString(1, BookID);
        ResultSet rs=ps.executeQuery();
        status=rs.next();
        con.close();
    }catch(Exception e){System.out.println(e);}
    return status;
}

         public static boolean UserValidate( String UserID)
    {
    boolean status = false;
    try(Connection con = DB.getConnection()) {
        PreparedStatement ps = con.prepareStatement("select * from Users where UserID = ?"); 
        ps.setString(1, UserID);
        ResultSet rs=ps.executeQuery();
        status=rs.next();
        con.close();
    }catch(Exception e){System.out.println(e);}
    return status;
}

/*public static int save(int  BookID,int UserID,String IssuedDate,String ReturnDate){
	int status=0;
	try{
		Connection con=DB.getConnection();
		
		status=updatebook(BookID;//updating quantity and issue
		
		if(status>0){
		PreparedStatement ps=con.prepareStatement("insert IssuedBook(BookID,UserID,IssueDate,ReturnDate) values(?,?,?,?)");
		ps.setString(1,bookcallno);
		ps.setInt(2,studentid);
		ps.setString(3,studentname);
		ps.setString(4,studentcontact);
		status=ps.executeUpdate();
		}
		
		con.close();
	}catch(Exception e){System.out.println(e);}
	return status;
} */
public static int updatebook(String bookcallno){
	int status=0;
	int quantity=0,issued=0;
	try{
		Connection con=DB.getConnection();
		
		PreparedStatement ps=con.prepareStatement("select quantity,issued from books where callno=?");
		ps.setString(1,bookcallno);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			quantity=rs.getInt("quantity");
			issued=rs.getInt("issued");
		}
		
		if(quantity>0){
		PreparedStatement ps2=con.prepareStatement("update books set quantity=?,issued=? where callno=?");
		ps2.setInt(1,quantity-1);
		ps2.setInt(2,issued+1);
		ps2.setString(3,bookcallno);
		
		status=ps2.executeUpdate();
		}
		con.close();
	}catch(Exception e){System.out.println(e);}
	return status;
}
public static int IssueBook(int BookID, int UserID, String IDate, String RDate)
{
    int status =0;
    try{
        
        Connection con =DB.getConnection();
        PreparedStatement ps= con.prepareStatement("insert into IssuedBook values(?,?,?,?)");
        ps.setInt(1,BookID);
        ps.setInt(2, UserID);
        ps.setString(3,IDate);
        ps.setString(4,RDate);
        status =ps.executeUpdate();
        con.close();
}catch(Exception e){System.out.println(e);}
    return status;
}

   
    public static int ReturnBook(int BookID,int UserID)
{
    int status =0;
    try{
        
        Connection con =DB.getConnection();
        PreparedStatement ps= con.prepareStatement("delete from IssuedBook where BookID=? and UserID=?");
        ps.setInt(1,BookID);
        ps.setInt(2, UserID);
        status =ps.executeUpdate();
        con.close();
}catch(Exception e){System.out.println(e);}
    return status;
}


public static boolean CheckIssuedBook(int BookID)
{
    boolean status = false;
    try(Connection con = DB.getConnection()) {
        PreparedStatement ps = con.prepareStatement("select * from IssuedBook  where BookID=?"); 
        ps.setInt(1, BookID);
        ResultSet rs=ps.executeQuery();
        status=rs.next();
        con.close();
    }catch(Exception e){System.out.println(e);}
    return status;
}

   public static int Check(int UserID)
   {
       boolean status=false;
       int num = 0;
       try(Connection con = DB.getConnection()) {
        PreparedStatement ps = con.prepareStatement("select * from Book_Count UserID=?"); 
        ps.setInt(2, UserID);
        ResultSet rs=ps.executeQuery();
        status=rs.next();
        num = rs.getInt("BookNo");
        con.close();
    }catch(Exception e){System.out.println(e);}
       if(num==5)
           return 0;
       else
           return 1;
   }
       
   }
    


