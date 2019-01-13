<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="vBookingVisit_manager.jsp"%>
	<script>
	baseSql=' and state=2';
	Ext.onReady(function() {
		//grid.down('#btnConfirm').hide();
		form.down('#btnConfirm').hide();
		grid.down('#tbar_btn_delete').hide();
		grid.down('#btnConfirm').hide();
		grid.down('#btnAccomplish').show();
		accomplishAction.show();
		editAction.hide();
		delAction.hide();
	})
	</script>
	
</head>

</head>
<body>
</body>
</html>
