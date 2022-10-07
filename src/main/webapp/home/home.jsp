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

<%--da login--%>
<c:if test="${sessionScope['userLogin'] != null}">
    home ${sessionScope['userLogin'].name} / ${sessionScope['role']}

    <div>
        <a href="#">Profile</a>
    </div>

    <div>
        <a href="#">My Cart</a>
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
<c:if test="${sessionScope['userLogin'] == null}">
    <a href="user?action=login">
        <button>Login</button>
    </a>
    <a href="user?action=register">
        <button>Register</button>
    </a>
</c:if>
<%--chua login--%>

<div>
    ${requestScope['productList']}
</div>

</body>
</html>
