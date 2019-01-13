<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="vBookingList_manager.jsp"%>
	<script>
	baseSql=' and status=1 and state=1';
	Ext.onReady(function() {
		grid.down('#gridRegister').show();
		registerAction.setHidden(false);
	});
	</script>
	
</head>

</head>
<body>
</body>
</html>
