<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<title>BBS</title>
</head>
<body>
<%
	String userID=null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
%>
<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark ">
	  <!-- Brand/logo -->
	  <a class="navbar-brand ms-3" href="main.jsp">BBS</a>
	  <!-- Links -->
	  <ul class="nav navbar-nav navbar-left">
	    <li class="nav-item">
	      <a class="nav-link active" href="main.jsp">Home</a>
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
<main class="container">

  <div class="starter-template text-center py-5 px-3">
    <h1>First Project. Board Page</h1>
    <p class="lead">JSP 게시판.<br>안농<br></p>
    <a class="btn btn-primary" href="board.jsp">게시판 들어가기</a>
  </div>

</main><!-- /.container -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>