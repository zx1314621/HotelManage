<%--
  Created by IntelliJ IDEA.
  User: 42519
  Date: 2017/12/27
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="layui/layui.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">酒店后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item">
                <a href="javascript:;">安排入住</a>
                <dl class="layui-nav-child">
                    <dd><a href="">预定入住</a></dd>
                    <dd><a href="">散客入住</a></dd>
                    <dd><a href="">团体入住</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">订单管理</a></li>
            <li class="layui-nav-item"><a href="">客房管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>

        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    前台小D
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">注销</a></li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree site-demo-nav" lay-filter="demo">
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">办理入住</a>
                    <dl class="layui-nav-child">
                        <dd><a href="checkin/idcard_order.jsp" target="main">
                            <i class="layui-icon">&#xe60d;</i>
                            <cite>预定入住</cite>
                        </a></dd>
                        <dd><a href="checkin/idcard_order.jsp" target="main">
                            <i class="layui-icon">&#xe60d;</i>
                            <cite>散客入住</cite>
                        </a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                <a href="javascript:;">办理离店</a>
                <dl class="layui-nav-child">
                    <dd><a href="checkout.jsp" target="main">
                        <i class="layui-icon">&#xe60d;</i>
                        <cite>直接离店</cite>
                    </a></dd>
                    <dd><a href="checkout.jsp" target="main">
                        <i class="layui-icon">&#xe60d;</i>
                        <cite>提前离店</cite>
                    </a></dd>
                    <dd><a href="/admin/setting/sitemap.html" target="main">
                        <i class="layui-icon">&#xe60d;</i>
                        <cite>延迟离店</cite>
                    </a></dd>
                </dl>
            </li>
                <li class="layui-nav-item">
                <a href="javascript:;">人员管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/admin/setting/sitemap.html" target="main">
                        <i class="layui-icon">&#xe60d;</i>
                        <cite>增加前台接待</cite>
                    </a></dd>
                    <dd><a href="/admin/setting/sitemap.html" target="main">
                        <i class="layui-icon">&#xe60d;</i>
                        <cite>修改前台信息</cite>
                    </a></dd>
                    <dd><a href="/admin/setting/sitemap.html" target="main">
                        <i class="layui-icon">&#xe60d;</i>
                        <cite>删除前台接待</cite>
                    </a></dd>
                    <dd><a href="/admin/setting/sitemap.html" target="main">
                        <i class="layui-icon">&#xe60d;</i>
                        <cite>修改经理信息</cite>
                    </a></dd>
                </dl>
            </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">房间管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/setting/sitemap.html" target="main">
                            <i class="layui-icon">&#xe60d;</i>
                            <cite>房态统计</cite>
                        </a></dd>
                        <dd><a href="/admin/setting/sitemap.html" target="main">
                            <i class="layui-icon">&#xe60d;</i>
                            <cite>更新房间信息</cite>
                        </a></dd>
                        <dd><a href="/admin/setting/sitemap.html" target="main">
                            <i class="layui-icon">&#xe60d;</i>
                            <cite>添加房间</cite>
                        </a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">订单管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/setting/sitemap.html" target="main">
                            <i class="layui-icon">&#xe60d;</i>
                            <cite>查看所有订单</cite>
                        </a></dd>
                        <dd><a href="/admin/setting/sitemap.html" target="main">
                            <i class="layui-icon">&#xe60d;</i>
                            <cite>查看未处理订单</cite>
                        </a></dd>
                        <dd><a href="/admin/setting/sitemap.html" target="main">
                            <i class="layui-icon">&#xe60d;</i>
                            <cite>查看已处理订单</cite>
                        </a></dd>
                    </dl>
                </li>
            </ul>

        </div>
    </div>

    <div class="layui-body iframe-container">
        <div class="iframe-mask" id="iframe-mask"></div>
        <iframe class="admin-iframe" id="admin-iframe" style="height: 800px;width: 800px" name="main" src="checkout.jsp"></iframe>
    </div>

    <div class="layui-footer footer">
        <div class="layui-main">
            <p>2017 © <a target="_blank" href="http://www.phplaozhang.com">Hotel</a></p>
        </div>
    </div>
</div>

<script>
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
        //触发事件
        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);
        element.on('tab(test)', function (elem) {
            location.hash = 'test=' + $(this).attr('lay-id');
        });
    });
</script>

<script type="text/javascript" language="javascript">
    function iFrameHeight() {
        var ifm= document.getElementById("admin-iframe");
        var subWeb = document.frames ? document.frames["admin-iframe"].document : ifm.contentDocument;
        if(ifm != null && subWeb != null) {
            ifm.height = subWeb.body.scrollHeight;
            ifm.width = subWeb.body.scrollWidth;
        }
    }
</script>
</body>
</html>
