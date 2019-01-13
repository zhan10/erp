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
									title : '产品设置',
									autoScroll : true,
									//html : '&lt;empty panel&gt;',
									items : [		
											{
												xtype : 'label',
												html : '<a href="product/vWorkbench_manager" target="rightFrame"><img src="img/nav/mat2.png" width=48,height=48/><br>移动办公空间</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="product/vOffice_manager" target="rightFrame"><img src="img/nav/mat3.png" width=48,height=48/><br>智创空间</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="product/vTelRoom_manager" target="rightFrame"><img src="img/nav/mat6.png" width=48,height=48/><br>网真高清视频会议室</a><br>'
											},	
											{
												xtype : 'label',
												html : '<br><a href="product/vMeetingRoom_manager" target="rightFrame"><img src="img/nav/mat4.png" width=48,height=48/><br>标准会议室</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="product/vVipRoom_manager" target="rightFrame"><img src="img/nav/mat7.png" width=48,height=48/><br>接待室</a><br>'
											},
											{
												xtype : 'label',
												html : '<br><a href="product/vCultivate_manager.jsp" target="rightFrame"><img src="img/nav/mat7.png" width=48,height=48/><br>培训室</a><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="product/vExhibitionRoom_manager" target="rightFrame"><img src="img/nav/mat5.png"  width=48,height=48/><br>企业智慧展厅</a><br>'
											},			
											],
									cls : 'empty'
								});
				var item2 = Ext
						.create(
								'Ext.Panel',
								{
									title : '产品参数设置',
									autoScroll : true,
									//html : '&lt;empty panel&gt;',
									items : [
											{
												xtype : 'label',
												html : '<a href="product/workbenchType_manager" target="rightFrame"><img src="img/nav/mation7.png" width=48,height=48/><br>移动办公空间类型设置</a><br><br>'
											
											},
									        {
												xtype : 'label',
												html : '<a href="product/officeType_manager" target="rightFrame"><img src="img/nav/mation8.png" width=48,height=48/><br>智创空间类型设置</a><br>'

											},
											/* {
												xtype : 'label',
												html : '<br><a href="product/workbenchType_manager" target="rightFrame"><img src="img/nav/mation7.png" width=48,height=48/><br>移动办公空间类型设置</a><br>'

											}, */
											/*{
												xtype : 'label',
												html : '<br><a href="product/productType_manager" target="rightFrame"><img src="img/nav/mation5.png" width=48,height=48/><br>产品类型设置</a><br>'

											},*/
											{
												xtype : 'label',
												html : '<br><a href="product/city_manager" target="rightFrame"><img src="img/nav/mation4.png" width=48,height=48/><br>城市设置</a><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="product/vArea_manager" target="rightFrame"><img src="img/nav/mation5.png" width=48,height=48/><br>区域设置</a><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="product/vCircle_manager" target="rightFrame"><img src="img/nav/mation6.png" width=48,height=48/><br>商圈设置</a><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="product/vBuilding_manager" target="rightFrame"><img src="img/nav/mation7.png" width=48,height=48/><br>楼盘设置</a><br>'

											},
											{
												xtype : 'label',
												html : '<br><a href="product/vFloor_manager" target="rightFrame"><img src="img/nav/mation8.png" width=48,height=48/><br>楼层设置</a><br>'

											},
											],
									cls : 'empty'
								});
								var item3 = Ext
						.create(
								'Ext.Panel',
								{
									title : '服务设施设置',
									autoScroll : true,
									//html : '&lt;empty panel&gt;',
									items : [
									        {
												xtype : 'label',
												html : '<a href="product/roomFacilities_manager" target="rightFrame"><img src="img/nav/mation8.png" width=48,height=48/><br>房间设施设置</a><br>'

											},
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
									title : '产品管理',
									itemCls : 'required',
									items : [ 
									          item
									          <sec:authorize url="/product/A">,item1</sec:authorize>
									          <sec:authorize url="/product/B">,item2</sec:authorize>
									          <sec:authorize url="/product/C">,item3</sec:authorize>
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
