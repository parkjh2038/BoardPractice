<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jsp.board.model.vo.*"%>
<% Board b = (Board) request.getAttribute("b"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 - <%= b.getbTitle() %></title>
<style>
<%@ include file="/css/boardStyle.css" %>
</style>
</head>
<body>
<div class="outer">
		<br>
		<div class="tableArea">
			<form action="<%=request.getContextPath()%>/delete.bo" method="post">
				<table align="center" width="900px">
					<tr>
						<td>
							<div class="bTitle">
								<label><%= b.getbTitle() %></label>
								<input type="hidden" name="bid" value="<%= b.getBid() %>">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="bWriter">
								<label>작성자 : <%= b.getbWriter() %></label>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="bContent">
								<textarea id="content" cols="110" rows="20" readonly><%= b.getbContent() %></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="bDate">
								<label>작성일 : <%= b.getbDate() %> / 수정일 : <%= b.getModifyDate() %></label>
							</div>
						</td>
					</tr>
				</table>
				<br>
				<table class="ReadBtnForm" align="center">
					<tr>
						<td>
							<button type="reset" onclick="location.href='<%=request.getContextPath()%>/selectList.bo'">뒤로</button>
						</td>
						<td align="right">
							<button type="submit">삭제</button>
							<button type="button" onclick="location.href='<%=request.getContextPath()%>/select.bo?num=<%=b.getBid()%>'">수정하기</button>
						</td>				
					</tr>
				</table>
			</form>
		</div>	<!-- tableArea end -->
	</div>	<!-- outer end -->
</body>
</html>