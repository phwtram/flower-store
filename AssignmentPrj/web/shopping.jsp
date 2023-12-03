<%-- 
    Document   : shopping
    Created on : Jul 6, 2023, 6:04:19 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>PhwTram's Mall</title>
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
        <c:import url="header.jsp"></c:import>


            <div class="hero-wrap hero-bread" style="background-image: url('./assets/images/flower-banner.jpg');">
                <div class="container">
                    <div class="row no-gutters slider-text align-items-center justify-content-center">
                        <div class="col-md-9 ftco-animate text-center">
                            <p class="breadcrumbs"><span class="mr-2"><a href="#">Home</a></span> <span>Flowers</span></p>
                            <h1 class="mb-0 bread">Flowers</h1>
                        </div>
                    </div>
                </div>
            </div>

            <section class="ftco-section">
                <div class="container">
                    <div class="row justify-content-center">

                        <div class="col-md-10 mb-5 text-center">
                            <ul class="product-category">
                                <li><a href="#" class="active">All</a></li>
                                <li><a href="#">Birthday</a></li>
                                <li><a href="#">Party</a></li>
                                <li><a href="#">Wedding</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">

                    <c:if test="${requestScope.listP != null}">
                        <c:if test="${not empty requestScope.listP}">
                            <c:forEach var="pro" items="${requestScope.listP}">
                                <div class="col-md-6 col-lg-3 ftco-animate">
                                    <div class="product">
                                        <a href="#" class="img-prod">
                                            <img class="img-fluid"  src="./assets/images/${pro.img}"alt="Colorlib Template">
                                            <div class="overlay"></div>
                                        </a>
                                        <div class="text py-3 pb-4 px-3 text-center">
                                            <h3><a href="#">${pro.name}</a></h3>
                                            <div class="d-flex">
                                                <div class="pricing">
                                                    <p class="price"><span class="price-sale">${pro.price} $</span></p>
                                                </div>
                                            </div>
                                            <div class="bottom-area d-flex px-3">
                                                <div class="m-auto d-flex">
                                                    <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                                        <span><i class="fa-solid fa-bars"></i></span>
                                                    </a>
                                                    <a href="MainController?action=Addtocart&productID=${pro.productID}" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                                        <span><i class="fa-solid fa-shopping-cart"></i></span>
                                                    </a>
                                                    <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                                        <span><i class="fa-solid fa-heart"></i></span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:if>
                    <c:if test="${requestScope.listP == null}">
                        <h3 style="color: red">Sold Out.</h3>
                    </c:if>


                    <div class="col-md-12">
                        <h4 style="color: red">${requestScope.MESSAGE}</h4>

                    </div>

                </div>

            </div>
        </section>
        <c:import url="footer.jsp"></c:import>




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

    </body>

</html>
