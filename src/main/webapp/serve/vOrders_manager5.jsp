<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="vOrders_manager.jsp"%>
	<script>
	baseSql=' and status=4';
	Ext.onReady(function() {
		delAction.setHidden(true);
		grid.down('#tbar_btn_delete').hide();
		grid.down('#expire').hide();
	})
	</script>
	
</head>

</head>
<body>
</body>
</html>
