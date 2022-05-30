<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>  
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
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String pass=request.getParameter("pass");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	int readcount=0;
	Timestamp reg_date=new Timestamp(System.currentTimeMillis());
	
    Class.forName("com.mysql.cj.jdbc.Driver");
    String dbUrl="jdbc:mysql://localhost:3306/boardbox";
    String dbUser="root";
    String dbPass="admin";
    Connection con=DriverManager.getConnection("dbUrl, dbUser, dbPass");
    
    int num=0;
    String sql="select max(num) from board";
    PreparedStatement pstmt=con.prepareStatement(sql);
    ResultSet rs=pstmt.executeQuery();
    if(rs.next()){
    num=rs.getInt("max(num)")+1;
    }
    
    sql="insert into board(num, name, pass, subject, content, readcount, date) values(?,?,?,?,?,?,?)";
    pstmt=con.prepareStatement(sql);
    pstmt.setInt(1, num);
    pstmt.setString(2, name);
    pstmt.setString(3, pass);
    pstmt.setString(4, subject);
    pstmt.setString(5, content);
    pstmt.setInt(6, readcount);
    pstmt.setTimestamp(7, reg_date);
    pstmt.executeUpdate();
    
    response.sendRedirect("list.jsp");
	%>
</body>
</html>