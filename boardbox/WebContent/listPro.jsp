<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/boardbox";
String dbUser="root";
String dbPass="admin";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
String sql="select * from board";
PreparedStatement pstmt=con.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();
%>

<h1>리스트</h1>
 
<table border="1">
<tr><td> 글 번호 </td><td> 제목 </td><td> 작성자 </td><td> 날짜 </td> <td> 조회수 </td></tr>
<%
while(rs.next()){
%>
<tr><td><%=rs.getInt("num")%> </td>
<td><%=rs.getString("subject")%></td>
<td><%=rs.getString("name")%> </td>
<td><%=rs.getTimestamp("date")%> </td>
<td><%=rs.getInt("readcount")%> </td></tr><%
}
%>
</body>
</html>