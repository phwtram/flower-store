<%-- 
    Document   : user
    Created on : Jul 4, 2023, 8:59:55 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Page</title>
        <!-- Google font -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Signika:wght@300;400;600&display=swap" rel="stylesheet">
        <!-- boostrap -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/font/css/all.css">
        <link rel="stylesheet" href="./assets/css/styleuser.css">

    </head>

    <body>
        <c:if test="${sessionScope.LOGIN_USER==null }">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        <div class="container-fluid header_main">
            <div class="container-fluid navbar-content">
                <nav class="navbar navbar-expand-lg">
                    <div class="logo col-md-2">
                        <a class="navbar-brand" href="#"><img
                                src="./assets/images/admin/cropped-cropped-2021-FPTU-Long-768x239.png" alt width="100px"></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class="service col-md-7 collapse navbar-collapse" id="navbarSupportedContent">
                        <a class="nav-link active" href="#">User Page</a>


                    </div>
                    <div class="right-nav col-md-2">
                        <div class="account">
                            <div class="logo-admin">
                                <img src="./assets/images/admin/avt-user.png" alt="" width="60px">
                            </div>
                            <div class="admin-text">
                                <p>USER</p>
                                <p>${sessionScope.LOGIN_USER.fullName}</p>
                            </div>
                        </div>
                    </div>
                    <div class="bell col-md-1">
                        <a href="#"><i class="fa-solid fa-bell"></i></a>
                    </div>
                </nav>
            </div>
        </div>

        <div class="body-main">
            <div class="row" style="margin: 0px;">
                <div class="left-bar col-md-2">
                    <div class="service">
                        <ul class="list-service">
                            <a href="#">
                                <li><i class="fa-solid fa-user"></i> Information</li>
                            </a>
                            <a href="MainController?action=Viewcart">
                                <li><i class="fa-solid fa-shopping-cart"></i> My cart </li>
                            </a>
                            <c:url var="logoutLink" value="MainController">
                                <c:param name="action" value="Logout"></c:param>
                            </c:url>
                            <a href="${logoutLink}">
                                <li><i class="fa-solid fa-right-from-bracket"></i> Logout </li>
                            </a>
                        </ul>
                    </div>
                </div>

                <div class="right-bar col-md-10" style="  background-color: #f2f6fa;">
                    <div class="info">
                        <p>Information</p>
                    </div>
                    <div class="user-list">
                        <table class="user-list-table">
                            <form action="">
                                <tr>
                                    <td>User ID:</td>
                                    <td>${sessionScope.LOGIN_USER.userID}</td>
                                </tr>
                                <tr>
                                    <td>Full Name:</td>
                                    <td><input type="text" name="fullName" value="${sessionScope.LOGIN_USER.fullName}" readonly></td>
                                </tr>
                                <tr>
                                    <td>Role ID:</td>
                                    <td>
                                        <input type="text" value="${sessionScope.LOGIN_USER.roleID}" readonly>
                                    </td>
                                </tr>
                                <tr class="password">
                                    <td>Password:</td>
                                    <td>
                                        <input type="password" value="${sessionScope.LOGIN_USER.password}" required="" id="password-text" readonly="">
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input onclick="showPassword()" style="width: auto;" type="checkbox"/> <span style="font-size: 15px;">Show password</span></td>
                                </tr>
                            </form>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="./assets/js/bootstrap/jquery.min.js"></script>
    <script src="./assets/js/bootstrap/popper.min.js"></script>
    <script src="./assets/js/bootstrap/bootstrap.min.js"></script>
    <script>
                                    function showPassword() {
                                        var x = document.getElementById("password-text");
                                        if (x.type === "password") {
                                            x.type = "text";
                                        } else {
                                            x.type = "password";
                                        }
                                    }
    </script>
</body>

</html>

