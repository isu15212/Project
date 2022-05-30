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
<h1>updatePro</h1>
<%
request.setCharacterEncoding("utf-8");
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

Class.forName("com.mysql.cj.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/boardbox";
String dbUser="root";
String dbPass="admin";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
String sql="select * from board where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
ResultSet rs= pstmt.executeQuery();

if(rs.next()){
	if(pass.equals(rs.getString("pass"))){
		sql="update board set name=?, subject=?, content=? where num=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, subject);
		pstmt.setString(3, content);
		pstmt.setInt(4, num);
		pstmt.executeUpdate();
		response.sendRedirect("list.jsp");
	}else{
	%><script type="text/javascript">
		alert("비밀번호 오류");
		history.back();
	</script>
	<%}}%>

</body>
</html>