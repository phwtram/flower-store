<%-- 
    Document   : create
    Created on : Jul 6, 2023, 5:38:45 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Page</title>
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
                                <h1>Signup</h1>
                            </div>
                        </div>
                        <form action="MainController" method="POST" id="register-form" name="registration">
                            <div class="form-group">
                                <label for="exampleInputEmail1">User ID</label>
                                <input type="text" name="userID" class="form-control" aria-describedby="emailHelp"
                                    placeholder="Enter UserID"/>
                                <p class="mess-error">${requestScope.USER_ERROR.userIDError}</p>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Full Name</label>
                                <input type="text" name="fullName" class="form-control" aria-describedby="emailHelp"
                                    placeholder="Enter Full name"/>
                                <p class="mess-error">${requestScope.USER_ERROR.fullNameError}</p>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">RoleID</label>
                                <input type="text" class="form-control" name="roleID" value="US"
                                    readonly />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Password</label>
                                <input type="password" name="password" class="form-control" aria-describedby="emailHelp"
                                    placeholder="Enter Password"/>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Confirm</label>
                                <input type="password" name="confirm" class="form-control" aria-describedby="emailHelp"
                                    placeholder="Confirm Password"/>
                                <p class="mess-error">${requestScope.USER_ERROR.confirmError}</p>
                            </div>
                            <div class="form-group">
                                <div class="capcha">
                                    <div class="captcha" id="html_element"></div>
                                    <div id="error" style="color: red; font-size: 15px;"></div>
                                </div>
                            </div>

                            <p class="mess-error">${requestScope.USER_ERROR.error}</p>
                            <div class="col-md-12 text-center mb-3">
                                <input type="hidden" name="action" value="Create" />
                                <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">CREATE NOW</button>
                            </div>
                            <div class="col-md-12 ">
                                <div class="form-group">
                                    <p class="text-center"><a href="login.html" id="signin">Already have an account?</a>
                                    </p>
                                </div>
                            </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="./assets/js/bootstrap/jquery.min.js"></script>
    <script src="./assets/js/bootstrap/bootstrap.min.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
    <script type="text/javascript" defer="">
        var onloadCallback = function () {
            grecaptcha.render('html_element', {
                'sitekey': '6Ldr5AMnAAAAAG3NWk88u7020rFHibdsFrauf4S1'
            });
        };
    </script>
    <script>
        window.onload = function (){
                        let isValid = false;
            const form = document.getElementById("register-form");
            const error = document.getElementById("error");
            
            form.addEventListener("submit", function (event){
                event.preventDefault();
                const response = grecaptcha.getResponse();
                if (response){
                    form.submit();
                } else {
                    error.innerHTML = "Please check reCAPTCHA.";
                }
            });
        }
    </script>
</body>

</html>
