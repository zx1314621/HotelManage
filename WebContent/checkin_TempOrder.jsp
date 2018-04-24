<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %><%--
  Created by IntelliJ IDEA.
  User: 42519
  Date: 2017/12/28
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="src/css/main.css?v2.0.1-simple" media="all">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <title>散客入住</title>
    <%  Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");//可以方便地修改日期格式
        String today = dateFormat.format( now );//获取今天时间
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(now);
        calendar.add(calendar.DATE,1);//把日期往后增加一天.整数往后推,负数往前移动
        now=calendar.getTime(); //这个时间就是日期往后推一天的结果
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
        String tommorow= formatter.format(now);//获取明天时间
        request.setAttribute("today",today);
        request.setAttribute("tommorow",tommorow);
    %>
</head>
<body>
<script src="plugins/layui/layui.all.js"></script>
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
<div class="layui-row">
    <div class="layui-xs12">
        <blockquote class="layui-elem-quote" style="font-size: 50px">散客入住</blockquote>
    </div>
</div>
<form class="layui-form layui-form-pane" action="checkin.do" method="post">
    <div style="width: 300px;">
    <div class="layui-form-item" pane>
        <label class="layui-form-label">入住时间</label>
        <div class="layui-input-block">
            <input type="text" readonly="readonly" name="checkin" id="checkin"  required  lay-verify="required" value="${requestScope.today}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" pane>
        <label class="layui-form-label">离店时间</label>
        <div class="layui-input-block">
            <input type="text" readonly="readonly" name="checkout" id="checkout"  required  lay-verify="required" value="${requestScope.tommorow}" autocomplete="off" class="layui-input">
        </div>
    </div>
    </div>
    <div style="width: 300px;">
        <div class="layui-form-item" pane>
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text"  name="customerName"   required  lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label">身份证号</label>
            <div class="layui-input-block">
                <input type="text"  name="idcard" required  lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" pane>
            <label class="layui-form-label">房间类型</label>
            <div class="layui-input-block">
                <input type="radio" name="roomtype" value="大床房" title="大床房" checked>
                <input type="radio" name="roomtype" value="标准间" title="标准间">
                <input type="radio" name="roomtype" value="单人间" title="单人间">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit type="submit" name="action" value="checkin_temp">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script src="layui/layui.all.js"></script>
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
<script type="text/javascript" src="plugins/layui/layui.all.js"></script>
<%
    String flag=(String) session.getAttribute("sk_fail");
    if (flag!=null&&flag.length()>0){
%>
<script type="text/javascript">
    window.onload=function(){
        fail(); }
</script>
<%
    session.setAttribute("sk_fail",null);
    }
%>
<script>
    function fail() {
        layer.alert('对不起，房间已满', {
            icon: 2,
            skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
        });
    }
</script>
</body>
</html>
