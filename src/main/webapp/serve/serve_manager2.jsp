<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="serve_manager.jsp"%>
	<script>
	baseSql=' and state=2';
	Ext.onReady(function() {
		finishAction.setHidden(false);
		//editAction.setHidden(false);
		//grid.down('#tbar_btn_edit').show();
		//grid.down('#finish').show();
		form.down('#btnFinish').show();
		grid.down('#gridFinish').show();
		form.down('#result').setDisabled(false);
	});
	</script>
	
</head>

</head>
<body>
</body>
</html>
