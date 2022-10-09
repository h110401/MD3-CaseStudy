<%@ page import="rikkei.academy.model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/8/2022
  Time: 12:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
</head>
<body>

<a href="home">Back</a>
<table border="1" width="100%">
    <tr>
        <th>Image</th>
        <th>Name</th>
        <th>Price</th>
        <th>Quantity</th>
    </tr>
    <c:forEach items="${requestScope['cart'].products}" var="pr">

        <tr>

            <td width="200">
                <img src="${pr.image}" alt="img" width="200" height="200">
            </td>

            <td>${pr.name}</td>

            <td>${pr.price}</td>

            <td>${pr.quantity}</td>

            <td>
                <a href="cart?action=remove&id=${pr.id}">
                    <button>Remove</button>
                </a>
            </td>

        </tr>
    </c:forEach>
</table>

<div>
    Total: ${requestScope['cart'].getTotal()}
</div>

<a href="cart?action=order"><button><i class="bi bi-person-plus-fill">Order</i></button></a><br><br>
<a href="cart?action=history"><button><i class="bi bi-person-plus-fill">History</i></button></a><br><br>


</body>
</html>
