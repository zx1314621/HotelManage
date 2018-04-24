<%@ page import="java.util.ArrayList" %>
<%@ page import="usst.model.Room" %>
<%@ page import="usst.Dao.RoomDao" %>
<%@ page import="javax.sql.DataSource" %><%--
  Created by IntelliJ IDEA.
  User: 42519
  Date: 2017/12/26
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="src/css/main.css?v2.0.1-simple" media="all">
    <%
        RoomDao roomDao=new RoomDao((DataSource)application.getAttribute("dataSource"));
        ArrayList<Room> allroom=roomDao.getAllRoom();
        request.setAttribute("allroom",allroom);
    %>
</head>
<body>
<div class="layui-row">
    <div class="layui-xs12">
        <blockquote class="layui-elem-quote" style="font-size: 50px">续住</blockquote>
    </div>
</div>
<form class="layui-form" action="checkout.do" method="post">
    <div style="width: 400px;">
        <div class="layui-form-item" pane>
            <label class="layui-form-label">订单号</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" readonly="readonly" name="order_id" value="${requestScope.xuzhu_order.order_id}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label">房间号</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" readonly="readonly" name="room_id" value="${requestScope.xuzhu_order.room_id}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <div class="layui-inline">
                <label class="layui-form-label">时间段</label>
                <div class="layui-input-inline" style="width: 100px;">
                    <input type="text" name="checkin" value="${requestScope.xuzhu_order.checkin}" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">-</div>
                <div class="layui-input-inline" style="width: 100px;">
                    <input type="text" name="checkout" value="${requestScope.xuzhu_order.checkout}" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item" pane>
        <label class="layui-form-label">续住天数</label>
        <div class="layui-input-block">
            <select name="day" required lay-verify="required"  lay-search >
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
            </select>
        </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit type="submit" name="action" value="checkout_prolong">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>

</form>
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
<script>
    function fail() {
        layer.alert('退房失败,该房间无人入住', {
            icon: 2,
            skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
        });
    }
    function success() {
        layer.alert('退房成功！', {
            icon: 1,
            skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
        });
    }
</script>

</body>
</html>
