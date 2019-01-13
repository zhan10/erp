<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="vBookingVisitDefine.jsp"%>
	<%@ include file="vBookingVisitDataExt.jsp"%>
	<script type="text/javascript" src="ini/getOrderVisitDs.js"></script>
	<script type="text/javascript" src="request/commonality.js"></script>
	<!-- 引入日期时间控件 -->
	<script type="text/javascript" src="dateTime/UX_TimePickerField.js"></script>
	<script type="text/javascript" src="dateTime/UX_DateTimePicker.js"></script>
	<script type="text/javascript" src="dateTime/UX_DateTimeMenu.js"></script>
	<script type="text/javascript" src="dateTime/UX_DateTimeField.js"></script>
	<%@ include file="vBookingVisitFormExt.jsp"%>
	<%@ include file="vBookingVisitSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);
			batchWin=getWindow('批量修改',320,160,320,160,batchForm);
			ds = getDs(mainFields, 'order/vBookingVisit!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#btnConfirm').setDisabled(selections.length != 1);
						grid.down('#btnAccomplish').setDisabled(selections.length != 1);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('consumerName', 80, '',0, '<s:text name="orderVisitConsumer.name" />'),
					'-',
					getTextField('productType', 80, '',0, '<s:text name="orderVisitProduct.type" />'),
					'-',
					getTextField('buildingName', 80, '',0, '<s:text name="orderVisitBuilding.name" />'),
					'-',
					Ext.create('Ext.form.DateField',{
		            	name:'appointTime',
		            	itemId:'appointTime',
		                width : 100,
		                format : 'Y-m-d',
		                emptyText:'预约时间'
	                }),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['consumerName', '<s:text name="orderVisitConsumer.name" />']
							,['productType', '<s:text name="orderVisitProduct.type" />']
							,['city', '<s:text name="orderVisit.city" />']
							,['area', '<s:text name="orderVisit.area" />']
							,['buildingName', '<s:text name="orderVisitBuilding.name" />']
							,['floorName', '<s:text name="orderVisitFloor.name" />']
							,['productName', '<s:text name="orderVisitProduct.name" />']
							,['appointTime', '<s:text name="orderVisitAppoint.time" />']
							,['visitTime', '<s:text name="orderVisit.time" />']
							,['createTime', '<s:text name="orderVisitCreate.time" />']
						]
					}),
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderType',
						width : 60,
						value : 'asc',
						hideLabel : true,
						mode : 'local',
						selectOnFocus : true,
						editable : false,
						store : [['asc','顺序' ],['desc','倒序' ]]
					}),
					{
						text : '查询',
						iconCls : 'search',
						handler : function() {
							sqlStr = "";
							t_sql = "";
							try {
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('appointTime').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',appointTime)=0";
								t_sql = tbar.getComponent('consumerName').getValue();
								if (t_sql != "")
									sqlStr += " and consumer_name like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('productType').getValue();
								if (t_sql != "")
									sqlStr += " and product_type like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('buildingName').getValue();
								if (t_sql != "")
									sqlStr += " and building_name like '%"+ t_sql+ "%' ";
								var orderBy = tbar.getComponent('orderBy').getValue();
								if (orderBy != ''){
									order = " order by "+ orderBy;
									var orderType = tbar.getComponent('orderType').getValue();
									if (orderType == 'desc')
										order += " desc";
								}
							}catch(e){
								Ext.MessageBox.alert('错误', '查询条件有误' + e);
							}
							Ext.apply(
								ds.proxy.extraParams,{whereSql : sqlStr,order : order});
								ds.loadPage(1);
							}
						},
						'->','-'
						 <sec:authorize url="/request/vBookingVisit!confirm">
						,Ext.create('Ext.Button', {
							text : '确定时间',
							tooltip : '确定参观时间',
							hidden : true,
							disabled : true,
							iconCls : 'check',
							itemId :'btnConfirm',
							handler : function(){
								Ext.MessageBox.confirm('确定参观时间', '您是否确认已选中的这' + sm.getCount()
										+ '条记录，请仔细核对记录！', function(btn) {
									if (btn == 'yes') {
										editWin(win,winTitle+'——确认时间', sm);
										form.down('#state').setReadOnly(true);
										form.down('#consumerName').setReadOnly(true);
										form.down('#productType').setReadOnly(true);
										form.down('#city').setReadOnly(true);
										form.down('#area').setReadOnly(true);
										form.down('#buildingName').setReadOnly(true);
										form.down('#floorName').setReadOnly(true);
										form.down('#productName').setReadOnly(true);
										form.down('#createTime').setReadOnly(true);
										form.down('#appointTime').setReadOnly(true);
										form.down('#opinion').setReadOnly(true);
										form.down('#btnConfirm').show();
									}
								});
							}
						})	
						</sec:authorize> 
						<sec:authorize url="/request/vBookingVisit!accomplish">
						,Ext.create('Ext.Button', {
							text : '参观完成',
							tooltip : '确定参观完成',
							hidden : true,
							disabled : true,
							iconCls : 'check',
							itemId :'btnAccomplish',
							handler : function(){
								Ext.MessageBox.confirm('参观完成', '您是否确认已选中的这' + sm.getCount()
										+ '条记录，请仔细核对记录！', function(btn) {
									if (btn == 'yes') {
										editWin(win,winTitle+'——参观完成', sm);
										form.down('#state').setReadOnly(true);
										form.down('#consumerName').setReadOnly(true);
										form.down('#productType').setReadOnly(true);
										form.down('#city').setReadOnly(true);
										form.down('#area').setReadOnly(true);
										form.down('#buildingName').setReadOnly(true);
										form.down('#floorName').setReadOnly(true);
										form.down('#productName').setReadOnly(true);
										form.down('#createTime').setReadOnly(true);
										form.down('#appointTime').setReadOnly(true);
										form.down('#visitTime').setReadOnly(true);
										form.down('#remark').setReadOnly(true);
										form.down('#btnAccomplish').show();
									}
								});
							}
						})	
						</sec:authorize> 
						<sec:authorize url="/request/vBookingVisit!del">
						,getDelButton(ds, sm, 'order/vBookingVisit!delete','删除')
						</sec:authorize>
						,getComSearchButton(searchWin,'复合查询')
					]
				});
				bbar = getBbar(ds);
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						showWin(win, winTitle+'——查看',sm);
						form.down('#btnConfirm').hide();
						form.down('#btnAccomplish').hide();
					}
				});
				editAction = Ext.create('Ext.Action', {
					iconCls: 'check',
					hidden : true,
					 text: '确定时间',
					 handler : function(){
							Ext.MessageBox.confirm('确定参观时间', '您是否确认已选中的这' + sm.getCount()
									+ '条记录，请仔细核对记录！', function(btn) {
								if (btn == 'yes') {
									editWin(win,winTitle+'——确认时间', sm);
									form.down('#state').setReadOnly(true);
									form.down('#consumerName').setReadOnly(true);
									form.down('#productType').setReadOnly(true);
									form.down('#city').setReadOnly(true);
									form.down('#area').setReadOnly(true);
									form.down('#buildingName').setReadOnly(true);
									form.down('#floorName').setReadOnly(true);
									form.down('#productName').setReadOnly(true);
									form.down('#createTime').setReadOnly(true);
									form.down('#appointTime').setReadOnly(true);
									form.down('#btnConfirm').show();
								}
							});
						}
				});
				accomplishAction = Ext.create('Ext.Action', {
					iconCls: 'check',
					 text: '参观完成',
					 hidden : true,
					 handler : function(){
							Ext.MessageBox.confirm('参观完成', '您是否确认已选中的这' + sm.getCount()
									+ '条记录，请仔细核对记录！', function(btn) {
								if (btn == 'yes') {
									editWin(win,winTitle+'——参观完成', sm);
									form.down('#state').setReadOnly(true);
									form.down('#consumerName').setReadOnly(true);
									form.down('#productType').setReadOnly(true);
									form.down('#city').setReadOnly(true);
									form.down('#area').setReadOnly(true);
									form.down('#buildingName').setReadOnly(true);
									form.down('#floorName').setReadOnly(true);
									form.down('#productName').setReadOnly(true);
									form.down('#createTime').setReadOnly(true);
									form.down('#appointTime').setReadOnly(true);
									form.down('#visitTime').setReadOnly(true);
									form.down('#remark').setReadOnly(true);
									form.down('#btnAccomplish').show();
								}
							});
						}
				});
				delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					hidden : true,
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'order/vBookingVisit!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction ,'-'
						<sec:authorize url="/request/vBookingVisit!confirm">,editAction</sec:authorize>
						<sec:authorize url="/request/vBookingVisit!accomplish">,accomplishAction</sec:authorize>
						<sec:authorize url="/request/vBookingVisit!del">,delAction</sec:authorize> 
					]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.down('#tbar_btn_delete').hide();
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					form.down('#btnConfirm').hide();
					form.down('#btnAccomplish').hide();
				});
				grid.on('itemcontextmenu',function(view, rec, node, index, e) {
					e.stopEvent();
					contextMenu.showAt(e.getXY());
					return false;
				});
				var viewport = Ext.create('Ext.Viewport', {
							layout : 'fit',
							items : grid
					});	
		});
		
	</script>
</body>
</html>
