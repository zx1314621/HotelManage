<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>METEOR GARDEN</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
 <link rel="stylesheet" href="layui/css/layui.css" media="all">
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script src="js/main.js"></script>
<!-- //js -->
<!-- font-awesome-icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- tabs -->
<link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
<!-- //tabs -->
<!-- //font-awesome-icons -->
<link href="http://fonts.googleapis.com/css?family=Prompt:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext,thai,vietnamese" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
<style type="text/css">

</style>

</head>
<body>
<!-- banner -->
	<div class="banner">
		<div class="header-bottom">
			<div class="header">
				<div class="container">
					<div class="w3_agile_logo">
						<h1><a href="Main.jsp"><span>Meteor</span>Garden</a></h1>
					</div>
					<div class="header-nav">
						<nav class="navbar navbar-default">
							<div class="navbar-header navbar-left">
								</button>
							</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
								<nav class="link-effect-12">
									<ul class="nav navbar-nav w3_agile_nav">
										<li class="active"><a href="index.html"><span>主页</span></a></li>
										<li><a href=""><span>登录</span></a></li>
										<li><a href=""><span>注册</span></a></li>
										<li><a href=""><span>团体预订</span></a></li>
										<li><a href=""><span>联系我们</span></a></li>
									</ul>	
								</nav>
							</div>
						</nav>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
<!-- header -->
<!-- w3-banner -->
			<div class="w3-banner">
				<div id="typer"></div>
			</div>
<!-- //w3-banner -->
		</div>
	</div>
<!-- //banner -->

<!-- welcome -->
	<div class="about">
		<div class="container">
			<div class="w3ls-heading">
				<h2>订房</h2>
 <table align = center>
        <tr><td>入住日期</td><td>退房日期</td><td></td></tr>
        <form action =JudgeServlet method="post" >
        <tr> 
        <td>
            <div >
            <input type="text" name="checkin" id="startDate"style=" padding:5px 10px;width:500px;height:100px;font-size:50px;font-family:Microsoft Yahei" value ="${datetime}"readonly/>
            </div> 
            </td>
            <td>
            <div><input type="text" name="checkout" id="endDate"style=" padding:5px 10px;width:500px;height:100px;font-size:50px;font-family:Microsoft Yahei" value ="${datetime1}"readonly/>
            </div></td>
            <td><input type="submit"  value="确定" style="background:orange;color:white;width:300px;height:100px;font-size:50px;" font = "Microsoft YAhei" /></td>
            </tr></form>
</table>
			</div>
		</div>
	</div>
<!-- //welcome -->
<!-- popular -->
	<div class="popular-section-wthree">
		<div class="container">	
			<div class="w3ls-heading">
				<h3>酒店服务</h3>
			</div>
			<div class="popular-agileinfo">
				<div class="col-md-3 popular-grid">
					<i class="fa fa-bell" aria-hidden="true"></i>
					<h4>叫早</h4>
					<p>设定好起床时间，会有专门电话叫您起床</p>
				</div>
				<div class="col-md-3 popular-grid">
					<i class="fa fa-wifi" aria-hidden="true"></i>
					<h4>酒店WIFI</h4>
					<p>酒店高速无线WIFI，全天24小时免费使用</p>
				</div>
				<div class="col-md-3 popular-grid popular-grid-bottom">
					<i class="fa fa-bath" aria-hidden="true"></i>
					<h4>热水淋浴</h4>
					<p>24小时不间断提供热水，随时让您的身心得到放松</p>
				</div>
				<div class="col-md-3 popular-grid">
					<i class="fa fa-car" aria-hidden="true"></i>
					<h4>免费泊车</h4>
					<p>酒店提过全天候免费停车位</p>
				</div>
					<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //popular -->
<!-- choose-us -->
	<div class="why-choose-agile">
		<div class="container">
			<div class="w3ls-heading">
				<h3>酒店特色</h3>
			</div>
			<div class="why-choose-agile-grids-top">
				<div class="col-md-4 agileits-w3layouts-grid">
					<div class="wthree_agile_us">
						<div class="col-xs-9 agile-why-text">
							<h4>酒廊</h4>
							<p>提供的餐点和酒水,让您在舒适的环境下品尝美酒</p>
						</div>
						<div class="col-xs-3 agile-why-text">
							<div class="wthree_features_grid hvr-rectangle-out">
								<i class="fa fa-glass" aria-hidden="true"></i>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="wthree_agile_us">
						<div class="col-xs-9 agile-why-text">
							<h4>游戏</h4>
							<p>提供XBOX,PS4等，让您在住宿之余可以享受游戏带来的快乐</p>
						</div>
						<div class="col-xs-3 agile-why-text">
							<div class="wthree_features_grid hvr-rectangle-out">
								<i class="fa fa-gamepad" aria-hidden="true"></i>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="wthree_agile_us">
						<div class="col-xs-9 agile-why-text">
							<h4>图书</h4>
							<p>收藏全世界著名小说数万余部，让您在住宿休息之时可以畅游书海</p>
						</div>
						<div class="col-xs-3 agile-why-text">
							<div class="wthree_features_grid hvr-rectangle-out">
								<i class="fa fa-book" aria-hidden="true"></i>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="col-md-4 agileits-w3layouts-grid img">
					<img src="images/3.jpg" alt=" " class="img-responsive" />
				</div>
				<div class="col-md-4 agileits-w3layouts-grid">
					<div class="wthree_agile_us">
						<div class="col-xs-3 agile-why-text agile-icon-left">
							<div class="wthree_features_grid hvr-rectangle-out">
								<i class="fa fa-picture-o" aria-hidden="true"></i>
							</div>
						</div>
						<div class="col-xs-9 agile-why-text two">
							<h4>摄影</h4>
							<p>酒店四周景色宜人，是广大摄影爱好者理想的取景地</p>
						</div>
						
						<div class="clearfix"> </div>
					</div>
					<div class="wthree_agile_us">
						<div class="col-xs-3 agile-why-text agile-icon-left">
							<div class="wthree_features_grid hvr-rectangle-out">
								<i class="fa fa-heart" aria-hidden="true"></i>
							</div>
						</div>
						<div class="col-xs-9 agile-why-text two">
							<h4>交友</h4>
							<p>提供专业的交友服务，可以让住客在住宿之时更快捷更放心的与他人交友</p>
						</div>
						
						<div class="clearfix"> </div>
					</div>
					<div class="wthree_agile_us">
						<div class="col-xs-3 agile-why-text agile-icon-left">
								<div class="wthree_features_grid hvr-rectangle-out">
									<i class="fa fa-film" aria-hidden="true"></i>
								</div>
						</div>
						<div class="col-xs-9 agile-why-text two">
							<h4>电影</h4>
							<p>加盟各大院线, 让住客在住宿之暇可以饱览国内外各种大片</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //choose-us -->
