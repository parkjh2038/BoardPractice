<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="outer">
		<br>
		<h2 align="center">게시판 작성</h2>
		<div class="tableArea">
			<form action="<%=request.getContextPath()%>/insert.bo" method="post">
				<table align="center">
					<tr>
						<td>제목</td>
						<td colspan="3"><input type="text" size="58" name="title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
							<textarea name="content" cols="60" rows="15" style="resize:none;"></textarea>
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							<input type="text" size="20" name="writer">
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset" onclick="location.href='<%=request.getContextPath()%>/selectList.bo'">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
			</form>
		</div>	<!-- tableArea end -->
	</div>	<!-- outer end -->
</body>
</html>























