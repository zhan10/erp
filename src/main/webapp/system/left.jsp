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
			var item=Ext.create('Ext.Panel',{title:'',autoScroll:true,hidden:true});
			var item1 = Ext.create('Ext.Panel', {
				title : '权限管理',autoScroll :true,
				//html : '&lt;empty panel&gt;',
				items : [{
					xtype : 'label',
					html : '<a href="system/users_manager" target="rightFrame"><img src="img/nav/ro2.png" width=48,height=48/><br>用户管理</a><br><br>'
				},{
					xtype : 'label',
					html : '<a href="system/roles_manager" target="rightFrame"><img src="img/nav/ro3.png" width=48,height=48/><br>角色管理</a><br><br>'
				},
				{
					xtype : 'label',
					html : '<br><a href="system/roles_usersManager" target="rightFrame"><img src="img/nav/ro4.png" width=48,height=48/><br>为用户分配角色</a><br><br>'
				
				}, {
					xtype : 'label',
					html : '<br><a href="system/resource_manager" target="rightFrame"><img src="img/nav/ro5.png" width=48,height=48/><br>资源分配</a><br><br>'
				
				}, {
					xtype : 'label',
					html : '<br><a href="system/resource_rolesManager" target="rightFrame"><img src="img/nav/ro6.png" width=48,height=48/><br>为角色分配资源</a><br><br>'
				
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
								title : '系统管理',									
								itemCls:'required',
								items : [ item<sec:authorize url="/system/A">,item1</sec:authorize>],
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

				

