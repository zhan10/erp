<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jspComm/header.jsp"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>运营管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <link type="text/css" rel="stylesheet" href="css/oms.css">
    <link type="text/css" rel="stylesheet" href="css/ie7.css">
  </head>
  <body class="bodyBg">
  	<div class="container oms">
  		<div class="clearfix user">
			<img class="log" src="img/log3.png" alt="tu" />
			<h1>运营管理系统<span>Operations Management System</span></h1>
	  		<%-- <ul class="userinfo">
  			<li class="username">您好:<sec:authentication property="principal.Username"/></li>
  			<li>
  				<a href="#" onClick="modifiedPassword();return false;">
  					<i class="password"></i>
  					<b>密码修改</b>
  				</a>
  			</li>
  			<li>
  				<a href="index.jsp" target="_top">
  					<i class="backhome"></i>
  					<b>返回首页</b>
  				</a>
  			</li>
  			<li>
  				<a href="j_spring_security_logout"	target="_top">
  					<i class="signout"></i>
  					<b>注销</b>
  				</a>
  			</li>
  		</ul> --%>
	  		
  		</div>
		<div class="btns">
  			<div class="clearfix">
  				<a class="icon icon-hexagon invisible"></a>
	  			<a class="icon icon-hexagon invisible"></a>
	  			<!-- <a class="icon icon-hexagon a5b4d8"></a> -->
	  			<a href="inventory/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe604;<b>库存管理</b></i></a>
	  			<a class="decorate"><img src="img/oms-1.png" alt="tu" /></a>
	  			<a class="icon icon-hexagon invisible"></a>
	  			<a class="icon icon-hexagon a5b4d8"></a>
  			</div>
  			<div class="clearfix row2">
  				<a class="decorate"><img src="img/oms-1.png" alt="tu" /></a>
	  		<a href="warehouse/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe600;<b>仓库管理</b></i></a>
	  		<a class="decorate"><img src="img/oms-2.png" alt="tu" /></a>
	  		<a href="mater/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe604;<b>材料管理</b></i></a>
	  		<!-- <a class="icon icon-hexagon a5b4d8"></a> -->
	  		<a class="icon icon-hexagon a5b4d8"></a>
	  		<a class="icon icon-hexagon a5b4d8"></a>
  			</div>
  			<div class="clearfix row3">
	  			<a class="icon icon-hexagon a5b4d8"></a>
	  			<a href="system/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe606;<b>系统管理</b></i></a>
	  			<!-- <a href="test/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe604;<b>测试</b></i></a> -->
	  			<a class="icon icon-hexagon invisible"></a>
	  			<a class="icon icon-hexagon a5b4d8"></a>
	  			<a class="decorate"><img src="img/oms-3.png" alt="tu" /></a>
	  			<a class="icon icon-hexagon invisible"></a>
  			</div>
  		</div>
  		<!-- <div class="btns">
  			<div class="clearfix">
  				<a class="icon icon-hexagon invisible"></a>
	  			<a class="icon icon-hexagon invisible"></a>
	  			<a class="icon icon-hexagon a5b4d8"></a>
	  			<a href="product/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe604;<b>产品管理</b></i></a>
	  			<a class="icon icon-hexagon invisible"></a>
	  			<a href="serve/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe603;<b>服务管理</b></i></a>
  			</div>
  			<div class="clearfix row2">
  				<a class="decorate"><img src="img/oms-1.png" alt="tu" /></a>
	  		<a href="crm/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe601;<b>客户管理</b></i></a>
	  		<a class="decorate"><img src="img/oms-2.png" alt="tu" /></a>
	  		<a href="produce/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe600;<b>订单管理</b></i></a>
	  		<a href="request/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe604;<b>需求管理</b></i></a>
	  		<a class="icon icon-hexagon a5b4d8"></a>
  			</div>
  			<div class="clearfix row3">
  					<a href="system/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe606;<b>系统管理</b></i></a>
	  			<a href="finance/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe604;<b>财务管理</b></i></a>
	  			<a href="test/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe604;<b>测试</b></i></a>
	  			<a class="icon icon-hexagon invisible"></a>
	  				<a href="content/index.jsp" class="icon blue">&#xe602;<i class="icon">&#xe605;<b>内容管理</b></i></a>
	  			<a class="decorate"><img src="img/oms-3.png" alt="tu" /></a>
	  			<a class="icon icon-hexagon invisible"></a>
  			</div>
  		</div> -->

  		<p class="footer">
  			<!-- Copyright © 2012-2018 -->  <a href="http://www.bluechips.net.cn" target="_blank"> </a>
  		</p>
  	</div>

  	<script src="jsComm/jquery.min.js"></script>
	<script>
		if (/Firefox/i.test(navigator.userAgent)) { 
			$('.decorate').css('margin-top', '-11px');
		}
	</script>
    <!--[if IE 6]>
	    <script type="text/javascript" src="js/DD_belatedPNG_0.0.8a.js"></script>
	    <script type="text/javascript">
			DD_belatedPNG.fix('.log, .username, .password, .backhome, .signout, img');
	    </script>
	<![endif]-->
  </body>
</html>