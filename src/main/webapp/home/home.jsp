<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
</head>
<body>

home ${sessionScope['userLOgin'].name} / ${sessionScope['role']}


<c:if test="${sessionScope['role'] == 'pm' || sessionScope['role'] == 'admin'}">
    <div>
        <a href="category">Category Manager</a>
    </div>
    <br>

    <div>
        <a href="product">Product Manager</a>
    </div>
    <br>
</c:if>

<c:if test="${sessionScope['role'] == 'admin'}">
    <div>
        <a href="user">User Manager</a>
    </div>
</c:if>


</body>
</html>
