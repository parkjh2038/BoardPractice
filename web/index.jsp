<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, jsp.board.model.vo.*" %>
<% 
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습용 게시판</title>
<style>
	body {
		background:lightgray;
	}
	.outer {
		width:1100px;
		height:700px;
		margin-left:auto;
		margin-right:auto;
		margin-top:30px;
		background:white;
		box-shadow: 0px 0px 5px black;
	}
	.title {
		width: 300px;
		border-style: dashed;
		border-width:0px;
		border-bottom-width:5px;
		border-color: orangered;
		margin-left:auto;
		margin-right:auto;
	}
	table {
		border-style: solid;
		border-width:0px;
		border-top-width:1px;
		border-bottom-width:1px;
		border-color:black;
		text-align:center;
		margin-top:50px;
		margin-bottom:50px;
	}
</style>
</head>
<body>
	<% if(list != null) { %>
	<div class="outer">
		<br>
		<div class="title"  align="center">
			<h2>연습용 게시판</h2>
		</div>
		<div class="tableArea">
			<table align="center" id="listArea">
				<tr>
					<th width="100px">글번호</th>
					<th width="400px">글제목</th>
					<th width="150px">작성자</th>
					<th width="100px">조회수</th>
					<th width="150px">작성일</th>
				</tr>
				<% for(Board b : list){ %>
					<tr>
						<td><%= b.getBid() %></td>
						<td><%= b.getbTitle() %></td>
						<td><%= b.getbWriter() %></td>
						<td><%= b.getbCount() %></td>
						<td><%= b.getbDate() %></td>
					</tr>
				<% } %>
			</table>
		</div>	<!-- tableArea end -->
		
		<div class="searchArea" align="center">
			<input type="search">
			<button type="submit">검색하기</button>
			<button onclick="location.href='views/boardInsertForm.jsp'">작성하기</button>
		</div>	<!-- searchArea end -->
	</div>	<!-- outer end -->
	<% }else{
		response.sendRedirect("/bp/selectList.bo");
	} %>
</body>
</html>