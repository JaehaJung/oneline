<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.ArrayList" %>
<%@ page import="twoline.OnelineDAO" %>
<%@ page import="twoline.OnelineDTO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>웹 서비스 실습</title>
</head>
<%
	OnelineDAO dao = new OnelineDAO();
	ArrayList<OnelineDTO> dtos = dao.getList();
%>
	<div class= "box1">
	<h3 class="title">메모장</h3>
	
	<div class= "box2">
	<form method="post" action="memo_write.jsp">
	<input type="text" name ="memo"></input>
	<input type="submit" value="등록"></input>
	</form>
	</div>
	</div>
<%
	for(int i = 0; i < dtos.size() ; i++) {
		OnelineDTO dto = dtos.get(i);
		out.println("<p>(" + dto.getWdate() + ") " + dto.getMemo() + 
				"<input type=\"button\" value=\"X\" onClick=\"location.href='memo_delete.jsp?no=" + dto.getNo() + "'\"><br>");
		out.println("</input></p>");
	}
%>	
		
</body>
</html>
