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

				// sample static data for the store
                var item=Ext.create('Ext.Panel',{title:'',autoScroll:true,hidden:true});
				var item1 = Ext
						.create(
								'Ext.Panel',
								{
									title : '客户管理',
									//html : '&lt;empty panel&gt;',
									items : [

											{
												xtype : 'label',
												html : '<a href="crm/consumer_manager" target="rightFrame"><img src="img/nav/information4.png" width=48,height=48/><br>客户信息</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="crm/vConsumeRecord_manager" target="rightFrame"><img src="img/nav/information5.png" width=48,height=48/><br>消费记录</a><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="crm/vRechargeRecord_manager" target="rightFrame"><img src="img/nav/information6.png" width=48,height=48/><br>充值记录</a><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="crm/vDamage_manager" target="rightFrame"><img src="img/nav/information7.png" width=48,height=48/><br>赔偿记录</a><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="crm/vRefundRecord_manager" target="rightFrame"><img src="img/nav/information8.png" width=48,height=48/><br>退款记录</a><br>'

											} ],
									cls : 'empty'
								});

				var item2 = Ext
						.create(
								'Ext.Panel',
								{
									title : '<center>健康管理</center>',
									//html: '&lt;empty panel&gt;',
									items : [

											{
												xtype : 'label',
												html : '<a href="crm/health_manager" target="rightFrame"><img src="img/nav/information2.png" width=48,height=48/><br>健康管理</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="crm/vHealth_manager" target="rightFrame"><img src="img/nav/information3.png" width=48,height=48/><br>健康档案</a><br>'

											} ],
									cls : 'empty'
								});
				var item3 = Ext
						.create(
								'Ext.Panel',
								{
									title : '消费参数设置',
									autoScroll : true,
									//html : '&lt;empty panel&gt;',
									items : [
											{
												xtype : 'label',
												html : '<a href="crm/consumeArea_manager" target="rightFrame"><img src="img/nav/mation5.png" width=48,height=48/><br>消费区域设置</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="crm/paymentType_manager" target="rightFrame"><img src="img/nav/mation6.png" width=48,height=48/><br>支付类型设置</a><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="crm/consumeType_manager" target="rightFrame"><img src="img/nav/mation4.png" width=48,height=48/><br>消费类型设置</a><br>'

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
									layout : 'accordion',
									collapsible : true,
									split : true,
									title : '客户管理',
									itemCls : 'required',
									items : [ item<sec:authorize url="/crm/A">,item1</sec:authorize>
									<sec:authorize url="/crm/B">,item2</sec:authorize><sec:authorize url="/crm/C">,item3</sec:authorize>],
									listeners : {

										'collapse' : function(e, eOpts) {
											parent.top.document
													.getElementById("mset").cols = "40,*";

										},
										'beforeexpand' : function(p, animate,
												eOpts) {
											animate = false;
											parent.top.document
													.getElementById("mset").cols = "225,*";
										}
									}
								});

				var viewport = Ext.create('Ext.Viewport', {
					layout : 'border',
					items : [ accordion, {
						region : 'center',
						margins : '5 5 5 50',
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
