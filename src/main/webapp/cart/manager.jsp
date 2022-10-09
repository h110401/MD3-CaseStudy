<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/9/2022
  Time: 8:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart Manager</title>
</head>
<body>

<a href="home"><button>Back</button></a>

cart list
<table border="1">
    <c:forEach items="${requestScope['cartList']}" var="cart">
        <tr>
            <td>${cart.id}</td>
            <td>${cart.user.name}</td>
            <td>${cart.getTotal()}</td>
            <td><a href="cart?action=detail&id=${cart.id}"><button>Detail</button></a></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>
