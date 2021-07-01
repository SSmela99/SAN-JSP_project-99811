
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.sql.*" %>

<%
	if(request.getParameter("submit")!=null) {
		String name = request.getParameter("sname");
		String course = request.getParameter("course");
		String fee = request.getParameter("fee");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/school", "root", "");
		pst = con.prepareStatement("insert into records(sname, course, fee)values(?,?,?)");
		pst.setString(1, name);
		pst.setString(2, course);
		pst.setString(3, fee);
		pst.executeUpdate();
		
	%>
	
	<script>
		alert("Użytkownik dodany");
	</script>
	
	<%		
	}
%>    
      
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="container-box">
	
		<div class="index-container">
			<div class="form-container">
				<h1>Rejestracja studenta</h1>
				<form method="POST" action="#" class="form-container" autocomplete="off">
				
					<div>
						<input type="text" placeholder="imię studenta" name="sname" id="sname" autocomplete="new-password" required>
					</div>
					
					<div>
						<input type="text" placeholder="kurs" name="course" id="course" required>
					</div>
					
					<div>
						<input type="number" placeholder="Opłata" name="fee" id="fee" required>
					</div>
					
					<div class="buttons">
						<button class="addBtn" type="submit" value="submit" id="submit" name="submit">Dodaj</button>
						<button class="resetBtn" type="reset" value="reset" id="reset" name="submit">Reset</button>
					</div>
					
				</form>
			</div>	
		
			<div>
			
				<div class="panel-form">
					<table id="tbl-student" class="table table-responsive">
						<thead>
							<tr>
								<th>Imię</th>
								<th>Kurs</th>
								<th>Opłata</th>
								<th>Edytuj</th>
								<th>Usuń</th>
							</tr>
							
							<%
								Connection con;
								PreparedStatement pst;
								ResultSet rs;
								
								Class.forName("com.mysql.jdbc.Driver");
								con = DriverManager.getConnection("jdbc:mysql://localhost/school", "root", "");
								
								String query = "select * from records";
								Statement st = con.createStatement();
									
									rs = st.executeQuery(query);
									
									while(rs.next()) {
										String id = rs.getString("id");
									
							%>
							
							<tr>
								<td><%=rs.getString("sname") %></td>
								<td><%=rs.getString("course") %></td>
								<td><%=rs.getString("fee") %> zł</td>
								<td><a href="update.jsp?id=<%=id%>"><i class="large material-icons">edit</i></a></td>
								<td><a href="delete.jsp?id=<%=id%>"><i class="large material-icons">delete</i></a></td>
							</tr>
							
							<%
								}						
							%>
						</thead>	
					</table>
				</div>
			</div>	
		</div>	
	</div>
</body>
</html>