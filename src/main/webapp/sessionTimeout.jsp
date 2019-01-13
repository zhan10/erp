<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<html>
<body>
<script type="text/javascript">
	alert("对不起,长时间未进行操作，请重新登录!");
	location.replace("<c:url value='/login.jsp'/>");
</script>
</body>
</html>