<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ include file="/jspComm/header.jsp"%>
<html>
  <head>
 		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">		
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <link type="text/css" rel="stylesheet" href="css/login2.css">
  </head>
  <script language="javascript">
		//在全窗口打开，跨越frameset
		if (top.location != self.location){     
			top.location=self.location;     
		}
</script>
  <body  onLoad="document.all.j_username.focus()">
	<h2 class="h2">运营管理系统</h2>
	<div class="login">
		<div class="LCon">
			<h5 class="tit-h5">登录</h5>			
			<form id="loginForm" name="loginForm"
			action="<c:url value='j_spring_security_check'/>" method="post"  class="loginForm" autocomplete="off">	
				<label for="username" class="label">用户名<em>*</em></label>
				<input id="username" class="required input" type="text" name="j_username" placeholder="请输入用户名" />              
			
				<label for="password" class="label">密　码<em>*</em></label>
				<input id="password" class="required input" type="password" name="j_password" placeholder="请输入密码" />
			<br>
	    		<input type="checkbox" id="_spring_security_remember_me" name="_spring_security_remember_me" value="true" autocomplete="off" />
	    		<label for="_spring_security_remember_me">下次自动登录(公共场所慎用)</label>
    		
	    		<p><button class="loginBtn" type="reset">取消</button><button class="loginBtn" type="submit">登录</button></p>
			</form>
		</div>
	</div>
	<div class="footer">
		<h1 class="h1">运营管理系统</h1>
		<!-- <p>Copyright © 2012-2018 <a href="http://www.bluechips.net.cn">武汉蓝筹科技有限公司</a></p> -->
	</div>

  
	
    <!--[if IE 6]>
	    <script type="text/javascript" src="js/DD_belatedPNG_0.0.8a.js"></script>
	    <script type="text/javascript">
			DD_belatedPNG.fix('.h2, #username, #password');
	    </script>
	<![endif]-->
  </body>
</html>
<%
   session.invalidate();
%>