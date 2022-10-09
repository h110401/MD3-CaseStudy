<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>

    <%--bootstrap--%>
    <jsp:include page="/bootstrap/bootstrap.jsp"></jsp:include>
    <%--bootstrap--%>

</head>
<body>

<nav class="navbar navbar-expand-lg" id="navbar">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img id="navbar-image" src="/image/Fnatic_icon.png" alt="" width="30" height="27"
                 class="d-inline-block align-text-top">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <div class="dropdown">
                    <li class="nav-item">
                        <a class="nav-link active" id="esport" aria-current="page">Esports</a>
                    </li>
                </div>
                <div class="dropdown">
                    <li class="nav-item">
                        <a class="nav-link active" id="product" aria-current="page">Product</a>
                    </li>
                </div>
                <div class="dropdown">
                    <li class="nav-item">
                        <a class="nav-link active" id="community" aria-current="page">Community</a>
                    </li>
                </div>
                <div class="dropdown">
                    <li class="nav-item">
                        <a class="nav-link active" id="company" aria-current="page">Company</a>
                    </li>
                </div>
                <div class="dropdown">
                    <li class="nav-item">
                        <a class="nav-link active" id="shop" aria-current="page">Shop</a>
                    </li>
                </div>
            </ul>
            <ul class="nav justify-content-end">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                       id="intl" style="color:black; font-weight: 500">
                        Intl
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" style="font-weight: 500; font-size:15px" href="#">$ United
                            State</a></li>
                        <li><a class="dropdown-item" style="font-weight: 500; font-size:15px" href="#">£ United
                            Kingdom</a></li>
                        <li><a class="dropdown-item" style="font-weight: 500; font-size:15px" href="#">€
                            International</a></li>
                    </ul>
                </li>
                <li>
                    <div class="input-group mb-3">
                        <input id="searchInput" type="text" class="form-control" placeholder="Search something"
                               aria-describedby="basic-addon2" oninput="actionSearch()">
                        <button type="submit" style="border: 1px solid lightgrey "><i class="bi bi-search"
                                                                                      aria-hidden="true"></i></button>
                    </div>
                </li>
                <li class="nav-item">
                    <a type="button" class="btn btn-light" id="logIn" href="user?action=login">Log In</a>
                </li>
                <li class="nav-item">
                    <a type="button" class="btn btn-dark" id="signUp" href="user?action=register">Sign Up</a>
                </li>
                <%--                <li class="nav-item">--%>
                <%--                    <a type="button" class="btn btn-dark" id="logOut" onclick="logOut()" href="index.html">Log Out</a>--%>
                <%--                </li>--%>
            </ul>
        </div>
    </div>

    <!--  Modal -->
    <button id="cartButton">
        <a href="cart"><i class="bi bi-bag-plus" aria-hidden="true">Shopping cart</i></a>

    </button>
    <button id="profile">
        <a href="/profile"><i class="bi bi-person-plus-fill">My Profile</i></a>

    </button>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Your Shopping Cart</h5>
                <span class="close">&times;</span>
            </div>

            <div class="modal-body">
                <div class="cart-row">
                    <span class="cart-item cart-header cart-column">Product</span>
                    <span class="cart-price cart-header cart-column">Price</span>
                    <span class="cart-quantity cart-header cart-column">Quantity</span>
                </div>
                <div class="cart-items">
                    <!--Bỏ trống để lát các sản phẩm nó điền vào-->
                </div>
                <div class="cart-total">
                    <strong class="cart-total-title">Total:</strong>
                    <span class="cart-total-price">0€</span>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary close-footer">Close</button>
                <button type="button" class="btn btn-primary order">Get paid</button>
            </div>
        </div>
    </div>
</nav>


<div id="intro" style="text-align: center">
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" style="padding-top: 5px">
                <h6><i class="bi bi-bell"></i> &nbsp 5 days a week support and live chat!</h6></p>
            </div>
            <div class="carousel-item" style="padding-top: 5px; padding-bottom: 7px">
                <h6><i class="bi bi-truck"></i> &nbsp Fnatic x Champion Collection is now available! Shop now!</h6>
            </div>
            <div class="carousel-item" style="padding-top: 5px; padding-bottom: 7px">
                <h6><i class="bi bi-truck"></i> &nbsp Free shipping within EU, UK & US on all orders over €100 / £100 /
                    $100</h6>
            </div>
        </div>
    </div>
</div>

<div id="productContainer">
    <div class="row">
        <div class="col">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/9eb837785beca2565db39881b9b9d69b46a0759e-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <p style="text-align: center; font-size: 13px">Headsets</p>
        </div>
        <div class="col">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/4605f89b3c559b8aee49d69e8cb4595de8c698e9-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <p style="text-align: center; font-size: 13px">Keyboards</p>
        </div>
        <div class="col">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/abad9cb541a9415ac93041739e6740b7dad4f511-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <p style="text-align: center; font-size: 13px">Mice and Pads</p>
        </div>
        <div class="col">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/4b754dc46f6a441cc1319b87b5b8171c40f41167-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <p style="text-align: center; font-size: 13px">PCs and Chairs</p>
        </div>
        <div class="col">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/249b07dde33b0a77c0d99bd792c4bbeddc0e471e-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <p style="text-align: center; font-size: 13px">Prokit</p>
        </div>
        <div class="col">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/1e1e44cbe878d8a7bfc52b7991e8344da6685369-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <p style="text-align: center; font-size: 13px">Apparel</p>
        </div>
        <div class="col">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/a69fff12420a16ec6a3f8c5be97752035b9c7137-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <p style="text-align: center; font-size: 13px">Accessorises</p>
        </div>
        <div class="col">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/0ab3d301609db4979cb7a9e6315afbe2f825f712-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <p style="text-align: center; font-size: 13px">Digital Items</p>
        </div>
    </div>
