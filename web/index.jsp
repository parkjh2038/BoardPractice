<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, jsp.board.model.vo.*" %>
<% 
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
	.tableArea {
		height:420px;
		margin-top:50px;
		margin-bottom:20px;
	}
	.pagingArea {
		margin-bottom:30px;
	}
	.searchArea {
		width: 900px;
	}
	table {
		border-style: solid;
		border-width:0px;
		border-top-width:1px;
		border-bottom-width:1px;
		border-color:black;
		text-align:center;
	}
	th {
		background:lightgray;
	}
</style>
</head>
<body>
	<% if(list == null) {
		response.sendRedirect("/bp/selectList.bo");
	}else{ %>

	<div class="outer" align="center">
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
		
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=1'"><<</button>
			
			<% if(currentPage <= 1){ %>
			<button disabled><</button>
			<% } else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage - 1%>'"><</button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){
			%>
				<button disabled><%= p %></button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=p%>'"><%= p %></button>
			<% }
			} %>
			
			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<% } else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage + 1%>'">></button>
			<% } %>
			
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=maxPage%>'">>></button>
		</div>	<!-- pagingArea end -->

		<div class="searchArea" align="right">
			<input type="search">
			<button type="submit">검색하기</button>
			<button onclick="location.href='views/boardInsertForm.jsp'">작성하기</button>
		</div>	<!-- searchArea end -->
	</div>	<!-- outer end -->
	<% } %>
</body>
</html>