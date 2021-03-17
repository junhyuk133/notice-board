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
      			<a class="nav-link active" href="login.jsp">Sign in</a>
    		</li>
            <li class="nav-item">
            	<a class="nav-link" href="join.jsp">Sign up</a>
        	</li>
    	</ul>
</nav>
<!-- 로그인 페이지 -->
<main class="form-signin ">
<div class="w-25 mx-auto mt-5">
  <form method="post" action="loginAction.jsp">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
    <label for="inputEmail" class="visually-hidden">ID</label>
    <input type="text" id="inputEmail" class="form-control" placeholder="ID" required autofocus name="userID">
    <label for="inputPassword" class="visually-hidden mt-2">Password</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="userPassword">
    <div class="checkbox mb-3">
      <label class=" mt-2">
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
  </form>
  </div>
</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>