<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ include file="/jspComm/header.jsp"%>
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">		
		<style type="text/css">
<!--
body {
	background-image: url();
	background-color: #1E4D81;
}
.btnsubmit1 {	BORDER-RIGHT: #58adfe 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #58adfe 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#C4E1FF); BORDER-LEFT: #58adfe 1px solid; WIDTH: 75px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #58adfe 1px solid; HEIGHT: 19px
}
.textbox {	BORDER-RIGHT: #7f9db9 1px solid; BORDER-TOP: #7f9db9 1px solid; BORDER-LEFT: #7f9db9 1px solid; BORDER-BOTTOM: #7f9db9 1px solid; HEIGHT: 18px;width:150
}
-->
</style>
		<title><%=APP_TITLE%></title>
		<style type="text/css">
<!--
body {
	background-image: url();
	background-color: #1E4D81;
}
.btnsubmit1 {	BORDER-RIGHT: #58adfe 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #58adfe 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#C4E1FF); BORDER-LEFT: #58adfe 1px solid; WIDTH: 75px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #58adfe 1px solid; HEIGHT: 19px
}
.textbox {	BORDER-RIGHT: #7f9db9 1px solid; BORDER-TOP: #7f9db9 1px solid; BORDER-LEFT: #7f9db9 1px solid; BORDER-BOTTOM: #7f9db9 1px solid; HEIGHT: 18px
}
.textbox1 {BORDER-RIGHT: #7f9db9 1px solid; BORDER-TOP: #7f9db9 1px solid; BORDER-LEFT: #7f9db9 1px solid; BORDER-BOTTOM: #7f9db9 1px solid; HEIGHT: 18px;width:150
}
.textbox1 {BORDER-RIGHT: #7f9db9 1px solid; BORDER-TOP: #7f9db9 1px solid; BORDER-LEFT: #7f9db9 1px solid; BORDER-BOTTOM: #7f9db9 1px solid; HEIGHT: 18px
}
.btnsubmit11 {BORDER-RIGHT: #58adfe 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #58adfe 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#C4E1FF); BORDER-LEFT: #58adfe 1px solid; WIDTH: 75px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #58adfe 1px solid; HEIGHT: 19px
}
.btnsubmit11 {BORDER-RIGHT: #58adfe 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #58adfe 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#C4E1FF); BORDER-LEFT: #58adfe 1px solid; WIDTH: 75px; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #58adfe 1px solid; HEIGHT: 19px
}
-->
</style>
	</head>
	<script language="javascript">
		//在全窗口打开，跨越frameset
		if (top.location != self.location){     
			top.location=self.location;     
		}
</script>
	<body onLoad="document.all.j_username.focus()">			
	<form id="loginForm" name="loginForm"
			action="<c:url value='j_spring_security_check'/>" method="post">		
			<table width="100%" height="100%" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td height="100%" valign="top" >
						<table width="470" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td height="150">&nbsp;</td>
							</tr>
						</table>
						<table width="470" height="288" border="0" align="center"
							cellpadding="1" cellspacing="1" bgcolor="#5D86BC">
							<tr>
								<td valign="top" bgcolor="#E8F3FD">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<img src="img/login_title.gif" width="471" height="32" />
											</td>
										</tr>
									</table>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td height="8"></td>
										</tr>
									</table>
									<table width="95%" border="0" align="center" cellpadding="1"
										cellspacing="1">
										<tr>
											<td bgcolor="#B2D0EA">
												<img src="img/login_logo.gif" width="452" height="66" />
											</td>
										</tr>
									</table>						

									<table width="454" border="0" align="center" cellpadding="1"
										cellspacing="1" bgcolor="#B2D0EA">
										<tr>
											<td width="443" height="144" bgcolor="#E8F3FD">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="74%" align="center">
															<table width="90%" border="0" align="center"
																cellpadding="0" cellspacing="0">
																<tr>
																	<td width="22%" height="35" align="right">
																		<img src="img/login_user.gif" width="27" height="24" />
																		&nbsp;&nbsp;
																	</td>
																	<td width="18%">
																		<nobr/>
																			用 户 名： 
																	</td>
																	<td width="60%">
																		<label>
																			<input name="j_username" type="text" class="textbox"/>
																		</label>
																	</td>
																</tr>
																<tr>
																	<td height="35" align="right">
																		<img src="img/login_password.gif" width="27" height="24" />
																		&nbsp;&nbsp;
																	</td>
																	<td>
																		<nobr/>
																			密&nbsp;&nbsp;码： 
																	</td>
																	<td>
																		<input name="j_password" type="password"
																			class="textbox" />
																	</td>
																</tr>
																<tr>
																	<td colspan="3">
															<input id="_spring_security_remember_me" name="_spring_security_remember_me" type="checkbox" value="true" style="vertical-align:middle;"/>
																	<label for="_spring_security_remember_me" style="vertical-align:middle;">下次自动登录 (公共场所慎用)</label>
																	</td>
															</tr>
																<tr>
																	<td height="35">&nbsp;
																		
																	</td>
																	<td colspan="2">
																		<table width="76%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td width="40%" align="center">
																					<label>
																						<input name="submit" type="submit"
																							class="btnsubmit11" value="登 录" />
																					</label>
																				</td>
																				<td width="60%" align="center">
																					<label>
																						<input type="reset" name="reset2" id="reset2"
																							value="取消" class="btnsubmit11" />
																					</label>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
														<td width="26%">
															<img src="img/login_right.gif" width="127" height="111" />
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table width="95%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td>&nbsp;
									
								</td>
							</tr>
						</table>
						<table width="95%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td align="center">
									<img src="img/login_bottom.gif" width="707" height="20" />
								</td>
							</tr>
							<tr>
								<td align="center" style="FONT-SIZE: 12px; COLOR: #ffffff">Copyright © 2012-2018  &nbsp;&nbsp;武汉蓝筹科技有限公司</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<%
   session.invalidate();
%>
