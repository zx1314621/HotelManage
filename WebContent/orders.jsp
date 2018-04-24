<%--
  Created by IntelliJ IDEA.
  User: 42519
  Date: 2017/12/25
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
</head>
<body>
<form action="process_order.do" method="post">
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>订单号</th>
            <th>顾客姓名</th>
            <th>身份证号</th>
            <th>房型</th>
            <th>房间号</th>
            <th>入住</th>
            <th>离店</th>
            <th>顾客偏好</th>
            <th>订单状态</th>
            <th>处理</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${requestScope.order}">
        <tr>
            <td>${order.order_id}</td>
            <td>${order.customerName}</td>
            <td>${order.idcard}</td>
            <td>${order.roomtype}</td>
            <td>${order.room_id}</td>
            <td>${order.checkin}</td>
            <td>${order.checkout}</td>
            <td>${order.requirement}</td>
            <td>${order.processed}</td>
            <td><c:if test="${order.processed eq 0}">
                <button type="submit" name="order_id" value="${order.order_id}">处理</button>
            </c:if></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
</body>
</html>

