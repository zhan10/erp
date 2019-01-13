<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/jspComm/header.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="css/top.css">
  </head>
  <body background="img/top_bg.gif">
  	<div class="ad-top">
  		<h1 class="h1">运营管理系统</h1>
  		<h6 class="h6">Operations Management System</h6>
  		<ul class="userinfo">
  			<li class="username">您好:<sec:authentication property="principal.name"/></li>
  			<li>
  				<a href="">
  					<a href="#" target="_top" onClick="changePassword();return false;"><i class="password"></i><b>密码修改</b></a>
  				</a>
  			</li>
  			<li>
  				<a href="index.jsp" target="_top">
  					<i class="backhome"></i>
  					<b>返回首页</b>
  				</a>
  			</li>
  			<li>
  				<a href="">
  					<a href="j_spring_security_logout"	target="_top"><i class="signout"></i><b>注销</b></a>
  				</a>
  			</li>
  		</ul>
  	</div>
	
    <!--[if IE 6]>
	    <script type="text/javascript" src="js/DD_belatedPNG_0.0.8a.js"></script>
	    <script type="text/javascript">
			DD_belatedPNG.fix('.ad-top, .username, .password, .backhome, .signout');
	    </script>
	<![endif]-->
  </body>
  <script>
  		function changePassword(){
			window.open('changePassword.jsp','','height=200, width=300, top=250, left=300, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
		}
  </script>
</html> 




<%-- 



<html>
<style type="text/css">
a {  font-size: 9pt; color: #00457D; text-decoration: none}
/* a默认链接色彩*/

a:hover {  font-size: 9pt; color: #FF0000; text-decoration: none}
/* a:hover默认链接移上去时的色彩*/

.mover{BACKGROUND:#C8DDFF}
/*mover鼠标移上去时单元格的色彩*/

.mout{BACKGROUND:#f8f8f8}
/*mover鼠标移出去时单元格的色彩*/

body {  overflow-y:auto;font-size: 9pt;leftmargin:0;topmargin:0;marginwidth:0;marginheight:0;}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title><%=APP_TITLE%></title>
    
    <script>
    function modifiedPassword(){
	//obj为点击的按钮或链接，直接调用editIt(this,...)
	window.open('myStore/passwordModified.jsp','','height=200, width=400, top=250, left=300, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
}
    </script>
</head>

<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="img/top_bg.gif" height="77">
  <tr>
    <td width="349"><img src="img/logo.gif" width="349" height="65" /></td>
    <td width="536"><img src="img/top_project.gif" width="175" height="50" /></td>
	<td>hello:<sec:authentication property="principal.username"/></td>
    <td width="318"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><a href="javascript:void(0)"><img src="img/change_password.gif" width="29" height="32" border="0"/></a></td>
        <td align="center"><a href="login.jsp" target="_top"><img src="img/relogin.gif" width="29" height="32"  border="0"/></a></td>
        <td align="center"><a href="index.jsp" target="_top"><img src="img/return.gif" width="29" height="32"  border="0"/></a></td>
		<td></td><td></td>
      </tr>
      <tr>
        <td height="28" align="center"><a href="#" onClick="modifiedPassword();return false;">密码修改</a></td>
        <td align="center">
        <sec:authorize access="hasRole('管理员')">  
 <a href="login.jsp" target="_top">重新登录</a></sec:authorize></td>
        <td align="center"><a href="index.jsp" target="_top">返回首页</a></td>
		<TD align=middle><a href="j_spring_security_logout"
												target="_top">注销</a>
		  </TD>
											<TD align=middle><sec:authorize
													access="hasRole('ROLE_USER') and fullyAuthenticated">
													<c:url value="/account/home.do" var="accountUrl" />
													<li><a href="${accountUrl}">My Account</a>
													</li>
												</sec:authorize>
											</TD>
      </tr>
    </table></td>
  </tr>
</table>
<div id="pwd-win" style="padding-top:20px"><p/></p></div>
</body>
</html>
 --%>
