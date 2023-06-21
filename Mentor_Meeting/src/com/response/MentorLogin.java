package com.response;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DBConnection;

import java.sql.*;

/**
 * Servlet implementation class Student
 */

public class MentorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out=response.getWriter();
		try 
		{
			
			String name=request.getParameter("name");
			String pass=request.getParameter("password");
	
		    Connection con=DBConnection.getC();
		    Statement st=con.createStatement();
		    ResultSet rs=null;
		    rs=st.executeQuery("select * from registration where name='"+name+"' and password='"+pass+"' ");
		    if(rs.next())
		    {
		    	response.sendRedirect("index.html");
		    }
		    else
		    {
		    	response.sendRedirect("login.jsp");
		    }
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


