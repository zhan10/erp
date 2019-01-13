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
				var item1 = Ext
						.create(
								'Ext.Panel',
								{
									title : '订单管理',
									autoScroll : true,
									//html : '&lt;empty panel&gt;',
									items : [
											{
												xtype : 'label',
												html : '<a href="restaurant/vOrders_manager.jsp" target="rightFrame"><img src="img/nav/role.png"/><br>待支付订单</a><br><br>'
											},
											{
												xtype : 'label',
												html : '<a href="system/users_manager" target="rightFrame"><img src="img/nav/role.png"/><br>待生产订单</a><br><br>'
											},
											{
												xtype : 'label',
												html : '<a href="system/roles_manager" target="rightFrame"><img src="img/nav/role.png"/><br>待配送订单</a><br><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="system/roles_usersManager" target="rightFrame"><img src="img/nav/user.png"/><br>配送中订单</a><br><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="system/resource_manager" target="rightFrame"><img src="img/nav/security.png"/><br>已完成订单</a><br><br>'

											}],
									cls : 'empty'
								});
				var item2 = Ext
						.create(
								'Ext.Panel',
								{
									title : '菜品设置',
									autoScroll : true,
									//html : '&lt;empty panel&gt;',
									items : [
											{
												xtype : 'label',
												html : '<a href="restaurant/vRecipe_manager" target="rightFrame"><img src="img/information.ico"/><br>菜品设置</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="restaurant/recipeType_manager" target="rightFrame"><img src="img/information.ico"/><br>菜品类型设置</a><br>'

											} ],
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
									minWidth : 210,
									layout : 'accordion',
									collapsible : true,
									split : true,
									title : '智慧食堂管理',
									itemCls : 'required',
									items : [ item1, item2],
									listeners : {

										'collapse' : function(e, eOpts) {
											parent.top.document
													.getElementById("mset").cols = "40,*";

										},
										'beforeexpand' : function(p, animate,
												eOpts) {
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



