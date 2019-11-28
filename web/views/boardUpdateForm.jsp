<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jsp.board.model.vo.*"%>
<%
	Board b = (Board) request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<%@ include file="/css/boardStyle.css" %>
</style>
</head>
<body>
	<div class="outer">
			<br>
			<h2 align="center">게시판 수정</h2>
			<div class="tableArea">
				<form action="<%=request.getContextPath()%>/update.bo" method="post">
					<table align="center">
						<tr>
							<td>제목</td>
							<td colspan="3">
								<input type="text" size="50" name="title" value="<%= b.getbTitle() %>">
								<input type="hidden" name="bid" value="<%= b.getBid() %>">
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>
								<input type="text" value="<%= b.getbWriter() %>" name="writer" readonly>
							</td>
							<td>작성일</td>
							<td>
								<input type="date" name="date" value="<%= b.getbDate() %>" readonly>
							</td>
						</tr>
						<tr>
							<td>내용</td>
						</tr>
						<tr>
							<td colspan="4">
								<textarea name="content" cols="60" rows="15" style="resize:none;"><%= b.getbContent() %></textarea>
							</td>
						</tr>
					</table>
					<br>
					<div align="center">
						<button type="reset" onclick="location.href='<%=request.getContextPath()%>/selectOne.bo?num=<%=b.getBid()%>'">취소하기</button>
						<button type="submit">수정하기</button>
					</div>
				</form>
			</div>	<!-- tableArea end -->
		</div>	<!-- outer end -->
					
	
</body>
</html>























