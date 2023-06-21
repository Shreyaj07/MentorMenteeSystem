package com.response;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DBConnection;

/**
 * Servlet implementation class Metting_Attendance
 */

public class Metting_Attendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try 
		{
			int id=0;
			String name=request.getParameter("name");
		    
		    Connection con=DBConnection.getC();
		    String str="select stud_id from students where name='"+name+"'";
		    System.out.println(str);
		    PreparedStatement st=con.prepareStatement(str);
		    
		    ResultSet rs=st.executeQuery();
		    while(rs.next())
		    {
		    	id=rs.getInt("stud_id");
		    }
	
		   PreparedStatement ps=con.prepareStatement("insert into meeting_attendance(stud_id,meeting_date,present,stud_name)values(?,?,?,?)");
		    String date=request.getParameter("date");
			String people=request.getParameter("people");
			
			
		
			ps.setInt(1,id);
			ps.setString(2,date);
			ps.setString(3,people);
			ps.setString(4,name);
			
			
		    ps.executeUpdate();
			
			RequestDispatcher rd=request.getRequestDispatcher("/meeting_attendance.jsp");
			rd.forward(request, response);
		}
			
			
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		out.flush();
		out.close();


	}
	public void destroy()
	{
		super.destroy();
	}


}
