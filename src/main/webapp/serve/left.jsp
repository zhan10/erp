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
				var item1 = Ext
						.create(
								'Ext.Panel',
								{
									title : '预约管理',
									autoScroll : true,
									//html : '&lt;empty panel&gt;',
									items : [

											{
												xtype : 'label',
												html : '<a href="serve/serve_manager1" target="rightFrame"><img src="img/nav/ordersItem2.png" width=48,height=48/><br>待处理</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="serve/serve_manager2" target="rightFrame"><img src="img/nav/ordersItem5.png" width=48,height=48/><br>处理中</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="serve/serve_manager3" target="rightFrame"><img src="img/nav/ordersItem6.png" width=48,height=48/><br>已处理</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="serve/serve_manager" target="rightFrame"><img src="img/nav/ordersItem7.png" width=48,height=48/><br>全部</a><br>'
											} ],
									cls : 'empty'
								});
				var item2 = Ext
						.create(
								'Ext.Panel',
								{
									title : '智慧食堂',
									autoScroll : true,
									//html : '&lt;empty panel&gt;',
									items : [
											{
												xtype : 'label',
												html : '<a href="serve/vOrders_manager1.jsp" target="rightFrame"><img src="img/nav/role5.png" width=48,height=48/><br>待支付订单</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="serve/vOrders_manager2.jsp" target="rightFrame"><img src="img/nav/role2.png" width=48,height=48/><br>待生产订单</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="serve/vOrders_manager3.jsp" target="rightFrame"><img src="img/nav/role3.png" width=48,height=48/><br>待配送订单</a><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="serve/vOrders_manager4.jsp" target="rightFrame"><img src="img/nav/role4.png" width=48,height=48/><br>配送中订单</a><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="serve/vOrders_manager5.jsp" target="rightFrame"><img src="img/nav/role5.png" width=48,height=48/><br>已取消订单</a><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="serve/vOrders_manager6.jsp" target="rightFrame"><img src="img/nav/role5.png" width=48,height=48/><br>已完成订单</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="serve/vOrders_manager.jsp" target="rightFrame"><img src="img/nav/role5.png" width=48,height=48/><br>全部订单</a><br>'

											},{
												xtype : 'label',
												html : '<br><a href="serve/vRecipe_manager" target="rightFrame"><img src="img/nav/role2.png" width=48,height=48/><br>菜品设置</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="serve/recipeType_manager" target="rightFrame"><img src="img/nav/role2.png" width=48,height=48/><br>菜品类型设置</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="serve/vOrdersList_manager" target="rightFrame"><img src="img/nav/role2.png" width=48,height=48/><br>订单细项</a><br>'
											} ],
									cls : 'empty'
								});
				var item3 = Ext
				.create(
						'Ext.Panel',
						{
							title : '超级打印',
							autoScroll : true,
							//html : '&lt;empty panel&gt;',
							items : [

									{
										xtype : 'label',
										html : '<a href="serve/vPrintRecord_manager" target="rightFrame"><img src="img/nav/ordersItem2.png" width=48,height=48/><br>打印记录</a><br>'
									},
									{
										xtype : 'label',
										html : '<br><a href="serve/printStatistics_manager" target="rightFrame"><img src="img/nav/ordersItem5.png" width=48,height=48/><br>打印统计</a><br>'
									},
									{
										xtype : 'label',
										html : '<br><a href="serve/printRate_manager" target="rightFrame"><img src="img/nav/ordersItem6.png" width=48,height=48/><br>打印费率</a><br>'
									} ],
							cls : 'empty'
						});
				var item4 = Ext.create('Ext.Panel', {
					title : '物业管理',autoScroll :true,
					//html : '&lt;empty panel&gt;',
					items : [
					         ],
					cls : 'empty'
				});
				var item5 = Ext.create('Ext.Panel', {
					title : '订餐管理',autoScroll :true,
					//html : '&lt;empty panel&gt;',
					items : [
                            {
                             xtype : 'label',
                             html : '<a  href="http://120.25.224.175:8060/%E8%89%AF%E5%93%81%E9%93%BA%E5%AD%90?vendorId=10" target="rightFrame"><img src="img/nav/shop.png" width=48,height=48/><br>店铺首页</a><br>'
                            },
                            {
                                xtype : 'label',
                                html : '<a  href="http://120.25.224.175:8060/store/products/2" target="rightFrame"><img src="img/nav/shop1.png" width=48,height=48/><br>商品管理</a><br>'
                               },
                            {
                                xtype : 'label',
                                html : '<a  href="http://120.25.224.175:8060/store/addproduct/2" target="rightFrame"><img src="img/nav/shop2.png" width=48,height=48/><br>发布商品</a><br>'
                               },
                            {
                                xtype : 'label',
                                html : '<a  href="http://120.25.224.175:8060/store/orders/2" target="rightFrame"><img src="img/nav/shop3.png" width=48,height=48/><br>销售订单</a><br>'
                               }
					         ],
					cls : 'empty'
				});
				var item6 = Ext.create('Ext.Panel', {
					title : '增值管理',autoScroll :true,
					//html : '&lt;empty panel&gt;',
					items : [
                            {
                                xtype : 'label',
                                html : '<a  href="http://120.25.224.175:8060/%E5%A2%9E%E5%80%BC%E6%9C%8D%E5%8A%A1" target="rightFrame"><img src="img/nav/appreciation.png" width=48,height=48/><br>增值服务首页</a><br>'
                            },{
                                xtype : 'label',
                                html : '<a  href="http://120.25.224.175:8060/store/products/1" target="rightFrame"><img src="img/nav/appreciation1.png" width=48,height=48/><br>增值服务管理</a><br>'
                            },{
                                xtype : 'label',
                                html : '<a  href="http://120.25.224.175:8060/store/addproduct/1" target="rightFrame"><img src="img/nav/appreciation2.png" width=48,height=48/><br>发布增值服务</a><br>'
                            },{
                                xtype : 'label',
                                html : '<a  href="http://120.25.224.175:8060/store/orders/1" target="rightFrame"><img src="img/nav/appreciation3.png" width=48,height=48/><br>增值服务订单</a><br>'
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
									minWidth : 210,
									layout : 'accordion',
									collapsible : true,
									split : true,
									title : '服务管理',
									itemCls : 'required',
									items : [ 
									          item
									          <sec:authorize url="/serve/E">,item5</sec:authorize> 
									          <sec:authorize url="/serve/F">,item6</sec:authorize> 
									          <sec:authorize url="/serve/A">,item1</sec:authorize>
									    
									          /*<sec:authorize url="/serve/B">,item2</sec:authorize>
									          <sec:authorize url="/serve/C">,item3</sec:authorize> 
									          <sec:authorize url="/serve/D">,item4</sec:authorize>*/
									         ],
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