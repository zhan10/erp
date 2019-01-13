<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="marketing_manager.jsp"%>
	<script>
	baseSql=' and status=2 and statusBit=1';
	Ext.onReady(function() {
		addAction.setHidden(true);
		delAction.setHidden(true);
		quitAction.setHidden(false);
		invalidAction.setHidden(false);
		grid.down('#tbar_btn_add').hide();
		grid.down('#tbar_btn_delete').hide();
		grid.down('#gridQuit').show();
		grid.down('#gridInvalid').show();
	});
	</script>
	
</head>

</head>
<body>
</body>
</html>
