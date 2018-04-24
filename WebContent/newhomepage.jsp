<%@ page import="usst.Dao.ManagerDao" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="usst.model.Manager" %>
<%@ page import="usst.Dao.ReceptionistDao" %>
<%@ page import="usst.model.Receptionist" %>
<%--
  Created by IntelliJ IDEA.
  User: 42519
  Date: 2017/12/29
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>酒店管理系统</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css" media="all" />
    <link rel="stylesheet" href="src/css/app.css" media="all" />
    <link rel="stylesheet" href="src/css/themes/default.css" media="all" id="skin" kit-skin />
    <style>
        .admin-side-full{
            position: absolute; cursor: pointer;
            z-index: 19940201;
            left: 200px;
            color: white;
            text-align: center;
            width: 30px;
            height: 30px;
            background-color: #1AA094;
            line-height: 30px;
            top: 25%;
        }
        .admin-side-full{
            left: 240px;
        }
    </style>
</head>

<body class="kit-theme">
<div class="layui-layout layui-layout-admin kit-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">酒店管理系统</div>
        <div class="layui-logo kit-logo-mobile">K</div>
        <div class="admin-side-full" id="fullscreen">
            <i class="fa fa-life-bouy" aria-hidden="true"></i>
        </div>
        <ul class="layui-nav layui-layout-right kit-nav">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <%String way_of_login=(String) session.getAttribute("way_of_login");
                    if (way_of_login.equals("M")){
                        String manager_id=(String)session.getAttribute("login_manager_id");
                        ManagerDao managerDao=new ManagerDao((DataSource) application.getAttribute("dataSource"));
                        Manager manager=managerDao.getManager(manager_id);
                        %><img src="images/manager.jpg" class="layui-nav-img">
                    <%
                        out.print(manager.getName());
                    }
                    else if(way_of_login.equals("R")){
                        String receptionist_id=(String)session.getAttribute("login_receptionist_id");
                        ReceptionistDao receptionistDao=new ReceptionistDao((DataSource) application.getAttribute("dataSource"));
                        Receptionist receptionist=receptionistDao.getReceptionist(receptionist_id);
                          %> <img src="http://m.zhengjinfan.cn/images/0.jpg" class="layui-nav-img">
                           <%
                        out.print(receptionist.getName());
                    }
                %>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">后台人员</a></dd>
                    <dd><a href="javascript:;">权限：<%String way=(String) session.getAttribute("way_of_login");if (way.equals("R")){
                        out.print("前台");}else{
                            out.print("经理");
                        }
                    ;%></a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a></li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black kit-side">
        <div class="layui-side-scroll">
            <div class="kit-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span> 办理入住</span></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" kit-target data-options="{url:'checkin_SearchOrder.jsp',icon:'&#xe6c6;',title:'预定入住',id:'1'}">
                                <i class="layui-icon">&#xe6c6;</i><span> 预定入住</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="checkin_TempOrder.jsp" data-icon="fa-user" data-title="散客入住" kit-target data-id='2'><i class="fa fa-user" aria-hidden="true"></i><span> 散客入住</span></a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span> 办理离店</span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'checkout_direct.jsp',icon:'&#xe658;',title:'直接离店',id:'6'}"><i class="layui-icon">&#xe658;</i><span> 直接离店</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'checkin_SearchOrder.jsp',icon:'&#xe658;',title:'延迟离店',id:'7'}"><i class="layui-icon">&#xe658;</i><span> 延迟离店</span></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span> 人员管理</span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'ManagerShowRece.jsp',icon:'&#xe613;',title:'前台管理',id:'8'}"><i class="layui-icon">&#xe613;</i><span> 前台管理</span></a></dd>
                        <dd><a href="javascript:;" kit-target data-options="{url:'ShowCustomerManager.jsp',icon:'&#xe613;',title:'顾客管理',id:'9'}"><i class="layui-icon">&#xe613;</i><span> 顾客管理</span></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span> 订单管理</span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'ManagerShowOrder.jsp',icon:'&#xe60a;',title:'查看订单',id:'10'}"><i class="layui-icon">&#xe60a;</i><span> 查看订单</span></a></dd>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'ChartMonthManager.jsp',icon:'&#xe63c;',title:'月季报表',id:'11'}"><i class="layui-icon">&#xe63c;</i><span> 月季报表</span></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span> 房间管理</span></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" kit-target data-options="{url:'ManagerShowRoom.jsp',icon:'&#xe68e;',title:'房间管理',id:'12'}"><i class="layui-icon">&#xe68e;</i><span> 房间管理</span></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body" id="container">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">主体内容加载中,请稍等...</div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        2017 &copy;
        <a href="http://baidu.com">https:www.ussthotel.com/</a>

    </div>
</div>
<script src="./plugins/layui/layui.js"></script>
<script>
    var message;
    layui.config({
        base: 'src/js/',
        version: '1.0.1'
    }).use(['app', 'message'], function() {
        var app = layui.app,
            $ = layui.jquery,
            layer = layui.layer;
        //将message设置为全局以便子页面调用
        message = layui.message;
        //主入口
        app.set({
            type: 'iframe'
        }).init();
        $('dl.skin > dd').on('click', function() {
            var $that = $(this);
            var skin = $that.children('a').data('skin');
            switchSkin(skin);
        });
        var setSkin = function(value) {
                layui.data('kit_skin', {
                    key: 'skin',
                    value: value
                });
            },
            getSkinName = function() {
                return layui.data('kit_skin').skin;
            },
            switchSkin = function(value) {
                var _target = $('link[kit-skin]')[0];
                _target.href = _target.href.substring(0, _target.href.lastIndexOf('/') + 1) + value + _target.href.substring(_target.href.lastIndexOf('.'));
                setSkin(value);
            },
            initSkin = function() {
                var skin = getSkinName();
                switchSkin(skin === undefined ? 'default' : skin);
            }();
    });
</script>
<script>
    window.onload=function(){
        var  div = document.getElementById('fullscreen');

        div.onclick=function(){
            var docElm = document.documentElement;
            //W3C
            if (docElm.requestFullscreen) {
                docElm.requestFullscreen();
            }
            //FireFox
            else if (docElm.mozRequestFullScreen) {
                docElm.mozRequestFullScreen();
            }
            //Chrome等
            else if (docElm.webkitRequestFullScreen) {
                docElm.webkitRequestFullScreen();
            }
            //IE11
            else if (elem.msRequestFullscreen) {
                elem.msRequestFullscreen();
            }
            layer.msg('按Esc即可退出全屏');
        }
    }
</script>
</body>

</html>