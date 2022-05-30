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
<h1>update-form</h1>
<%
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/boardbox";
String dbUser="root";
String dbPass="admin";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql="select * from board where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
ResultSet rs= pstmt.executeQuery();

while(rs.next()){
%>
<form action="updatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=rs.getInt("num")%>">

<table border="1">
<tr><td>글쓴이</td><td> <input type="text" name="name" value="<%=rs.getString("name")%>"> </td></tr>
<tr><td>비밀번호</td><td> <input type="password" name="pass"></td></tr>
<tr><td>제목</td><td> <input type="text" name="subject" value="<%=rs.getInt("subject")%>"> </td></tr>
<tr><td>내용</td>
	<td> <textarea rows="10" cols="20" name="content"><%=rs.getString("content") %></textarea> </td></tr>
<tr><td colspan="2"> <input type="submit" value="글수정"> </td></tr>	
</table>
</form>
<%} %>
</body>
</html>