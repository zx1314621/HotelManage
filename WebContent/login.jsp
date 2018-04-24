<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LzCMS-后台管理中心</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css">
<style>
    .login_page{font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;height:100%;text-align: center;padding-top: 40px}
    .login_page h1{font-weight: 600;font-size: 30px;color: #676a6c;margin-bottom:20px;}
    .login_page .layui-form{width:300px;display: inline-block;margin:0 auto;}
    .layui-form-item .captcha img{height: 36px;cursor:pointer;}
    .layui-tree-skin-white li i{color:#fff;}
    .layui-form-item .input-custom-width{width:300px; }
</style>
    <style type="text/css">html{background: #f3f3f3;}</style>
    <script type="text/javascript" src="plugins/layui/layui.js"></script>
</head>
<body>
<div class="login_page">
    <h1>酒店后台管理系统</h1>
    <form class="layui-form layui-form-pane" action="login.do" method="post" >
        <div class="layui-form-item">
            <div class="layui-input-inline input-custom-width">
                <input type="text" name="username" required lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-input-inline input-custom-width">
                <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline input-custom-width">
               <input type="radio" name="way" value="R" title="前台" checked="checked">
                <input type="radio" name="way" value="M" title="经理">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline input-custom-width">
                <button class="layui-btn input-custom-width" lay-submit="" type="submit">登录</button>
            </div>
        </div>
    </form>
</div>
</body>

<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
    });
</script>
<%
    String flag=(String) session.getAttribute("login_fail");
    if (flag!=null&&flag.length()>0&&flag.equals("fail")){
%>
<script type="text/javascript">
    window.onload=function(){
        fail(); }
</script>
<%
    session.setAttribute("login_fail",null);
    }
%>
<script>
    function fail() {
        layer.alert('登录失败！用户名或密码有误', {
            icon: 2,
            skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
        });
    }
</script>
</html>