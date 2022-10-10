<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/9/2022
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>History</title>
</head>
<body>
<a href="cart">Back</a>
<div>
    Waiting
    <table>
        <c:forEach items="${requestScope['orderedCarts']}" var="cart">
            <tr>
                <td>${cart.id}</td>
                <td>${cart.created}</td>
                <td>
                    <a href="cart?action=remove-cart&id=${cart.id}">
                        <button>Retrieve</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<div>
    History
    <table>
        <c:forEach items="${requestScope['confirmedCarts']}" var="cart">
            <tr>
                <td>${cart.id}</td>
                <td>${cart.changed}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<div>
    Cancelled
    <table>
        <c:forEach items="${requestScope['cancelledCarts']}" var="cart">
            <tr>
                <td>${cart.id}</td>
                <td>${cart.changed}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
