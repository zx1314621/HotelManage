<%--
  Created by IntelliJ IDEA.
  User: 42519
  Date: 2017/12/20
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
</head>
<body>
<script src="/layui/layui.all.js"></script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //执行一个laydate实例
        var start = laydate.render({
            elem: '#checkin'
            ,min: 0
            ,format: 'yyyyMMdd'
            ,ready: function(){
                start.hint('选择入住时间');
            }
        });
        var end = laydate.render({
            elem: '#checkout'
            ,min: 0
            ,format: 'yyyyMMdd'
            ,ready: function(){
                end.hint('选择离店时间');
            }
        });
    });

</script>
<form action="jump.do" method="post">
    根据身份证号搜索订单<input type="text" name="idcard" >
    <button type="submit" name="action" value="idcard_order">搜索</button>
</form>
<form action="jump.do" method="post">
    入住时间<input type="text" name="checkin" id="checkin" onKeyUp="value=value.replace(/[^\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" ><br>
    离店时间<input type="text" name="checkout" id="checkout"  onKeyUp="value=value.replace(/[^\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" ><br>
    房型<select name="roomtype">
        <option value ="大床房" >大床房</option>
        <option value ="标准间" >标准间</option>
        <option value="单人间" >单人间</option>
    </select>
    <button type="submit" name="action" value="search">搜房</button>
</form>
</body>
</html>
