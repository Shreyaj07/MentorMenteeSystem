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
        <h4 align="center"> Attendance</h4>
            <div class="widget-body">
            <div>
	              <div class="center-align">
	                <form  onsubmit="return validateRegister();" name="student" class="form-horizontal form-signin-signup" action="attendance" method="post" >
						<div align="center" id="fnm" style="color: red;"></div>
                	<div>
	                 <%
			          Connection con=DBConnection.getC();
			          PreparedStatement ps=con.prepareStatement("select name from students");
			          ResultSet rs=ps.executeQuery();
			         %>
			
				   <select  name="name"  class="form-control"  style="height:35px;width:398px; ">
						<option>------SELECT Name-----</option>
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
						<div align="center" id="subject" style="color: red;"></div>
						<input type="text" name="subname" placeholder="Enter Subject Name" style="height:35px;width:398px;"/>
						<br>
						
						   
						<div align="center" id="attendance" style="color: red;"></div>
						<input type="text" name="attendance" placeholder="Enter Attendance In Present" style="height:35px;width:398px;"/>
						<br>
							
				

				    
						<div align="center" id="mark" style="color: red;"></div>
						<input type="text" name="mark" placeholder="Enter Marks" style="height:35px;width:398px;"/>
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
							<td><font size="2" color="white"><center><b>Subject Name</b></center></font></td>
							<td><font size="2" color="white"><center><b> Attendance in %</b></center></font></td>
							<td><font size="2" color="white"><center><b>Marks</b></center></font></td>
						</tr>
				
						<%
							
						
							Statement st = con.createStatement();
						 ResultSet rs1 = st.executeQuery("select *  from  attendance");
							  while (rs1.next())
						 {%>
						
						    <tr style="height:30px;">
						  
							<td><%=rs1.getString("stud_name")%></td>
							<td><%=rs1.getString("subject_name")%></td>
							<td><%=rs1.getString("att_percentage")%></td>
							<td><%=rs1.getString("marks")%></td>
					
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
	
	        var sub = document.forms["student"]["subname"].value; 
		 	var atten = document.forms["student"]["attendance"].value; 
		    var mark = document.forms["student"]["mark"].value;			
 		
			if(sub==null || sub==""){
				str=str+"<p>*Enter Subject.</p>";
		    	$("#subject").html(str);
				return false;
			}
    
			if(atten==null || atten=="")
			{
				str=str+"<p>*Enter Attendance.</p>";
				$("#subject").hide();
				$("#attendance").html(str);
				return false;
			}


			if(mark==null || mark=="")
			{
				str=str+"<p>*Enter Mark.</p>";
				$("#attendance").hide();
				$("#mark").html(str);
				return false;
			}
		   
	        
		}


	
	
</script>