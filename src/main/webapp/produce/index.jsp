<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<%@ include file="../jspComm/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=APP_TITLE%></title>
</head>
<frameset rows="70,*" cols="*" frameborder="NO" border="0" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="NO" noresize >
  <frameset rows="*" cols="225,*" framespacing="0" frameborder="NO" border="0" id="mset">
    <frame src="produce/left.jsp" name="leftFrame" scrolling="NO" noresize>
    <frame src="main.jsp" name="rightFrame">
  </frameset>
</frameset>
</html>
