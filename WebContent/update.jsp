<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<title>BBS</title>
<style>
	tbody tr td:nth-child(2){text-align: left;}
</style>
</head>
<body>
<%
	String userID=null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	}
%>
<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark ">
	  <!-- Brand/logo -->
	  <a class="navbar-brand ms-3" href="main.jsp">BBS</a>
	  <!-- Links -->
	  <ul class="nav navbar-nav navbar-left">
	    <li class="nav-item">
	      <a class="nav-link" href="main.jsp">Home</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="board.jsp">Borad</a>
	    </li>
	    </ul>
     	<ul class="nav navbar-nav ms-auto me-3">
            <li class="nav-item">
            	<a class="nav-link" href="logoutAction.jsp">Logout</a>
        	</li>
    	</ul>
</nav>
<!-- 로그인 페이지 -->
<div class=container>
<h2>글 작성하기</h2>
	<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">Title</label>
		  <input type="text" class="form-control" id="exampleFormControlInput1" name="bbsTitle" value="<%= bbs.getBbsTitle() %>">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">Content</label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" style="height:300px" name="bbsContent"><%= bbs.getBbsContent() %></textarea>
		</div>
		<button class="btn btn-dark btn-sm float-end">수정하기</button>
	</form>
</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>