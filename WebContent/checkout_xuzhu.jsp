<%--
  Created by IntelliJ IDEA.
  User: 42519
  Date: 2017/12/28
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all">
</head>
<body>
<div class="layui-row">
    <div class="layui-xs12">
        <blockquote class="layui-elem-quote" style="font-size: 50px">续住成功</blockquote>
    </div>
</div>
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>订单号</th>
            <th>身份证</th>
            <th>顾客姓名</th>
            <th>入住时间</th>
            <th>离店时间</th>
            <th>房间号</th>
            <th>顾客偏好</th>
            <th>房间类型</th>
            <th>订单状态</th>
            <th>续住天数</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <td>${requestScope.order.order_id}</td>
                <td>${requestScope.order.idcard}</td>
                <td>${requestScope.order.customerName}</td>
                <td>${requestScope.order.checkin}</td>
                <td>${requestScope.order.checkout}</td>
                <td>${requestScope.order.room_id}</td>
                <td>${requestScope.order.requirement}</td>
                <td>${requestScope.order.roomtype}</td>
                <td>
                    <c:if test="${order.processed eq 0}">
                        未处理
                    </c:if>
                    <c:if test="${order.processed eq 1}">
                        已处理
                </c:if></td>
                <td>${requestScope.day}</td>
            </tr>
        </tbody>
    </table>
<a href="checkin_SearchOrder.jsp"> <button class="layui-btn layui-btn-normal" type="button">返回</button></a>
</body>
</html>
