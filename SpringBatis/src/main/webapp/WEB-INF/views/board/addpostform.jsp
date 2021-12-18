<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.mycompany.myapp.board.BoardVO,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Add New Post</h1>
	<form action="addok" method="post">
		<table id="edit">
			<tr>
				<td>카테고리</td>
				<td><select id="category" name="category">
						<option value="익히기">익히기</option>
						<option value="대련">대련</option>
						<option value="대회">대회</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="writer" value="${loginId}" readonly="true"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="5" name="content"></textarea></td>
			</tr>
		</table>
		<button type="button" onclick="location.href='list'">목록보기</button>
		<button type="submit">등록하기</button>
	</form>

</body>
</html>