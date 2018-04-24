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
    <%
        RoomDao roomDao=new RoomDao((DataSource)application.getAttribute("dataSource"));
        ArrayList<Room> allroom=roomDao.getAllRoom();
        request.setAttribute("allroom",allroom);
    %>
</head>
<body>
<div class="layui-row">
    <div class="layui-xs12">
        <blockquote class="layui-elem-quote" style="font-size: 50px">退房</blockquote>
    </div>
</div>
<form class="layui-form" action="checkout.do" method="post">
    <div style="width: 400px;">
        <div class="layui-form-item" pane>
            <label class="layui-form-label">房间号</label>
            <div class="layui-input-block">
                <select name="room_id" lay-verify="required" required  lay-search>
                    <option value="placeholder">请输入需要退房的房间号</option>
                    <c:forEach var="room" items="${requestScope.allroom}">
                        <option value="${room.room_id}">${room.room_id}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit type="submit" name="action" value="checkout_direct">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                <%
                    String flag=(String) session.getAttribute("checkout_flag");
                    if (flag!=null&&flag.length()>0&&flag.equals("1")){
                %>
                <script type="text/javascript">
                    window.onload=function(){
                        success(); }
                </script>
                <%
                    session.setAttribute("checkout_flag",null);
                %>
                   <a href="bill.jsp"> <button class="layui-btn layui-btn-normal" type="button">查看账单</button></a>
                <%
                }
                else if(flag!=null&&flag.length()>0&&flag.equals("0")){
                %>
                <script type="text/javascript">
                    window.onload=function(){
                        fail(); };
                </script>
                <%session.setAttribute("checkout_flag",null);
                }
                %>

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
