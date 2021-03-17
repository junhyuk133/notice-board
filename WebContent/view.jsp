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
	  
	     <%
	  	if(userID == null){
	  %>
	    <ul class="nav navbar-nav ms-auto me-3">
    		<li class="nav-item">
      			<a class="nav-link" href="login.jsp">Sign in</a>
    		</li>
            <li class="nav-item">
            	<a class="nav-link" href="join.jsp">Sign up</a>
        	</li>
    	</ul>
    <% 
	  	}else{
    %>
     	<ul class="nav navbar-nav ms-auto me-3">
            <li class="nav-item">
            	<a class="nav-link" href="logoutAction.jsp">Logout</a>
        	</li>
    	</ul>
    <%
	  	}
    %>
</nav>
<!-- 로그인 페이지 -->
<div class=container>
	<table class="table mt-3 container" style="text-align:center">
	  <tbody>
	  	<tr>
	  		<td style="width: 20%">글 제목</td>
	  		<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ","&nbsp").replaceAll("<","&lt").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
	  	</tr>
	  	<tr>
	  		<td>작성자</td>
	  		<td colsapn"2"><%= bbs.getUserID() %></td>
	  	</tr>
	  	<tr>
	  		<td>작성일자</td>
	  		<td colspan="2"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13)+"시 "+bbs.getBbsDate().substring(14,16)+"분" %></td>
	  	</tr>
	  	<tr>
	  		<td>내용</td>
	  		<td colsapn="2" style="height: 300px; text-align: left"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp").replaceAll("<","&lt").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
	  	</tr>
	  </tbody>
	</table>
	<div class="float-end">
	<%
		if(userID != null && userID.equals(bbs.getUserID())){
	%>
		<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary btn-sm">수정하기</a>
		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-danger btn-sm">삭제하기</a>
		<a href="board.jsp" class="btn btn-dark btn-sm">글 목록</a>
	<% 
		}else{
	%>
		<a href="board.jsp" class="btn btn-dark btn-sm">글 목록</a>
	<%
		}
	%>
	</div>
</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>