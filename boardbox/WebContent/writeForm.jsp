<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시판글쓰기</h1>
<<form action="writePro.jsp" method="post">
<table border="2">
<tr><td>글쓴이</td><td> <input type="text" name="name" /> </td></tr>
<tr><td>비밀번호</td><td> <input type="text" name="pass" /> </td></tr>
<tr><td>제목</td><td> <input type="text" name="subject" /> </td></tr>
<tr><td>내용</td>
<td> <textarea rows="10" cols="20" name="content" ></textarea> </td></tr>
<tr><td colspan="2"> <input type="submit" value="글쓰기"> </td></tr>
</table>

</form>
</body>
</html>