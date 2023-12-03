<%-- 
    Document   : viewcart
    Created on : Jul 6, 2023, 8:54:58 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>My cart</title>
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
                            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span></p>
                            <h1 class="mb-0 bread">My Cart</h1>
                        </div>
                    </div>
                </div>
            </div>

        <c:if test="${empty sessionScope.CART.cart}">
            <div class="container">
                <div class="text-center mt-3">
                    <img src="./assets/images/cart-empty.png" alt="" width="500px">
                    <h4>Your cart is empty</h4>
                    <h5><a href="MainController?action=Shopping">Shopping now</a></h5>
                </div>
            </div> 
        </c:if>

                

        <section class="ftco-section ftco-cart">
            <div class="container">
                <div class="row">
                    <c:if test="${sessionScope.CART != null}">
                        <c:if test="${not empty sessionScope.CART.cart}">
                            <div class="col-md-12 ftco-animate">
                                <div class="cart-list">
                                    <table class="table">
                                        <thead class="thead-primary">
                                            <tr class="text-center">
                                                <th>Remove</th>
                                                <th>&nbsp;</th>
                                                <th>Product name</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Edit</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="entry" varStatus="counter" items="${sessionScope.CART.cart}">
                                                <c:set scope="request" var="total" value="${requestScope.total + entry.value.quantity * entry.value.price}"></c:set>
                                                    <tr class="text-center">
                                                        <td class="product-remove"><a href="MainController?action=Remove&productID=${entry.value.productID}"><span class="fa-solid fa-close"></span></a>
                                                    </td>

                                                    <td class="image-prod">
                                                        <div class="img" style="background-image:url(./assets/images/${entry.value.img});">
                                                        </div>
                                                    </td>

                                                    <td class="product-name">
                                                        <h3>${entry.value.name}</h3>
                                                    </td>

                                                    <td class="price">${entry.value.price} $</td>
                                            <form action="">
                                                <td class="quantity">
                                                    <div class="input-group mb-3">
                                                        <input type="number" name="quantity"
                                                               class="quantity form-control input-number" value="${entry.value.quantity}" min="1"
                                                               max="100">
                                                    </div>
                                                </td>
                                                <td class="product-edit">
                                                    <input type="hidden" name="productID" value="${entry.value.productID}"/>
                                                    <input type="submit" name="action" value="Edit" />
                                                </td>
                                            </form>
                                            <td class="total">${entry.value.quantity*entry.value.price} $</td>
                                            </tr><!-- END TR-->
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <p style="color: red">${requestScope.MESSAGE}</p>
                            </div>
                        </div>
                        <div class="row justify-content-end">
                            <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
                                <div class="cart-total mb-3">
                                    <h3>Coupon Code</h3>
                                    <p>Enter your coupon code if you have one</p>
                                    <form action="#" class="info">
                                        <div class="form-group">
                                            <label for="">Coupon code</label>
                                            <input type="text" class="form-control text-left px-3" placeholder="" readonly>
                                        </div>
                                    </form>
                                </div>
                                <p><a href="checkout.html" class="btn btn-primary py-3 px-4 disabled">Apply Coupon</a></p>
                            </div>
                            <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
                                <div class="cart-total mb-3">
                                    <h3>Estimate shipping and tax</h3>
                                    <p>Enter your destination to get a shipping estimate</p>
                                    <form action="#" class="info">
                                        <div class="form-group">
                                            <label for="">Country</label>
                                            <input type="text" class="form-control text-left px-3" placeholder="" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="country">State/Province</label>
                                            <input type="text" class="form-control text-left px-3" placeholder="" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="country">Zip/Postal Code</label>
                                            <input type="text" class="form-control text-left px-3" placeholder="" readonly>
                                        </div>
                                    </form>
                                </div>
                                <p><a href="checkout.html" class="btn btn-primary py-3 px-4 disabled">Estimate</a></p>
                            </div>
                            <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
                                <div class="cart-total mb-3">
                                    <h3>Cart Totals</h3>
                                    <p class="d-flex">
                                        <span>Subtotal</span>
                                        <span>${requestScope.total} $</span>
                                    </p>
                                    <p class="d-flex">
                                        <span>Delivery</span>
                                        <span>0.00 $</span>
                                    </p>
                                    <p class="d-flex">
                                        <span>Discount</span>
                                        <span>0.00 $</span>
                                    </p>
                                    <hr>
                                    <p class="d-flex total-price">
                                        <span>Total</span>
                                        <span>${requestScope.total} $</span>
                                    </p>
                                </div>
                                <p><a href="MainController?action=Checkout" class="btn btn-primary py-3 px-4">Proceed to Checkout</a></p>
                            </div>
                        </div>
                    </div>
                </section>
            </c:if>
        </c:if>
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
