<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<%@ include file="../jspComm/extHeader.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/left_panel.css" />
<script type="text/javascript">
	Ext.require([ '*' ]);

	Ext.onReady(function() {
				var item=Ext.create('Ext.Panel',{title:'',autoScroll:true,hidden:true});
				var item1 = Ext.create('Ext.Panel', {
					title : '全局订单',autoScroll :true,
					//html : '&lt;empty panel&gt;',
					items : [
								{
									xtype : 'label',
									html : '<br><a href="all/vErpOrders_manager" target="rightFrame"><img src="img/nav/ordersItem7.png" width=48,height=48/><br>全局订单</a><br>'
							    }
							],
					cls : 'empty'
				});
				
				var accordion = Ext
						.create(
								'Ext.Panel',
								{
									
									region : 'west',
									margins : '5 0 5 5',
									//split : true,
									width : 210,
									minWidth:210,
									layout : 'accordion',
									collapsible : true, split: true,
									title : '全局订单',									
									itemCls:'required',
									items : [<sec:authorize url="/factory/order">item1</sec:authorize>],
									listeners : {
									
										'collapse' : function(e, eOpts) {
											parent.top.document
													.getElementById("mset").cols = "40,*";
											
										},										
										'beforeexpand': function(p,animate,eOpts) {	
										//animate=false;
											parent.top.document
													.getElementById("mset").cols = "225,*";
										},
										'float' : function(p) {
											this.expand();
										}
									}
								});

				var viewport = Ext.create('Ext.Viewport', {
					layout : 'border',
					items : [ accordion, {
						region : 'center',
						margins : '5 5 5 500',
						cls : 'empty',
						bodyStyle : 'background:#f1f1f1'
					} ]
				});
			
				
			});
</script>
</head>
<body>
</body>
</html>