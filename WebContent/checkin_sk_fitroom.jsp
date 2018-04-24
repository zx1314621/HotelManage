<%--
  Created by IntelliJ IDEA.
  User: 42519
  Date: 2018/1/4
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
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
        </div>
    </blockquote>
    <fieldset class="layui-elem-field">
        <form action="skassignroom.do" method="post">
            <legend>可用房</legend>
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>房间号</th>
                    <th>房型</th>
                    <th>朝向</th>
                    <th>楼层</th>
                    <th>价格</th>
                    <th>订单数量</th>
                    <th>选择</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="room" items="${requestScope.fitroom}">
                    <tr>
                        <td>${room.room_id}</td>
                        <td>${room.roomtype}</td>
                        <td>${room.orientation}</td>
                        <td>${room.floor}</td>
                        <td>${room.price}</td>
                        <td>${room.orderNum}</td>
                        <td>
                            <button class="layui-btn layui-btn-xs " name="room_id" value="${room.room_id}" >分配</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
    </fieldset>
    <div class="admin-table-page">
        <div id="paged" class="page">
        </div>
    </div>
</div>

<script type="text/javascript" src="plugins/layui/layui.all.js"></script>
<%
    String flag=(String) session.getAttribute("skassignroom_flag");
    if (flag!=null&&flag.length()>0&&flag.equals("1")){
%>
<script type="text/javascript">
    window.onload=function(){
        success(); }
</script>
<%
    session.setAttribute("skassignroom_flag",null);
%>
<a href="checkin_SearchOrder.jsp"> <button class="layui-btn layui-btn-normal" type="button">返回上一级</button></a>
<%
}
else if(flag!=null&&flag.length()>0&&flag.equals("0")){
%>
<script type="text/javascript">
    window.onload=function(){
        fail(); };
</script>
<%session.setAttribute("skassignroom_flag",null);
}
%>
<script>
    function fail() {
        layer.alert('分房失败', {
            icon: 2,
            skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
        });
    }
    function success() {
        layer.alert('分房成功！', {
            icon: 1,
            skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
        });
    }
</script>
</body>
</html>