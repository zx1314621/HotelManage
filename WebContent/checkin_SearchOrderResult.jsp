<%--
  Created by IntelliJ IDEA.
  User: 42519
  Date: 2017/12/29
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Table</title>
    <link rel="stylesheet" href="layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/table.css" />
    <link rel="stylesheet" href="css/global.css">
    <style>
        .kit-search-inputs {
            position: absolute;
            right: 70px;
            top: 0;
            padding: 10px 25px 10px 10px;
        }

        .kit-search-inputs .kit-search-keyword {
            margin-right: 10px;
            position: relative;
        }

        .kit-search-inputs .kit-search-more {
            cursor: pointer;
            color: #009688;
            position: absolute;
            top: 15px;
            right: -50px;
        }

        .kit-search-inputs .kit-search-keyword input {
            height: 30px;
            line-height: 30px;
            width: 200px;
            padding-right: 32px;
        }

        .kit-search-inputs .kit-search-keyword button {
            position: absolute;
            right: 0;
            top: 0;
            width: 30px;
            height: 30px;
            border: 0;
            cursor: pointer;
            background-color: #009688;
            color: white;
        }
    </style>
</head>

<body>
<div class="admin-main">

    <blockquote class="layui-elem-quote">
        <div class="kit-search-inputs">
            <div class="kit-search-keyword">
                <form action="searchorder.do" method="post">
                    <input type="text" class="layui-input" name="idcard" placeholder="输入身份证以搜索订单" />
                    <button lay-submit type="submit"><i class="layui-icon">&#xe615;</i></button>
                </form>
            </div>
        </div>
    </blockquote>
    <fieldset class="layui-elem-field">
        <form action="process_order.do" method="post">
            <legend>订单表</legend>
            <div class="layui-field-box layui-form">
                <table class="layui-table admin-table">
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
                            <td><c:if test="${order.processed eq 0}">
                                待处理
                            </c:if>
                                <c:if test="${order.processed eq 1}">
                                    正在入住
                                </c:if>
                                <c:if test="${order.processed eq 2}">
                                    订单完成
                                </c:if>
                                <c:if test="${order.processed eq 3}">
                                    已完成评价
                                </c:if></td>
                            <td>
                                <button class="layui-btn layui-btn-normal layui-btn-xs" type="submit" name="chakan" value="${order.order_id}">查看</button>
                                <c:if test="${order.processed eq 0}">
                                    <button class="layui-btn layui-btn-xs" name="order_id" value="${order.order_id}">排房</button>
                                </c:if>
                                <c:if test="${order.processed eq 1}">
                                    <button class="layui-btn layui-btn-xs layui-btn-disabled"   disabled="disabled">排房</button>
                                </c:if>
                                <c:if test="${order.processed eq 2}">
                                    <button class="layui-btn layui-btn-xs layui-btn-disabled"   disabled="disabled">排房</button>
                                </c:if>
                                <c:if test="${order.processed eq 3}">
                                    <button class="layui-btn layui-btn-xs layui-btn-disabled"   disabled="disabled">排房</button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </form>
    </fieldset>
    <div class="admin-table-page">
        <div id="paged" class="page">
        </div>
    </div>
</div>

<script src="plugins/layui/layui.all.js"></script>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
<%
    Object message = session.getAttribute("noorder_message");
    if(message!=null && !"".equals(message)){

%>
<script type="text/javascript">
    alert("<%=message%>");
</script>
<%}
    session.setAttribute("noorder_message",null);
%>
<%
    String flag=(String) session.getAttribute("chakan_bill_flag");
    if (flag!=null&&flag.length()>0&&flag.equals("1")){
%>
<script type="text/javascript">
    window.onload=function(){
        bill(); }
</script>
<%
        session.setAttribute("chakan_bill_flag",null);
    }
%>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
    function bill() {
        //iframe层
        layer.open({
            type: 2,
            title: '订单详情',
            shadeClose: true,
            shade: 0.8,
            area: ['380px', '95%'],
            content: 'chakan_bill.jsp' //iframe的url
        });
    }
</script>
</body>

</html>