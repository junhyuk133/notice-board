<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
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
	
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
	      <a class="nav-link active" href="board.jsp">Borad</a>
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
	  <thead>
	    <tr >
	      <th scope="col">#</th>
	      <th scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">작성일</th>
	    </tr>
	  </thead>
	  <tbody>
	  <%
	  	BbsDAO bbsDAO =new BbsDAO();
	  	ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
	  	for(int i=0; i<list.size(); i++){
	  %>
	    <tr>
	      <th scope="row"><%= list.get(i).getBbsID() %></th>
	      <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
	      <td><%= list.get(i).getUserID() %></td>
	      <td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13)+"시 "+list.get(i).getBbsDate().substring(14,16)+"분" %></td>
	    </tr>
	   <%
	  	}
	   %>
	  </tbody>
	</table>
	<%
		if(pageNumber != 1){
	%>
		<a href="board.jsp?pageNumber=<%= pageNumber -1 %>" class="btn btn-success btn-arrow-left btn-sm">이전</a>
	<%
		}if(bbsDAO.nextPage(pageNumber + 1)){	
	%>
		<a href="board.jsp?pageNumber=<%= pageNumber +1 %>" class="btn btn-success btn-arrow-right btn-sm">다음</a>
	<%
		}
	%>
	<a href='write.jsp' class="float-end">
		<button class="btn btn-dark btn-sm">글 쓰기</button>
	</a>
</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>