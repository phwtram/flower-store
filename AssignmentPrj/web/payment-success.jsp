<%-- 
    Document   : payment-success
    Created on : Jul 7, 2023, 9:09:16 PM
    Author     : ACER
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Checkout</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="./assets/css/shop/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/shop/animate.css">

    <link rel="stylesheet" href="./assets/css/shop/owl.carousel.min.css">
    <link rel="stylesheet" href="./assets/css/shop/owl.theme.default.min.css">
    <link rel="stylesheet" href="./assets/css/shop/magnific-popup.css">
    <link rel="stylesheet" href="./assets/css/font/css/all.css">

    <link rel="stylesheet" href="./assets/css/shop/aos.css">
    <link rel="stylesheet" href="./assets/css/styleshopping.css">
    <link rel="stylesheet" href="./assets/css/stylepayment.css">
</head>

<body class="goto-here">


    <div class="hero-wrap hero-bread" style="background-image: url('./assets/images/flower-banner.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="#">Home</a></span> <span>Checkout</span></p>
                    <h1 class="mb-0 bread">Checkout</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                
                <div class="col-md-6 order">
                    <div class="text-center">
                        <img src="./assets/images/check-success.png" alt="" width="150px">
                    </div>
                    <div>
                        <h4>Thank you for your purchase!</h4>
                    </div>
                    <div class="table-order">
                        <table>
                            <tr>
                                <th>Amout paid: </th>
                                <td>${requestScope.ORDER.total} $</td>
                            </tr>
                            <tr>
                                <th>Payment method: </th>
                                <td>COD</td>
                            </tr>
                            <tr>
                                <th>Order date: </th>
                                <td>
                                    <fmt:formatDate value="${requestScope.ORDER.date}" pattern="dd/MM/yyyy HH:mm:ss" var="formattedDate" />
                                    ${formattedDate}
                                </td>
                            </tr>
                            <tr>
                                <th>User: </th>
                                <td>${sessionScope.LOGIN_USER.fullName}</td>
                            </tr>
                            <tr>
                                <th>User ID: </th>
                                <td>${sessionScope.LOGIN_USER.userID}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="mt-3">
                        <a href="MainController?action=Shopping">Back to Shopping Page</a>
                    </div>
                </div>
            </div>
        </div>
    </section> <!-- .section -->





    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00" />
        </svg></div>


    <script src="./assets/js/shop/jquery.min.js"></script>
    <script src="./assets/js/shop/jquery-migrate-3.0.1.min.js"></script>
    <script src="./assets/js/shop/popper.min.js"></script>
    <script src="./assets/js/shop/bootstrap.min.js"></script>
    <script src="./assets/js/shop/jquery.easing.1.3.js"></script>
    <script src="./assets/js/shop/jquery.waypoints.min.js"></script>
    <script src="./assets/js/shop/jquery.stellar.min.js"></script>
    <script src="./assets/js/shop/owl.carousel.min.js"></script>
    <script src="./assets/js/shop/jquery.magnific-popup.min.js"></script>
    <script src="./assets/js/shop/aos.js"></script>
    <script src="./assets/js/shop/jquery.animateNumber.min.js"></script>
    <script src="./assets/js/shop/scrollax.min.js"></script>
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="./assets/js/shop/google-map.js"></script>
    <script src="./assets/js/shop/main.js"></script>
    <script>
        $(document).ready(function () {

            var quantitiy = 0;
            $('.quantity-right-plus').click(function (e) {

                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                var quantity = parseInt($('#quantity').val());

                // If is not undefined

                $('#quantity').val(quantity + 1);


                // Increment

            });

            $('.quantity-left-minus').click(function (e) {
                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                var quantity = parseInt($('#quantity').val());

                // If is not undefined

                // Increment
                if (quantity > 0) {
                    $('#quantity').val(quantity - 1);
                }
            });

        });
    </script>

</body>

</html>
