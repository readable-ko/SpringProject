<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.mycompany.myapp.board.BoardDAO, com.mycompany.myapp.board.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>customized board</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
#list {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}
#list td, #list th {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}
#list tr:hover {
	background-color: #ddd;
}
#list th {
	padding-top: 12px;
	padding-bottom: 12px;
	font-weight: bold;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {height: 550px}
/* Set gray background color and 100% height */
.sidenav {
background-color: #f1f1f1;
height: 100%;
}
/* On small screens, set height to 'auto' for the grid */
@media screen and (max-width: 767px) {
.row.content {height: auto;} 
.myCarousel {width:100%}
}
@media screen and (max-width: 1106px) {
.myCarousel {width:100%}
}

.content{
margin-left:50px;
}
.middle{
display:flex;
background-color:#f8f8f8;
}
.intro{
margin:20px 5px 0px 0px;
width:700px;
height:200px;
background-color:#d0a9f5;
}
.slide{
margin-top:20px;
width=400px;
height:200px;
background-color:#f5a9f2;
}
.cont{display:flex;}
.title1{
margin:10px 0px 10px 0px;
background-color:#A9E2F3;
height:60px;
}
.video1{
height:150px;
background-color:#2E64FE;
}
.title2{
margin:10px 0px 10px 0px;
background-color:#A9E2F3;
height:60px;
}
.video2{
display:grid;
grid-template-columns:repeat(3, 1fr);
}
.v1_1, {
height:150px;
width:180px;
background-color:#2E64FE;
margin-right:5px;
}
</style>
<script>
	function delete_ok(id) {
		var a = confirm("정말로 삭제하겠습니까?");
		if (a)
			location.href = 'delete_ok.jsp?id=' + id;
	}
	function view(id) {
		location.href = 'view.jsp?id=' + id;
	}
	function edit(id) {
		location.href = 'editform.jsp?id=' + id;
	}
</script>
</head>
<body>
	<h1>Members</h1>
	<%
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> list = boardDAO.getBoardList();
	request.setAttribute("list", list);
	%>
	<table id="list">
		<tr>
			<th>Id</th>
			<th>User ID</th>
			<th>User Name</th>
			<th>Email</th>
			<th>Registered Date</th>
			<th><input type="button" value="Add"
				onclick="location.href='addform.jsp'" /></th>
		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getSid()}</td>
				<td>${u.getUserid()}</td>
				<td>${u.getUsername()}</td>
				<td>${u.getEmail()}</td>
				<td>${u.getRegdate()}</td>
				<td><input type="button" value="View"
					onclick="javascript:view('${u.getSid()}')" /> <input type="button"
					value="Edit" onclick="javascript:edit('${u.getSid()}')" /> <input
					type="button" value="Delete"
					onclick="javascript:delete_ok('${u.getSid()}')" /></td>
			</tr>
		</c:forEach>
	</table>
	
	<section class="main">
		<div class="middle">
			<div class="menu">
			
			</div>
			<div class="content">
				<div class="cont">
					<div class="intro">intro</div>
					<div class="slide">slide</div>
				</div>
				<div class="cont1">
					<div class="title1">title1</div>
					<div class="video1">
						<div class="v1_1">영상1</div>
						<div class="v1_2">영상2</div>
						<div class="v1_3">영상3</div>
						<div class="v1_4">영상4</div>
						<div class="v1_5">영상5</div>
						<div class="v1_6">영상6</div>
					</div>
				</div>
				<div class="cont2">
					<div class="title2">title1</div>
					<div class="video2">
						<div class="v2_1">영상1</div>
							<iframe width="560" height="315" src="https://www.youtube.com/embed/HSN44ttUYBU"></iframe>
						<div class="v2_2">영상2</div>
						<div class="v2_3">영상3</div>
						<div class="v2_4">영상4</div>
						<div class="v2_5">영상5</div>
						<div class="v2_6">영상6</div>
					</div>
				</div>
			
			</div>
		</div>
	</section>

</body>
</html>