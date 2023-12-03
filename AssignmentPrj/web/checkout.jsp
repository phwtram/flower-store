<%-- 
    Document   : checkout
    Created on : Jul 7, 2023, 8:33:34 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    <c:if test="${sessionScope.LOGIN_USER == null}">
        <div class="container">
                <div class="text-center mt-3">
                    <img src="./assets/images/cart-empty.png" alt="" width="500px">
                    <h4>You must Login before checkout</h4>
                    <h5><a href="MainController">Login</a></h5>
                </div>
            </div> 
    </c:if>
    
    <c:if test="${sessionScope.LOGIN_USER != null}">
        


    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 ftco-animate">
                    <form action="#" class="billing-form">
                        <h3 class="mb-4 billing-heading">Billing Details</h3>
                        <div class="row align-items-end">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="firstname">Full Name</label>
                                    <input style="color: black !important" type="text" class="form-control" placeholder="" value="${sessionScope.LOGIN_USER.fullName}" readonly>
                                </div>
                            </div>
                            
                            <div class="w-100"></div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="streetaddress">User ID</label>
                                    <input style="color: black !important" type="text" class="form-control" placeholder="" value="${sessionScope.LOGIN_USER.userID}" readonly>
                                </div>
                            </div>
                            
                            <div class="w-100"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="towncity">Town / City</label>
                                    <input type="text" class="form-control" placeholder="" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="postcodezip">Postcode / ZIP *</label>
                                    <input type="text" class="form-control" placeholder="" readonly>
                                </div>
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="text" class="form-control" placeholder="" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="emailaddress">Email Address</label>
                                    <input type="text" class="form-control" placeholder="" readonly>
                                </div>
                            </div>
                            <div class="w-100"></div>
                            
                        </div>
                    </form><!-- END -->
                </div>
                
                
                <div class="col-xl-5">
                    <div class="row mt-5 pt-3">
                        <div class="col-md-12 d-flex mb-5">
                            <div class="cart-detail cart-total p-3 p-md-4">
                                <h3 class="billing-heading mb-4">Cart Total</h3>
                                <p class="d-flex">
                                    <span>Subtotal</span>
                                    <span>${sessionScope.TOTAL} $</span>
                                </p>
                                <p class="d-flex">
                                    <span>Delivery</span>
                                    <span>0.00 $</span>
                                </p>
                                <hr>
                                <p class="d-flex total-price">
                                    <span>Total</span>
                                    <span>${sessionScope.TOTAL} $</span>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <form action="MainController" method="POST">
                            
                            <div class="cart-detail p-3 p-md-4">
                                <h3 class="billing-heading mb-4">Payment Method</h3>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="radio">
                                            <label><input type="radio" name="optradio" class="mr-2" required=""> COD</label>
                                        </div>
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="checkbox">
                                            <label><input type="checkbox" value="" class="mr-2" required=""> I have read and accept
                                                the terms and conditions</label>
                                        </div>
                                    </div>
                                </div>
                                <!--<p><a href="MainController?action=Payment" class="btn btn-primary py-3 px-4">Place an order</a></p>-->
                                <input type="submit" name="action" value="Payment"/>
                            </div>
                                </form>
                        </div>
                    </div>
                </div> <!-- .col-md-8 -->
                
            </div>
        </div>
    </section> <!-- .section -->

    </c:if>



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
    <script src="./assets/js/shop/bootstrap-datepicker.js"></script>
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