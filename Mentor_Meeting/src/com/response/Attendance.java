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
 * Servlet implementation class Attendance
 */

public class Attendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Attendance() {
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
		    
		    System.out.println("id is"+id);
	
		   PreparedStatement ps=con.prepareStatement("insert into attendance(stud_id,subject_name,att_percentage,marks,stud_name)values(?,?,?,?,?)");
		  
		   String subject=request.getParameter("subname");
			String attendance=request.getParameter("attendance");
			
			String mark=request.getParameter("mark");
		
			ps.setInt(1,id);
			ps.setString(2,subject);
			ps.setString(3,attendance);
			ps.setString(4,mark);
			ps.setString(5,name);
			
			System.out.println("success");
		    ps.executeUpdate();
			
			RequestDispatcher rd=request.getRequestDispatcher("/attendance.jsp");
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
