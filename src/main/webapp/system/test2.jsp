<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="left2.jsp"%>
	<link rel="stylesheet" type="text/css" href="css/left_panel.css" />
</head>
<body>dsssssssssss
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*', 'Ext.tree.*' ]);
		Ext.onReady(function() {			
			var viewport = Ext.create('Ext.Viewport', {
				layout: {
		            type: 'border'
		        },
		        defaults: {
		            split: true
		        },
		        items: [{
		            region: 'north',
		           	frame:false,
		            split: true,
		            height: 70,
		            loader:{ url: "top.jsp",autoLoad:true}
		        },
		        {
		            region: 'west',
		            //collapsible: true,
		           layout : 'border',
				/*items : [ left_accordion, {
					region : 'center',
					margins : '5 5 5 500',
					cls : 'empty',
					bodyStyle : 'background:#f1f1f1'
				} */
				items:Ext.create('KitchenSink.view.layout.Accordion')
				],
		            //split: true,		          
		            width:250
		            //loader:{ url: "system/left.jsp",autoLoad:true, scripts: true}
		        },{
		            region: 'center',
		            split: true,
		            height: 100,
		            minHeight: 60
		        }]
			});	
		});
</script>
</body>
</html>
