<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");	
		int no= Integer.parseInt(request.getParameter("no"));
		String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
		String user = "root";
		String passwd = "cs1234";
		Connection con = null;
		String del = "delete from oneline where no=(?)";
		PreparedStatement pstmt = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		con = DriverManager.getConnection(url, user, passwd);
		
		pstmt = con.prepareStatement(del);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		response.sendRedirect("memo_list.jsp"); 
	%>

</body>
</html>