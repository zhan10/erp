<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="vBooking_manager.jsp"%>
	<script>
	baseSql=' and status=3';
	Ext.onReady(function() {
		form.down('#btnRefuse').show();
		backAction.setHidden(false);
		delAction.setHidden(true);
		grid.down('#tbar_btn_delete').hide();
		grid.down('#gridBack').show();
		grid.down('#status').hide();
	});
	</script>
	
</head>

</head>
<body>
</body>
</html>
