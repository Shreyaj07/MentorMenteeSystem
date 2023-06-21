<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="index.html" %>
<%@ page import="com.connection.DBConnection" %>
<%@ page import="java.sql.*" %>
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
    
    
<link rel="stylesheet" type="text/css" media="all" href="jsDatePick_ltr.min.css" />
<script type="text/javascript" src="jquery.1.4.2.js"></script>
<script type="text/javascript" src="jsDatePick.jquery.min.1.3.js"></script>
<script type="text/javascript">
	function fun(){
		new JsDatePick({
			useMode:2,
			target:"inputField",
			dateFormat:"%d/%m/%Y"
			});
	};
	</script>
</head>
<body>

<!-- Register Content Start -->

    <div class="content">
      <div class="container">
        <div class="row">
        <h4 align="center"> Metting Attendance</h4>
            <div class="widget-body">
            <div>
	              <div class="center-align">
	                <form  onsubmit="return validateRegister();" name="student" class="form-horizontal form-signin-signup" action="MeetingAttendance" method="post" >
				
				
					<div align="center" id="fnm" style="color: red;"></div>
                	<div>
	                 <%
			          Connection con=DBConnection.getC();
			          PreparedStatement ps=con.prepareStatement("select name from students");
			          ResultSet rs=ps.executeQuery();
			         %>
			
				   <select  name="name"  class="form-control"  style="height:35px;width:398px;">
						<option>------SELECT Student-----</option>
						<%
						while(rs.next())
						{
						%>
						<option><%=rs.getString("name")%></option> 
						<%	
						}%>
					</select>
                	</div>
					
				

				     	<br>
				  		 <div align="center" id="date" style="color: red;"></div>
						<input type="date" id="inputField"  onfocus="fun()"   name="date" placeholder="Click For Date" style="height:35px;width:398px;"/>
						<br>
						<div align="center" id="people" style="color: red;"></div>
						<input type="text" name="people" placeholder="Enter Number Of People" style="height:35px;width:398px;"/>
						<br>
						
						
						
						
						<div>
	                    <input type="submit" value="SAVE" class="btn btn-primary btn-large">&nbsp;&nbsp;
	                    <input type="reset" value="RESET" class="btn btn-primary btn-large btn-danger">
	                  </div>
	                </form>
	                
	                	<center>
					<fieldset>
					<table border="1" width="90%" cellpadding="1" cellspacing="1" style="text-align: center">
						<tr bgcolor="#778899" style="height:30px;">
							<td><font size="2" color="white"><center><b>Student Name</b></center></font></td>
							<td><font size="2" color="white"><center><b> Meeting Date</b></center></font></td>
							<td><font size="2" color="white"><center><b>Present Student</b></center></font></td>
							
						
							
						</tr>
				
						<%
						
							Statement st = con.createStatement();
						 ResultSet rs1 = st.executeQuery("select *  from  meeting_attendance");
							  while (rs1.next())
						 {%>
						
						    <tr style="height:30px;">
						  
							<td><%=rs1.getString("stud_name")%></td>
							<td><%=rs1.getString("meeting_date")%></td>
							<td><%=rs1.getString("present")%></td>
						
						</tr>
				
				
						<%
							}
				
							rs1.close();
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
				var fname= document.forms["student"]["name"].value;
				var date = document.forms["student"]["date"].value;
			    var people = document.forms["student"]["people"].value;
			  
			
				if(fname==null || fname=="")
				{
					str=str+"<p>*Enter Name.</p>";
				
					$("#fnm").html(str);
					return false;
				}
			
			
			
			
				if(date==null || date=="")
				{
					str=str+"<p>*Enter Date.</p>";
				
					$("#date").html(str);
					return false;
				}
			
			
				if(people==null || people=="")
				{
					str=str+"<p>*Enter No of People Present.</p>";
					$("#date").hide();
					$("#people").html(str);
					return false;
				}
				      
	        
		}


	
	
</script>