<!-- team -->
	<div class="team">
		<div class="container">
			<div class="w3ls-heading">
				<h3>酒店创始人</h3>
			</div>
			<div class="inner_w3l_agile_grids">
				<div id="horizontalTab">
					<ul class="resp-tabs-list">
						<li>
							<img src="images/lxy.jpg" alt=" " class="img-responsive" />
						</li>
						<li>
							<img src="images/cm.jpg" alt=" " class="img-responsive" />
						</li>
						<li>
							<img src="images/wdy.jpg" alt=" " class="img-responsive" />
						</li>
						<li>
							<img src="images/wcy.jpg" alt=" " class="img-responsive" />
						</li>
					</ul>
						<div class="resp-tabs-container">
							<div class="tab1">
								<div class="col-md-6 team-img-w3-agile">
								</div>
								<div class="col-md-6 team-Info-agileits">
									<h4>刘翔宇</h4>
									<span>intelligent</span>
									<p>知是行之始，行是知之成。从建立Meteor Garden至今，它已经给我带了无限的快乐，我希望它也可以把快乐带给每个使用它的人。</p>
											
								</div>
								<div class="clearfix"> </div>
							</div>
							
							<div class="tab2">
							<div class="col-md-6 team-img-w3-agile">
								</div>
								<div class="col-md-6 team-Info-agileits">
									<h4>陈敏</h4>
									<span>artless</span>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis.Lorem ipsum dolor .</p>								
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="tab3">
								<div class="col-md-6 team-img-w3-agile">
								</div>
								<div class="col-md-6 team-Info-agileits">
									<h4>万栋宇</h4>
									<span>diligent</span>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis.Lorem ipsum dolor .</p>						
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="tab4">
							<div class="col-md-6 team-img-w3-agile">
								</div>
								<div class="col-md-6 team-Info-agileits">
									<h4>王辰瑜</h4>
									<span>sophisticated</span>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis.Lorem ipsum dolor .</p>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
<!-- //team -->
<!-- footer -->
	<div class="w3-agile-footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
					</div>
					
				</div>
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
					</div>
					
				</div>
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
					</div>
				</div>
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
				<div class="contact-form">
				<font color=white>联系我们</font>
				<form action="#" method="post">
					<input type="text" placeholder="姓名" required="">
					<input type="email" placeholder="邮箱" required="">
					<input type="text" placeholder="电话" required="">
					<textarea placeholder="您宝贵的意见" required=""></textarea>
					<button class="btn1" style="color:white">提交</button>
				</form>
							<div class="agileits-w3layouts-copyright">
				<p>流星花园 Made By刘翔宇，万栋宇，王辰瑜，陈敏制作</p>

	</div>
<!-- //footer -->
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smooth-scrolling -->
<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
	<script src='js/jquery.typer.js'></script>
		<script>
						var win = $(window),
							foo = $('#typer');

						foo.typer(['Meteor Garden', 'Hotels & Resorts', '流星花园']);

						// unneeded...
						win.resize(function(){
							var fontSize = Math.max(Math.min(win.width() / (1 * 10), parseFloat(Number.POSITIVE_INFINITY)), parseFloat(Number.NEGATIVE_INFINITY));

							foo.css({
								fontSize: fontSize * .8 + 'px'
							});
						}).resize();
					</script>
					<!--tabs-->
	<script src="js/easy-responsive-tabs.js"></script>
	<script>
		$(document).ready(function () {
		$('#horizontalTab').easyResponsiveTabs({
		type: 'default', //Types: default, vertical, accordion           
		width: 'auto', //auto or any width like 600px
		fit: true,   // 100% fit in a container
		closed: 'accordion', // Start closed if in accordion view
		activate: function(event) { // Callback function if tab is switched
		var $tab = $(this);
		var $info = $('#tabInfo');
		var $name = $('span', $info);
		$name.text($tab.text());
		$info.show();
		}
		});
		$('#verticalTab').easyResponsiveTabs({
		type: 'vertical',
		width: 'auto',
		fit: true
		});
		});
	</script>
	<!--//tabs-->
<script src="layui/layui.js"></script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //执行一个laydate实例
        var start = laydate.render({
            elem: '#startDate'
            ,format: 'yyyy/MM/dd'
            ,min: 0
        });
        var end = laydate.render({
            elem: '#endDate'
            ,format: 'yyyy/MM/dd'
            ,min: 0
        });
    });

</script>
</body>
</html>