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
Ext
		.onReady(function() {
			var left_item1 = Ext.create('Ext.Panel', {
				title : '权限管理',autoScroll :true,
				//html : '&lt;empty panel&gt;',
				items : [{
					xtype : 'label',
					html : '<a href="system/roles_manager" target="rightFrame"><img src="img/nav/ro3.png" width=48,height=48/><br>角色－用户</a><br>'
				},
				{
					xtype : 'label',
					html : '<br><a href="system/roles_usersManager" target="rightFrame"><img src="img/nav/ro4.png" width=48,height=48/><br>用户－角色</a><br>'
				
				}, {
					xtype : 'label',
					html : '<br><a href="system/resource_manager" target="rightFrame"><img src="img/nav/security.png"/><br>资源配置</a><br>'
				
				}],
				cls : 'empty'
			});
			var left_item2 = Ext.create('Ext.Panel', {
				title : '参数设置',autoScroll :true,
				//html : '&lt;empty panel&gt;',
				items : [										
					{
						xtype : 'label',
						html : '<a href="system/vStore_manager" target="rightFrame"><img src="img/information.ico"/><br>仓库设置</a><br>'
					},
					{
						xtype : 'label',
						html : '<br><a href="system/degradeReason_manager" target="rightFrame"><img src="img/information.ico"/><br>缺陷设置</a><br>'
					
					}, {
						xtype : 'label',
						html : '<br><a href="system/roleResource_manager" target="rightFrame"><img src="img/information.ico"/><br>资源配置</a><br>'
					
					}],
									cls : 'empty'
			});
			vv=Ext.create('Ext.Panel', {
					layout : 'accordion',
   					width: 500,
				    height: 400,
				    defaults: {
				        bodyPadding: 10
				    },
				    items: [ left_item1,left_item2,{
				                title: 'Accordion Item 2',
				                html: 'Empty'
				            }, {
				                title: 'Accordion Item 3',
				                html: 'Empty'
				            }, {
				                title: 'Accordion Item 4',
				                html: 'Empty'
				            }, {
				                title: 'Accordion Item 5',
				                html: 'Empty'
				            }]
				});
				   
				/*var viewport = Ext.create('Ext.Viewport', {
					layout : 'border',
					items : [vv, {
						region : 'center',
						margins : '5 5 5 500',
						cls : 'empty',
						bodyStyle : 'background:#f1f1f1'
					} ]
				});*/
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
				items:vv,
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
</head>
<body>
</body>
</html>