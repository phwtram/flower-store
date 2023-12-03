<%-- 
    Document   : login
    Created on : Jul 4, 2023, 8:09:02 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/stylelogin.css">
</head>
<body>
    <div class="container">
        <div class="row">
			<div class="col-md-5 mx-auto">
			<div>
				<div class="myform form ">
					 <div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<h1>Login</h1>
						 </div>
					</div>
                   <form action="MainController" method="post" name="login">
                           <div class="form-group">
                              <label for="exampleInputEmail1">User ID</label>
                              <input type="text" name="userID"  class="form-control" aria-describedby="emailHelp" placeholder="Enter UserID">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">Password</label>
                              <input type="password" name="password" class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                           </div>
                       <p class="mess-error">${requestScope.ERROR}</p>
                           <div class="form-group">
                              <p class="text-center">By signing up you accept our <a href="#">Terms Of Use</a></p>
                           </div>
                           <div class="col-md-12 text-center ">
                               <input type="hidden" name="action" value="Login">
                              <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
                           </div>
                           <div class="col-md-12 ">
                              <div class="login-or">
                                 <hr class="hr-or">
                                 <span class="span-or">or</span>
                              </div>
                           </div>
                           <div class="col-md-12 mb-3">
                              <p class="text-center">
                                 <a href="MainController?action=Shopping" class=""><i class=""></i> Shopping now </a>
                              </p>
                           </div>
                           <div class="form-group">
                              <p class="text-center">Don't have account? <a href="create.html">Sign up here</a></p>
                           </div>
                        </form>
                 
				</div>
			</div>
		</div>
      </div>
      <script src="./assets/js/bootstrap/jquery.min.js"></script>
      <script src="./assets/js/bootstrap/bootstrap.min.js"></script>
</body>
</html>