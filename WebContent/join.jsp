<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<title>BBS</title>

</head>
<body>
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
      			<a class="nav-link" href="login.jsp">Sign in</a>
    		</li>
            <li class="nav-item">
            	<a class="nav-link active" href="join.jsp">Sign up</a>
        	</li>
    	</ul>
</nav>
<!-- 로그인 페이지 -->
<main class="form-signin ">
<div class="w-25 mx-auto mt-5">
  <form method="post" action="joinAction.jsp">
    <h1 class="h3 mb-3 fw-normal ">Sign up</h1>
    <input type="text" class="form-control mt-2" placeholder="ID" required autofocus name="userID">
    <input type="password" class="form-control mt-2" placeholder="Password" required name="userPassword">
    <input type="text"class="form-control mt-2" placeholder="Name" required name="userName">
    <input type="email" class="form-control mt-2" placeholder="Email" required name="userEmail">
    <div class="btn-group container mt-2" role="group" aria-label="Basic radio toggle button group">
	  <input type="radio" class="btn-check" name="userGender" id="btnradio1" autocomplete="off" value="남자" checked>
	  <label class="btn btn-outline-primary" for="btnradio1">남자</label>
	
	  <input type="radio" class="btn-check" name="userGender" id="btnradio2" autocomplete="off" value="여자" >
	  <label class="btn btn-outline-primary" for="btnradio2">여자</label>
	</div>
    <button class="w-100 btn btn-lg btn-primary mt-3" type="submit">Sign in</button>
  </form>
  </div>
</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>