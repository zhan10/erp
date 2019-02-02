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
				title : '财务管理',autoScroll :true,
				//html : '&lt;empty panel&gt;',
				items : [{
					xtype : 'label',
					html : '<a href="finance/vDailyReport_manager" target="rightFrame"><img src="img/nav/if2.png" width=48,height=48/><br>日报表</a><br>'
				},{
					xtype : 'label',
					html : '<br><a href="finance/vMonthlyReport_manager" target="rightFrame"><img src="img/nav/if3.png" width=48,height=48/><br>月报表</a><br>'
				}],
				cls : 'empty'
			});
			var item2 = Ext.create('Ext.Panel', {
				title : '收款项目管理',autoScroll :true,
				//html : '&lt;empty panel&gt;',
				items : [{
					xtype : 'label',
	                  html : '<a href="finance/receipt_manager" target="rightFrame"><img src="img/nav/ordersItem2.png" width=48,height=48/><br>收款项目管理</a><br>'  
				}],
				cls : 'empty'
			});
			var item3 = Ext.create('Ext.Panel', {
				title : '合同管理',autoScroll :true,
				//html : '&lt;empty panel&gt;',
				items : [{
					xtype : 'label',
					html : '<br><a href="finance/vRentContract_manager.jsp" target="rightFrame"><img src="img/nav/oo2.png" width=48,height=48/><br>租赁合同</a><br><br>'
				}],
				cls : 'empty'
			});
			var item4  = Ext.create('Ext.Panel', {
				title : '订单审核',autoScroll :true,
				//html : '&lt;empty panel&gt;',
				items : [{
					xtype : 'label',
					html : '<br><a href="finance/vErpOrders_manager.jsp" target="rightFrame"><img src="img/nav/if2.png" width=48,height=48/><br>订单审核</a><br><br>'
				}],
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
								title : '财务管理',									
								itemCls:'required',
								items : [ <sec:authorize url="/finance/A">item4</sec:authorize>],
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
			
			var images = Ext.query(".x-component img");
			Ext.each(images,function(img){
				Ext.fly(img).addCls("iconSize");
			});
		});
</script>
</head>
<body>
</body>
</html>

				


				

