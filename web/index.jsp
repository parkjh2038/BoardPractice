<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, jsp.board.model.vo.*" %>
<% 
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>연습용 게시판</title>
<style>
<%@ include file="/css/boardStyle.css" %>
</style>
</head>
<body>
	<% if(list != null) {
		PageInfo pi = (PageInfo) request.getAttribute("pi");
		int listCount = pi.getListCount();
		int currentPage = pi.getCurrentPage();
		int maxPage = pi.getMaxPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
	%>
	<div class="outer" align="center">
		<br>
		<div class="title"  align="center">
			<h2>연습용 게시판</h2>
		</div>
		<div class="tableArea">
			<table align="center" id="listArea">
				<tr id="th">
					<th width="100px">글번호</th>
					<th width="400px">글제목</th>
					<th width="150px">작성자</th>
					<th width="100px">조회수</th>
					<th width="150px">작성일</th>
				</tr>
				<% for(Board b : list){ %>
					<tr class="td">
						<td><%= b.getBid() %></td>
						<td><%= b.getbTitle() %></td>
						<td><%= b.getbWriter() %></td>
						<td><%= b.getbCount() %></td>
						<td><%= b.getbDate() %></td>
					</tr>
				<% } %>
			</table>
		</div>	<!-- tableArea end -->
		
		<script>
			$(function(){
				$("#listArea td").click(function(){
					var num = $(this).parent().children().eq(0).text();
					location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num;
				});
			})
		</script>
		
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
	<% }else{
		response.sendRedirect("/bp/selectList.bo");
	
	} %>
</body>
</html>