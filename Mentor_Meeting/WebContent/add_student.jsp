<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="index.html" %>
<%@ page import="com.connection.DBConnection" %>
<%@  page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mentor  Meeting</title>

<!-- Boostrap Css -->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css"  />
	<link rel="stylesheet" type="text/css" href="css/font-awesome.css"  />
	<link rel="stylesheet" type="text/css" href="css/boot-business.css"  />
	<link rel="stylesheet" type="text/css" href="css/font-awesome-ie7.css"  />
<!-- Boostrap JS -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/boot-business.js"></script>
</head>
<body>

<!-- Register Content Start -->

    <div class="content">
      <div class="container">
        <div class="row">
        <h4 align="center"> Add Student</h4>
            <div class="widget-body">
            <div>
	              <div class="center-align">
	                <form  onsubmit="return validateRegister();" name="student" class="form-horizontal form-signin-signup" action="student" method="post" >
					
						<div align="center" id="fnm" style="color: red;"></div>
						<input type="text" name="name" placeholder="Enter Name" style="height:35px;width:398px;"/>
				     	<br>
				  		 <div align="center" id="mail" style="color: red;"></div>
						<input type="text" name="email" placeholder="Enter Email" style="height:35px;width:398px;"/>
						<br>
						<div align="center" id="c_no" style="color: red;"></div>
						<input type="text" name="contact" placeholder="Enter Contact" style="height:35px;width:398px;"/>
						<br>
						<div align="center" id="age" style="color: red;"></div>
						<input type="text" name="age" placeholder="Enter Age" style="height:35px;width:398px;"/>
						<br>
						<div align="center" id="gen" style="color: red;"></div>
						
						Gender : 
	                    <input type="radio" name="gender" id="male" value="male" checked>&nbsp;Male
	                    &nbsp;&nbsp;&nbsp;
	                    <input type="radio" name="gender" id="female" value="female">&nbsp;Female
				    	<br><br>
						
						<div align="center" id="branch" style="color: red;"></div>
						<input type="text" name="branch" placeholder="Enter Branch" style="height:35px;width:398px;"/>
						<br>
						<div align="center" id="year" style="color: red;"></div>
						<input type="text" name="year" placeholder="Enter Year" style="height:35px;width:398px;"/>
						<br>
						<div>
	                    <input type="submit" value="SAVE" class="btn btn-primary btn-large">&nbsp;&nbsp;
	                    <input type="reset" value="Reset" class="btn btn-primary btn-large btn-danger">
	                  </div>
	                </form>
	                
	                	<center>
					<fieldset>
					<table border="1" width="90%" cellpadding="1" cellspacing="1" style="text-align: center">
						<tr bgcolor="#778899" style="height:30px;">
							<td><font size="2" color="white"><center><b>Name</b></center></font></td>
							<td><font size="2" color="white"><center><b> Contact</b></center></font></td>
							<td><font size="2" color="white"><center><b>Email</b></center></font></td>
							<td><font size="2" color="white"><center><b>Age</b></center></font></td>
							<td><font size="2" color="white"><center><b>Gender</b></center></font></td>
							<td><font size="2" color="white"><center><b>Year</b></center></font></td>
						
							
						</tr>
				
						<%
							
							Connection con =DBConnection.getC();
							Statement st = con.createStatement();
						 ResultSet rs = st.executeQuery("select *  from  students");
							  while (rs.next())
						 {%>
						
						    <tr style="height:30px;">
						  
							<td><%=rs.getString("name")%></td>
							<td><%=rs.getString("contact")%></td>
							<td><%=rs.getString("email")%></td>
							<td><%=rs.getString("age")%></td>
							<td><%=rs.getString("gender")%> </td>
							<td><%=rs.getString("year")%> </td>
						</tr>
				
				
						<%
							}
				
							rs.close();
							st.close();
							con.close();
						%>
					</table>
					</fieldset>
					</center>
   
	              </div>
              </div>
              
            </div>
          </div>
      </div>
    </div>
<!-- Register Content End -->


</body>
</html>
<script type="text/javascript">

//Register Function Start

function validateRegister()
{
			var str="";
			var fullname = document.forms["student"]["name"].value;
		    var emailid = document.forms["student"]["email"].value;
		    var cnct_no = document.forms["student"]["contact"].value;		
		 	var age = document.forms["student"]["age"].value;			
			var male1 = $('#male').prop("checked");
			var female1 = $('#female').prop("checked");
			var branch = document.forms["student"]["branch"].value;
	        var year = document.forms["student"]["year"].value; 
		
			
			if(fullname==null || fullname=="")
			{
				str=str+"<p>*Enter  Name.</p>";
			
				$("#fnm").html(str);
				return false;
			}
			
		var fname = /^([A-Za-z])+$/; 

			if((!fname.test(fullname)))  
		    {  
				str=str+"<p>*Enter Alphabets Only in Name.</p>";
				$("#fnm").html(str);
				return false;
		    }  

			if(emailid==null || emailid=="")
			{
				str=str+"<p>*Enter Email.</p>";
				$("#fnm").hide();
				$("#mail").html(str);
				return false;
			}
		
		 var emailid1 = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  

		    if(!emailid1.test(emailid))
		    {  
				str=str+"<p>*Email Not Valid.</p>";
				$("#fnm").hide();
				$("#mail").html(str);
				return false;
		    }  

		
		

			if(cnct_no==null || cnct_no=="")
			{
				str=str+"<p>*Enter Contact Number.</p>";
		    	$("#mail").hide(); 
				$("#c_no").html(str);
				return false;
			}
    
		var phoneno =/^[0-9]+$/;

			if(!phoneno.test(cnct_no))  
		    {  
				str=str+"<p>*Enter Numbers Only in Contact Number.</p>";
				$("#mail").hide(); 
				$("#c_no").html(str);
				return false;
		    }  
		
		var pattern = /^\d{10}$/;
	        if (!pattern.test(cnct_no)) {
				str=str+"<p>*Enter valid 10 Digit Mobile Number!</p>";
				$("#mail").hide(); 
				$("#c_no").html(str);
	            return false;
	        } 

	        



			if(age==null || age=="")
			{
				str=str+"<p>*Enter Age.</p>";
				$("#c_no").hide();
				$("#age").html(str);
				return false;
			}

			

		 	if(male1==false && female1==false)
	        {
		       str=str+"<p>*Select Gender.</p>";
				$("#gen").html(str);
				return false;
	        }

			
			
			if(branch==null || branch=="")
			{
				str=str+"<p>*Enter Branch.</p>";
				$("#age").hide();
				$("#branch").html(str);
				return false;
			}
			if(year==null || year=="")
			{
				str=str+"<p>*Enter Year.</p>";
				$("#branch").hide();
				$("#year").html(str);
				return false;
			}
		
	      
	        
		}


	
	
</script>