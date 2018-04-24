<%@ page import="usst.Dao.OrderDao" %>
<%@ page import="usst.model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="usst.Dao.CustomerDao" %>
<%@ page import="usst.model.Customer" %>
<%@ page import="usst.model.Room" %>
<%@ page import="usst.Dao.RoomDao" %>
<%@ page import="javax.sql.DataSource" %><%--
  Created by IntelliJ IDEA.
  User: 42519
  Date: 2017/12/30
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%
        OrderDao orderDao=new OrderDao((DataSource)application.getAttribute("dataSource"));
        ArrayList<Order> allorder=orderDao.getAllOrder();
        request.setAttribute("allorder",allorder);%>
    <meta charset="utf-8">
    <title>首页--layui后台管理模板</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="src/css/font/iconfont.css?v=1.0.1" media="all">
    <link rel="stylesheet" type="text/css" href="src/css/main.css?v2.0.1-simple" media="all">
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
</head>
<body>
<div class="layui-fluid larry-wrapper">
    <div class="layui-row layui-col-space30">
        <div class="layui-col-xs6 layui-col-sm4 layui-col-md2">
            <section class="panel">
                <div class="symbol bgcolor-blue"> <i class="iconfont">&#xe672;</i>
                </div>
                <div class="value tab-menu">
                    <a href="ShowCustomerManager.jsp" data-url="user-info.html" data-parent="true" data-title="注册用户"><i class="iconfont " data-icon='&#xe672;'></i>
                        <h1>${applicationScope.customerNum}</h1>
                    </a>
                    <a href="ShowCustomerManager.jsp" data-url="user-info.html" data-parent="true" data-title="注册用户"> <i class="iconfont " data-icon='&#xe672;'></i><span>注册用户</span></a>
                </div>
            </section>
        </div>
        <div class="layui-col-xs6 layui-col-sm4 layui-col-md2">
            <section class="panel">
                <div class="symbol bgcolor-commred"> <i class="iconfont">&#xe600;</i>
                </div>
                <div class="value tab-menu">
                    <a href="ManagerShowRoom.jsp" data-url="user-info.html" data-parent="true" data-title="客房总数"> <i class="iconfont " data-icon='&#xe600;'></i>
                        <h1>${applicationScope.roomNum}</h1>
                    </a>

                    <a href="ManagerShowRoom.jsp" data-url="user-info.html" data-parent="true" data-title="客房总数"> <i class="iconfont " data-icon='&#xe600;'></i><span>客房总数</span></a>

                </div>
            </section>
        </div>
        <div class="layui-col-xs6 layui-col-sm4 layui-col-md2">
            <section class="panel">
                <div class="symbol bgcolor-dark-green"> <i class="iconfont">&#xe6bc;</i>
                </div>
                <div class="value tab-menu">
                    <a href="ManagerShowOrder.jsp" data-url="user-info.html" data-parent="true" data-title="订单总数"> <i class="iconfont " data-icon='&#xe6bc;'></i>
                        <h1>${applicationScope.allorderNum}</h1>
                    </a>
                    <a href="ManagerShowOrder.jsp" data-url="user-info.html" data-parent="true" data-title="订单总数"> <i class="iconfont " data-icon='&#xe6bc;'></i><span>订单总数</span></a>
                </div>
            </section>
        </div>
        <div class="layui-col-xs6 layui-col-sm4 layui-col-md2">
            <section class="panel">
                <div class="symbol bgcolor-yellow-green"> <i class="iconfont">&#xe67a;</i>
                </div>
                <div class="value tab-menu">
                    <a href="checkin_SearchOrder.jsp"  data-parent="true" data-title="未处理订单"> <i class="iconfont " data-icon='&#xe67a;'></i>
                        <h1>${applicationScope.unhandledNum}</h1>
                    </a>
                    <a href="checkin_SearchOrder.jsp"  data-parent="true" data-title="未处理订单"> <i class="iconfont " data-icon='&#xe67a;'></i><span>未处理订单</span></a>
                </div>
            </section>
        </div>
        <div class="layui-col-xs6 layui-col-sm4 layui-col-md2">
            <section class="panel">
                <div class="symbol bgcolor-orange"> <i class="iconfont">&#xe638;</i>
                </div>
                <div class="value tab-menu">
                    <a href="ManagerShowRece.jsp" data-url="user-info.html" data-parent="true" data-title="评价总数"> <i class="iconfont " data-icon='&#xe638;'></i>
                        <h1>10</h1>
                    </a>
                    <a href="ManagerShowRece.jsp" data-url="user-info.html" data-parent="true" data-title="评价总数"> <i class="iconfont " data-icon='&#xe638;'></i><span>前台总数</span></a>
                </div>
            </section>
        </div>
        <div class="layui-col-xs6 layui-col-sm4 layui-col-md2">
            <section class="panel">
                <div class="symbol bgcolor-yellow"> <i class="layui-icon">&#xe613;</i>
                </div>
                <div class="value tab-menu">
                    <a href="ShowCustomerManager.jsp" data-url="user-info.html" data-parent="true" data-title="住店顾客数"> <i class="layui-icon" data-icon='&#xe613;'></i>
                        <h1>${applicationScope.customerinNum}</h1>
                    </a>
                    <a href="ShowCustomerManager.jsp" data-url="user-info.html" data-parent="true" data-title="住店顾客数"> <i class="layui-icon" data-icon='&#xe613;'></i><span>顾客</span></a>
                </div>
            </section>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-xs12">
            <blockquote class="layui-elem-quote">欢迎使用</blockquote>
        </div>
    </div>
    <div class="layui-row layui-col-space10">
        <div class="layui-col-xs12 layui-col-sm12 layui-col-md6">
            <form class="layui-form" action="searchorder.do" method="post">
                <label class="layui-form-label">身份证-订单</label>
                <div class="layui-input-block">
                    <select name="idcard" lay-verify="required" placeholder="输入身份证号以搜索订单" lay-search >
                        <option value="placeholder">输入身份证号以搜索订单</option>
                        <c:forEach var="order" items="${requestScope.allorder}">
                            <option value="${order.idcard}">${order.idcard}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit type="submit" name="action" value="idcard_order">搜索</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
            <hr class="layui-bg-green">
            <br>
            <p style="font-size: 30px"> &nbsp;&nbsp; &nbsp;今日可用房</p>
            <div class="layui-row">
                <div class="layui-col-md4">
                    <i class="layui-icon" style="font-size: 100px; color: #5F9EA0;" >&#xe68e;</i>
                    <ul style="color: black;font-size: 20px"><li>&nbsp;&nbsp; ·大床房</li>
                    <li>&nbsp;&nbsp; ·${big_roomNum}</li></ul>
                </div>
                <div class="layui-col-md4">
                    <i class="layui-icon" style="font-size: 100px; color: #5F9EA0;">&#xe68e;</i>
                    <ul style="color: black;font-size: 20px"><li>&nbsp;&nbsp; ·标准间</li>
                        <li>&nbsp;&nbsp; ·${std_roomNum}</li></ul>
                </div>
                <div class="layui-col-md4">
                    <i class="layui-icon" style="font-size: 100px; color: #5F9EA0;">&#xe68e;</i>
                    <ul style="color: black;font-size: 20px"><li>&nbsp;&nbsp; ·单人间</li>
                        <li>&nbsp;&nbsp; ·${sgl_roomNum}</li></ul>
                </div>
            </div>
        </div>


        <div class="layui-col-xs12 layui-col-sm12 layui-col-md6">
            <section class="panel">
                <div class="panel-heading">
                    网站信息
                    <a href="javascript:;" class="pull-right panel-toggle"><i class="iconfont">&#xe604;</i></a>
                </div>
                <div class="panel-body">
                    <table class="layui-table">
                        <tbody>
                        <tr>
                            <td>
                                <strong>软件名称</strong>：

                            </td>
                            <td>
                                <a href="newhomepage.jsp">酒店后台管理系统</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>软件版本</strong>：

                            </td>
                            <td>
                                V0.9
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>开发作者</strong>：
                            </td>
                            <td>四人小组</td>
                        </tr>

                        <tr>
                            <td>
                                <strong>酒店官网</strong>：
                            </td>
                            <td>
                                <a href="1.jsp">www.usst_hotel.com</a></td 

>
                        </tr>
                        <tr>
                            <td>
                                <strong>后期维护</strong>：
                            </td>
                            <td>请联系任意组员</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
    </div>
</div>
<script type="text/javascript" src="plugins/layui/layui.js"></script>
<script type="text/javascript" src="src/js/main.js"></script>
<script type="text/javascript" src="src/js/version.js?v=2.0.1"></script>
<script src="src/js/common.js?v=2.0.1"></script>
<script>
    layui.use(['main', 'echart']);
</script>
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
</body>
</html>
