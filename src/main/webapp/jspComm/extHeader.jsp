<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%@ taglib prefix="sec" uri="/WEB-INF/security.tld"%>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String APP_TITLE = "智慧办公系统";
%>
<c:set var="basePath"
	value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<base href="${basePath}" />
<link rel="stylesheet" type="text/css"
	href="ext/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="css/ext.css" />
<link rel="stylesheet" type="text/css" href="css/left_panel.css" />
<script type="text/javascript" src="ext/ext-all.js"></script>
<script type="text/javascript" src="ext/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="jsComm/params.js"></script>
<script type="text/javascript" src="jsComm/extFunc.js"></script>
<script lang="javascript">
	 var required = '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>';
</script>
