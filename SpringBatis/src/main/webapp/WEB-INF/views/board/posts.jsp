<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.mycompany.myapp.board.BoardDAO, com.mycompany.myapp.board.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>club board</title>
<style>
@media screen and (max-width: 767px) {
	.row.content {
		height: auto;
	}
	.myCarousel {
		width: 100%
	}
}
@media screen and (max-width: 1106px) {
	.myCarousel {
		width: 100%
	}
}

#list {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#list td, #list th {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

#list tr:nth-child(even) {
	background-color: #f2f2f2;
}

#list tr:hover {
	background-color: #ddd;
}

#list th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #006bb3;
	color: white;
}
</style>
<script>
	function delete_ok(id, writer) {
		var a = false
		if('${loginId}' != writer && '${loginId}' != 'admin') alert("권한이 없습니다.")
		else a = confirm("정말로 삭제하겠습니까?");
		if (a)
			location.href = 'deleteok/' + id;
	}
	function edit_ok(id, writer) {
		if('${loginId}' != writer && '${loginId}' != 'admin') alert("권한이 없습니다.")
		else location.href = "editpost/" + id;
	}
</script>
</head>
<body>

	<h1>자유게시판</h1>
	<a>${loginId}님 </a>
	<a href="../login/logout">로그아웃</a>
	<table id="list">
		<tr>
			<th>Id</th>
			<th>Category</th>
			<th>Title</th>
			<th>Writer</th>
			<th>Regdate</th>
			<th>View</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.seq}</td>
				<td>${u.category}</td>
				<td>${u.title}</td>
				<td>${u.writer}</td>
				<td>${u.regdate}</td>
				<td><a href="viewpost/${u.seq}">글보기</a></td>
				<td><a href="javascript:edit_ok('${u.seq}', '${u.writer}')">글수정</a></td>
				<td><a href="javascript:delete_ok('${u.seq}', '${u.writer}')">글삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<button type="button" onclick="location.href='add'">새글쓰기</button>

</body>
</html>