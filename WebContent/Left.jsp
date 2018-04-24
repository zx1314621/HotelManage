<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" >
<title>左边导航</title> 
<link rel="stylesheet" type="text/css" href="Assets/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="Assets/css/common.css"/>
<script type="text/javascript" src="Assets/js/jquery-1.8.3.min.js"></script>
<!--框架高度设置-->
<script type="text/javascript">
$(function(){
	$('.sidenav li').click(function(){
		$(this).siblings('li').removeClass('now');
		$(this).addClass('now');
	});
	
	$('.erji li').click(function(){
		$(this).siblings('li').removeClass('now_li');
		$(this).addClass('now_li');
	});
	
	var main_h = $(window).height();
	$('.sidenav').css('height',main_h+'px');
})
</script>
<!--框架高度设置-->
</head>
<body>
<div id="left_ctn">
    <ul class="sidenav">
        <li style="height:40px;">
        <span ><font size=5;color="black">功能菜单</font></span>
        </li>
          <li>  
          <div class="nav_m">
                <span ><a href="ManagerShowRoom.jsp" target="main">房间管理</a></span>
            </div>
       
        </li>
        <li>
            <div class="nav_m">
                <span ><a href="ManagerShowRece.jsp" target="main">前台管理</a></span>
            </div>
        </li>
        <li>
            <div class="nav_m">
                <span><a>订单处理</a></span>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li>
                    <span><a href="lfpz.html" target="main">流服务器配置</a></span>
                </li>
                <li>
                    <span><a href="fwqkz.html" target="main">流服务器控制</a></span>
                </li>
            </ul>
        </li>
        <li>
            <div class="nav_m">
                <span><a>系统诊断</a></span>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li>
                    <span><a href="mkzt.html" target="main">模块状态</a></span>
                </li>
                <li>
                    <span><a href="mkkz.html" target="main">模块控制</a></span>
                </li>
                <li>
                    <span><a href="wltj.html" target="main">网络统计</a></span>
                </li>
                <li>
                    <span><a href="zcxx.html" target="main">GK注册信息</a></span>
                </li>
                <li>
                    <span><a href="ping.html" target="main">Ping</a></span>
                </li>
            </ul>
        </li>
        <li>
            <div class="nav_m">
                <span><a>系统配置</a></span>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li>
                    <span><a href="xtpz.html" target="main">MCU配置</a></span>
                </li>
                <li>
                    <span><a href="wlpz.html" target="main">网络配置</a></span>
                </li>
                <li>
                    <span><a href="gkpz.html" target="main">GK配置</a></span>
                </li>
                <li>
                    <span><a href="dlpz.html" target="main">FPass配置</a></span>
                </li>
            </ul>
        </li>
        <li>
            <div class="nav_m">
                <span><a>日志管理</a></span>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li>
                    <span><a href="gzrj.html" target="main">故障日志</a></span>
                </li>
                <li>
                    <span><a href="xtrj.html" target="main">系统日志</a></span>
                </li>
            </ul>
        </li>
        <li>
            <div class="nav_m">
                <span><a>系统维护</a></span>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li>
                    <span><a href="hy_list.html" target="main">用户信息</a></span>
                </li>
                <li>
                    <span><a href="rjsj.html" target="main">软件升级</a></span>
                </li>
                <li>
                    <span><a href="hfsz.html" target="main">恢复出厂设置</a></span>
                </li>
                <li>
                    <span><a href="sjgl.html" target="main">数据库管理</a></span>
                </li>
                <li>
                    <span><a href="bdcx.html" target="main">数据库补丁程序</a></span>
                </li>
                <li>
                    <span><a href="gnxk.html" target="main">功能许可</a></span>
                </li>
            </ul>
        </li>
        <li>
            <div class="nav_m">
                <span><a href="cqxt.html" target="_blank">重启MCU</a></span>
            </div>
        </li>
        <li>
            <div class="nav_m">
                <span><a href="tcxt.html" target="_blank">退出系统</a></span>
            </div>
        </li>
    </ul>
</div>
</body>
</html>