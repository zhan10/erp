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
				title : '需求管理',autoScroll :true,
				//html : '&lt;empty panel&gt;',
				items : [{
					xtype : 'label',
					html : '<a href="request/requirementBooking_manager1" target="rightFrame"><img src="img/nav/od2.png" width=48,height=48/><br>未处理需求</a><br>'
				},{
					xtype : 'label',
					html : '<br><a href="request/requirementBooking_manager2" target="rightFrame"><img src="img/nav/od2.png" width=48,height=48/><br>已处理需求</a><br>'
				}
				],
				cls : 'empty'
			});
			var item2 = Ext.create('Ext.Panel', {
				title : '预约参观管理',autoScroll :true,
				//html : '&lt;empty panel&gt;',
				items : [{
					xtype : 'label',
					html : '<br><a href="request/vBookingVisit_manager1" target="rightFrame"><img src="img/nav/od3.png" width=48,height=48/><br>已预约</a><br><br>'
				},{
					xtype : 'label',
					html : '<br><a href="request/vBookingVisit_manager2" target="rightFrame"><img src="img/nav/od4.png" width=48,height=48/><br>已确定</a><br><br>'
				},{
					xtype : 'label',
					html : '<br><a href="request/vBookingVisit_manager3" target="rightFrame"><img src="img/nav/od4.png" width=48,height=48/><br>参观中</a><br><br>'
				},{
					xtype : 'label',
					html : '<br><a href="request/vBookingVisit_manager4" target="rightFrame"><img src="img/nav/od5.png" width=48,height=48/><br>已过期</a><br><br>'
				},{
					xtype : 'label',
					html : '<br><a href="request/vBookingVisit_manager5" target="rightFrame"><img src="img/nav/od6.png" width=48,height=48/><br>已完成</a><br><br>'
				},{
					xtype : 'label',
					html : '<br><a href="request/vBookingVisit_manager" target="rightFrame"><img src="img/nav/od7.png" width=48,height=48/><br>全部</a><br><br>'
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
								title : '预约管理',									
								itemCls:'required',
								items : [ item<sec:authorize url="/request/A">,item1</sec:authorize><sec:authorize url="/request/B">,item2</sec:authorize>],
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

				

