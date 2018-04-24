<%@ page import="usst.Service.Receptionist.ReceptionistActions" %><%--
  Created by IntelliJ IDEA.
  User: 42519
  Date: 2017/12/26
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <meta charset="utf-8">
    <title>账单</title>

</head>
<body>
<div class="container">
    <div class="receipt">
        <h2 class="receipt__title">感谢您的惠顾！</h2>
        <p class="receipt__subtitle">以下是您的账单，请保存好此票据。</p>
        <ul class="receipt__lines">
            <li class="receipt__line">
                <span class="receipt__line__item">订单号</span>
                <span class="receipt__line__price">${sessionScope.bill_order.order_id}</span>
            </li>
            <li class="receipt__line">
                <span class="receipt__line__item">房型</span>
                <span class="receipt__line__price">${sessionScope.bill_order.roomtype}</span>
            </li>
            <li class="receipt__line">
                <span class="receipt__line__item">时间</span>
                <span class="receipt__line__price">${sessionScope.bill_order.checkin}->${sessionScope.bill_order.checkout}</span>
            </li>
            <li class="receipt__line">
                <span class="receipt__line__item">单价</span>
                <span class="receipt__line__price">${sessionScope.bill_room.price}</span>
            </li>
            <li class="receipt__line">
                <span class="receipt__line__item">入住天数</span>
                <span class="receipt__line__price">${sessionScope.bill_duration}</span>
            </li>
        </ul>
        <p class="receipt__total">
            <span class="receipt__total__item">合计：</span>
            <span class="receipt__total__price">${sessionScope.bill_duration*sessionScope.bill_room.price}元</span>
        </p>
        <p class="receipt__back">
            <a href="checkout_direct.jsp">返回</a>
        </p>
    </div>
</div>
</body>
</html>
