<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="marketing_manager.jsp"%>
	<script>
	baseSql=' and status=3 and statusBit=1';
	Ext.onReady(function() {
		addAction.setHidden(true);
		editAction.setHidden(true);
		delAction.setHidden(true);
		regainAction.setHidden(false);
		invalidAction.setHidden(false);
		grid.down('#tbar_btn_add').hide();
		grid.down('#tbar_btn_edit').hide();
		grid.down('#tbar_btn_delete').hide();
		grid.down('#gridRegain').show();
		grid.down('#gridInvalid').show();
	});
	</script>
	
</head>

</head>
<body>
</body>
</html>
