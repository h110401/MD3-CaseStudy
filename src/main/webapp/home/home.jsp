<%@ page import="rikkei.academy.model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>

    <%--bootstrap--%>
    <jsp:include page="/bootstrap/bootstrap.jsp"></jsp:include>
    <%--bootstrap--%>

    <style>
        .card p {
            font-size: 1.2vw;
        }
    </style>

</head>
<body>

<nav class="navbar navbar-expand-lg" id="navbar" style="background: #eeeeee;">
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
            <ul class="nav justify-content-end align-items-center">
                <li class="nav-item dropdown">
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
                    <div class="input-group">
                        <input id="searchInput" type="text" class="form-control" placeholder="Search something"
                               aria-describedby="basic-addon2">
                        <button type="submit" style="border: 1px solid lightgrey "><i class="bi bi-search"
                                                                                      aria-hidden="true"></i></button>
                    </div>
                </li>
                <c:if test="${sessionScope['userLogin'] == null}">
                    <li class="nav-item">
                        <a type="button" class="btn btn-secondary" id="logIn" href="user?action=login">Log In</a>
                    </li>
                    <li class="nav-item">
                        <a type="button" class="btn btn-dark" id="signUp" href="user?action=register">Sign Up</a>
                    </li>
                </c:if>

                <%--                <li class="nav-item">--%>
                <%--                    <a type="button" class="btn btn-dark" id="logOut" onclick="logOut()" href="index.html">Log Out</a>--%>
                <%--                </li>--%>
            </ul>
        </div>
    </div>


    <c:if test="${sessionScope['role'] == 'pm' || sessionScope['role'] == 'admin'}">
        <a href="manage">
            <button class="btn btn-primary">
                Manager
            </button>
        </a>
    </c:if>

    <c:if test="${sessionScope['userLogin'] != null}">
        <a href="${sessionScope['userLogin'] != null ? "cart" : "user?action=login"}">
            <button id="cartButton" class="btn btn-danger" style="width: 150px; background:#FF6027FF;border: #FF6027FF">
                <span class="bi bi-bag-plus"
                   aria-hidden="true"> Shopping
                    cart</span></button>
        </a>
        <a href="profile">
            <button id="profile" class="btn btn-dark" style="width: 130px;"><span class="bi bi-person-plus-fill"> My Profile</span></button>
        </a>
    </c:if>

</nav>


<div id="intro" style="text-align: center">
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel"
         style="background: #000; color: white">
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


<div style="display: flex; justify-content: center; overflow: hidden;align-items: flex-start;">
    <div style="width: 100%; overflow: hidden; margin-bottom: -150px; margin-top: -100px">
        <video id="background-video" autoplay loop muted poster="https://assets.codepen.io/6093409/river.jpg"
               width="100%">
            <source src="https://download-video.akamaized.net/2/playback/507218a6-2b0e-452a-af80-8a231669e54c/e19b6867-a98d6a59?__token__=st=1665389793~exp=1665404193~acl=%2F2%2Fplayback%2F507218a6-2b0e-452a-af80-8a231669e54c%2Fe19b6867-a98d6a59%2A~hmac=12b8b4ec9aea0a8f1e5730194eb6a2d6d87072b539802928602deddf5e275850&r=dXMtd2VzdDE%3D"
                    type="video/mp4">
        </video>
    </div>
</div>

<div id="container"
     style="
        background: #e0e0e0;
        padding-bottom: 15px;
        border-radius: 0 0 16px 16px;
        -webkit-box-shadow: 0 4px 10px 0 rgba(0,0,0,0.41);
        box-shadow: 0 4px 10px 0 rgba(0,0,0,0.41);
    ">
    <div class="row m-0">
        <div class="col p-0">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/9eb837785beca2565db39881b9b9d69b46a0759e-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="" width="100%">
            <h5 style="text-align: center; margin-top: -10px">Headsets</h5>
        </div>
        <div class="col p-0">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/4605f89b3c559b8aee49d69e8cb4595de8c698e9-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <h5 style="text-align: center; margin-top: -10px">Keyboards</h5>
        </div>
        <div class="col p-0">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/abad9cb541a9415ac93041739e6740b7dad4f511-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <h5 style="text-align: center; margin-top: -10px">Mice and Pads</h5>
        </div>
        <div class="col p-0">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/4b754dc46f6a441cc1319b87b5b8171c40f41167-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <h5 style="text-align: center; margin-top: -10px">PCs and Chairs</h5>
        </div>
        <div class="col p-0">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/249b07dde33b0a77c0d99bd792c4bbeddc0e471e-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <h5 style="text-align: center; margin-top: -10px">Prokit</h5>
        </div>
        <div class="col p-0">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/1e1e44cbe878d8a7bfc52b7991e8344da6685369-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <h5 style="text-align: center; margin-top: -10px">Apparel</h5>
        </div>
        <div class="col p-0">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/a69fff12420a16ec6a3f8c5be97752035b9c7137-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <h5 style="text-align: center; margin-top: -10px">Accessorises</h5>
        </div>
        <div class="col p-0">
            <img class="variety"
                 src="https://cms-cdn.fnatic.com/images/5gii1snx/production/0ab3d301609db4979cb7a9e6315afbe2f825f712-1080x1080.svg?w=1920&h=80&q=100&fit=clip&auto=format"
                 alt="">
            <h5 style="text-align: center; margin-top: -10px">Digital Items</h5>
        </div>
    </div>
</div>


<div style="margin: 15px 0 0 15px" class="container">
    <h4>APPAREL</h4>
    <h6 style="color: grey">Official Fnatic Apparel</h6>
    <br>
    <p id="filters"><i class="bi bi-command"></i> &nbsp Filters</p>
</div>

<%--******************************************************************--%>

<div class="container-fluid">
    <div class="row row-cols-2 row-cols-md-4">
        <c:forEach items="${requestScope['productList']}" var="pr">
            <div class="col">
                <div class="card"
                     style="
                     width: 100%;
                     border-radius: 12px;
                     overflow: hidden;
                     margin-bottom: 20px;
                     -webkit-box-shadow: 0 6px 13px 0 rgba(0,0,0,0.4);
                     box-shadow: 0 6px 13px 0 rgba(0,0,0,0.4);
                    ">
                    <img src="${pr.image}" width="100%"
                         class="img-prd" alt="...">
                    <a href="cart?action=add&id=${pr.id}&qty=1">
                        <button style="display: block;background: #ff6027; border: #ff6027; width: 100%; border-radius: 0 0 8px 8px; color: white; padding: 8px 0">
                            <i class="bi bi-bag-plus"></i></button>
                    </a>
                    <div class="card-body">
                        <p class="content-product-h3">${pr.name}</p>
                        <p class="card-text"><small class="text-muted">${pr.category.categoryName}</small></p>
                        <p class="price"><%=(int)((Product) pageContext.getAttribute("pr")).getPrice()%> €</p>
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
        <div>
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

</body>
</html>
