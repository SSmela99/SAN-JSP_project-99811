<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
 <%@page import="java.sql.*" %>
 
 <%
	if(request.getParameter("submit")!=null) {
		
		String id = request.getParameter("id");
		String name = request.getParameter("sname");
		String course = request.getParameter("course");
		String fee = request.getParameter("fee");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/school", "root", "");
		pst = con.prepareStatement("update records set sname = ?,course =?,fee= ? where id = ?");
		pst.setString(1, name);
		pst.setString(2, course);
		pst.setString(3, fee);
		pst.setString(4, id);
		pst.executeUpdate();
		
	%>
	
	<script>
		alert("Użytkownik zaktualizowany");
	</script>
	
	<%		
	}
%>
 
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
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
				<h1>Zaaktualizuj Dane</h1>
				<form method="POST" action="#" class="form-container" autocomplete="off">
				
					<%
						Connection con;
						PreparedStatement pst;
						ResultSet rs;
						
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost/school", "root", "");
						
						String id = request.getParameter("id");
						pst = con.prepareStatement("select * from records where id = ?");
						pst.setString(1, id);
						
							rs = pst.executeQuery();
							while(rs.next()) {
								
		
					%>
				
					<div>
						<input type="text" placeholder="imię studenta" value="<%=rs.getString("sname") %>" name="sname" id="sname" required>
					</div>
					
					<div>
						<input type="text" placeholder="kurs" value="<%=rs.getString("course") %>" name="course" id="course" required>
					</div>
					
					<div>
						<input type="text" placeholder="Opłata" value="<%=rs.getString("fee") %>" name="fee" id="fee" required>
					</div>
					
					<% 
						} 
					%>
					
					<div class="buttons">
						<button class="addBtn" type="submit" value="submit" id="submit" name="submit">Aktualizuj</button>
						<button class="resetBtn" type="reset" value="reset" id="reset" name="submit">Reset</button>
					</div>
					
					<div class="menuLink">
						<a href="index.jsp">Menu główne</a>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	
</body>

</html>