</div>

<div style="margin-left: 15px" class="container">
    <p id="apparel">APPAREL</p>
    <h6 style="color: grey">Official Fnatic Apparel</h6>
    <br>
    <p id="filters"><i class="bi bi-command"></i> &nbsp Filters</p>
</div>

<%--******************************************************************--%>
<div class="container-fluid mx-4">
    <div class="row row-cols-2 row-cols-md-4">
        <c:forEach items="${requestScope['productList']}" var="pr">
            <div class="col">
                <div class="card" style="width: 293px">
                    <img src="${pr.image}" width="293" height="250"
                         class="img-prd" alt="...">
                    <a href="cart?action=add&id=${pr.id}&qty=1"><button class="white-text"><i class="bi bi-bag-plus"></i></button></a>
                    <div class="card-body">
                        <p class="content-product-h3">${pr.name}</p>
                        <p class="card-text"><small class="text-muted">${pr.category.categoryName}</small></p>
                        <p class="price">${pr.price}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<footer class="text-center text-lg-start" style="margin-left: -80px">
    <div class="container p-4">
        <img src="/image/Fnatic_blackicon.png" width="50" height="50" style="margin-bottom: 10px; margin-left: -10px"
             alt="">
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                <h5 class="title">About</h5>
                <ul class="list-unstyled">
                    <li>
                        <a href="#!" class="text-reset">Our story</a>
                    </li>
                    <li>
                        <a href="#!" class="text-reset">Carrees</a>
                    </li>
                    <li>
                        <a href="#!" class="text-reset">Brand Guidelines</a>
                    </li>
                    <li>
                        <a href="#!" class="text-reset">Network</a>
                    </li>
                    <li>
                        <a href="#!" class="text-reset">Contact Us</a>
                    </li>
                    <li>
                        <a href="#!" class="text-reset">Wallpapers</a>
                    </li>
                </ul>
            </div>
            <!--Grid column-->

            <div class="col-lg-3 col-md-6 mb-4 mb-md-0" style="margin-left: -50px;">
                <h5 class="title">Shop</h5>
                <ul class="list-unstyled">
                    <li>
                        <a href="#!" class="text-reset">Help</a>
                    </li>
                    <li>
                        <a href="#!" class="text-reset">Downloads</a>
                    </li>
                    <li>
                        <a href="#!" class="text-reset">Shipping</a>
                    </li>
                    <li>
                        <a href="#!" class="text-reset">Return</a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-6 mb-4 mb-md-0" style="margin-left: -60px">
                <h5 class="title">Policies</h5>
                <ul class="list-unstyled">
                    <li>
                        <a href="#!" class="text-reset">All Policies</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div style="margin-left: 100px">
        <div >
            <i class="bi bi-github" id="github"></i>
            <i class="bi bi-discord" id="discord"></i>
            <i class="bi bi-facebook" id="fb"></i>
            <i class="bi bi-tiktok" id="tiktok"></i>
            <i class="bi bi-instagram" id="ins"></i>
            <i class="bi bi-youtube" id="utube"></i>
            <i class="bi bi-twitch" id="twitch"></i>
            <i class="bi bi-twitter" id="twitter"></i>
        </div>
        <br> <br>
        <p id="copyRight">© 2004 - 2022, Fnatic Ltd, All rights reserved</p>
        <br>
    </div>
</footer>



<%--da login--%>
<c:if test="${sessionScope['userLogin'] != null}">
    home ${sessionScope['userLogin'].name} / ${sessionScope['role']}

    <div>
        <a href="/profile">Profile</a>
    </div>

    <div>
        <a href="cart">My Cart</a>
    </div>

    <c:if test="${sessionScope['role'] == 'pm' || sessionScope['role'] == 'admin'}">
        <div>
            <a href="category">Category Manager</a>
        </div>
        <br>

        <div>
            <a href="product">Product Manager</a>
        </div>
        <br>

        <div>
            <a href="#">Cart Manager</a>
        </div>

    </c:if>

    <c:if test="${sessionScope['role'] == 'admin'}">
        <div>
            <a href="user">User Manager</a>
        </div>
    </c:if>
</c:if>
<%--da login--%>

<%--chua login--%>
<%--<c:if test="${sessionScope['userLogin'] == null}">--%>
<%--    <a href="user?action=login">--%>
<%--        <button>Login</button>--%>
<%--    </a>--%>
<%--    <a href="user?action=register">--%>
<%--        <button>Register</button>--%>
<%--    </a>--%>
<%--</c:if>--%>
<%--chua login--%>

<%--<div>--%>
<%--    <table border="1" width="100%">--%>
<%--        <c:forEach items="${requestScope['productList']}" var="pr">--%>
<%--            <tr>--%>
<%--                <td>${pr.name}</td>--%>
<%--                <td>--%>
<%--                    <a href="cart?action=add&id=${pr.id}&qty=1">--%>
<%--                        <button>ADD TO CART</button>--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>
</body>
</html>
