 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 
 <%@page import="java.sql.*" %>
 
 <%
		String id = request.getParameter("id");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/school", "root", "");
		pst = con.prepareStatement("delete from records where id = ?");
		pst.setString(1, id);
		pst.executeUpdate();
	%>
	
	<script>
		alert("Użytkownik Usunięty");
	</script>
	
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
			<div class="container-delete">
				<a href="index.jsp">Menu główne</a>
			</div>
		</div>
	</div>
	
</body>
<body>	
</html>	
	