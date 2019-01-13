<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<%@ include file="../jspComm/extHeader.jsp"%>
<%@ include file="vBookingOfficeDefine.jsp"%>
<%@ include file="vBookingOfficeDataExt.jsp"%>
<%@ include file="vBookingOfficeFormExt.jsp"%>
<%@ include file="vBookingOfficeSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,350,form);
			balanceWin=getWindow('订单结算',600,300,320,160,balanceForm);
			ds = getDs(mainFields, 'produce/vBookingOffice!managerExt', baseSql,order);
			ds.load();


			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);						
					}
				}
			});
			
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'balance',
						width : 80,value:-1,						
						hideLabel : true,
						mode : 'local',
						selectOnFocus : true,
						editable : false,
						store : [[-1,'结算状态' ],[0,'未结算' ],[1,'已结算' ]]
					}),					
					'-',
						Ext.create('Ext.form.field.ComboBox',{
						itemId : 'expire',
						width : 80,value:-1,						
						hideLabel : true,
						mode : 'local',
						selectOnFocus : true,
						editable : false,
						store : [[-1,'过期状态' ],[0,'正常' ],[1,'已过期' ],[2,'7日内到期']]
					}),					
					'-',
					 Ext.create('Ext.form.DateField',{
	                  name:'dateFrom',
	                  id : 'dateFrom',
	                  width : 90,
	                  format : 'Y-m-d',
	                  emptyText:'开始时间'
                      }),		
                      '-',
					getTextField('code', 100, '',0, '<s:text name="vBookingOffice.code" />'),
					'-',
					getTextField('cityName', 60, '',0, '<s:text name="vBookingOffice.cityName" />'),
					'-',
					getTextField('buildingName', 60, '',0, '<s:text name="vBookingOffice.buildingName" />'),
					'-',
					getTextField('officeName',60, '',0, '<s:text name="vBookingOffice.officeName" />'),
					'-',
					getTextField('consumerName', 60, '',0, '<s:text name="vBookingOffice.consumerName" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ],['code', '<s:text name="vBookingOffice.code" />']
							,['name', '<s:text name="vBookingOffice.officeName" />']
							,['consumerName', '<s:text name="vBookingOffice.consumerName" />']
							,['buildingName', '<s:text name="vBookingOffice.buildingName" />']
							,['dateFrom', '<s:text name="vBookingOffice.dateFrom" />']
							,['dateTo', '<s:text name="vBookingOffice.dateTo" />']
							,['total', '<s:text name="vBookingOffice.total" />']
							,['balanceTime', '<s:text name="vBookingOffice.balanceTime" />']
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
								t_sql = tbar.getComponent('balance').getValue();
								if (t_sql != -1)
										sqlStr += " and balance="+t_sql;	
								t_sql = tbar.getComponent('expire').getValue();							
								if (t_sql!=-1){	
									if(t_sql==0)
										sqlStr += " and dateTo>"+Ext.Date.format(new Date(),'Y-m-d');
									if(t_sql==1)
										sqlStr += " and dateTo<="+Ext.Date.format(new Date(),'Y-m-d');	
									if(t_sql==2)
										sqlStr += " and datediff(day,'"+Ext.Date.format(new Date(),'Y-m-d')+"',dateTo)<=7";		
								}
								t_sql = tbar.getComponent('code').getValue();
								if (t_sql != "")
									sqlStr += " and code like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('cityName').getValue();
								if (t_sql != "")
									sqlStr += " and cityName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('buildingName').getValue();
								if (t_sql != "")
									sqlStr += " and buildingName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('officeName').getValue();
								if (t_sql != "")
									sqlStr += " and officeName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('consumerName').getValue();
								if (t_sql != "")
									sqlStr += " and consumerName like '%"+ t_sql+ "%' ";
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('dateFrom').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',dateFrom)=0";
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
						<sec:authorize url="/produce/vBookingOffice!balance">
						,Ext.create('Ext.Button', {
							text : '结算',
							tooltip : '订单结算',
							iconCls : 'balance',
							handler : function() {
								if (sm.getCount() < 1) {
									Ext.MessageBox.alert('提示', '请选择待结算的记录！');
									return;
								}
								if (sm.getCount() > 1) {
									Ext.MessageBox.alert('提示', '只能选择一条待结算的记录！');
									return;
								}							
								if (((sm.getSelection())[0]).get('balance') ) {
									Ext.MessageBox.alert('提示', '此订单已经结算！');
									return;
								}
								Ext.MessageBox.confirm('结算确认', '您是否确认结算已选中的这' + sm.getCount()
											+ '条记录，请仔细核对要结算的记录！', function(btn) {
									if (btn == 'yes') {
										showWin(balanceWin, '订单结算',sm);
										balanceForm.down('#balanceTime').setValue(Ext.Date.format(new Date(),'Y-m-d H:i:s'));
										balanceForm.down('#btnCancelBalance').hide();
										balanceForm.down('#btnBalance').show();
									}
								});
							///	
							}
						})
						</sec:authorize>
						<sec:authorize url="/produce/vBookingOffice!nobalance">
						,Ext.create('Ext.Button', {
							text : '取消结算',
							tooltip : '取消订单结算',
							iconCls : 'cancelBalance',
							handler : function() {
								if (sm.getCount() < 1) {
									Ext.MessageBox.alert('提示', '请选择待取消结算的记录！');
									return;
								}
								if (sm.getCount() > 1) {
									Ext.MessageBox.alert('提示', '只能选择一条待取消结算的记录！');
									return;
								}							
								if (!((sm.getSelection())[0]).get('balance') ) {
									Ext.MessageBox.alert('提示', '此订单没有结算！');
									return;
								}
								Ext.MessageBox.confirm('取消结算确认', '您是否确认取消结算已选中的这' + sm.getCount()
											+ '条记录，请仔细核对要取消结算的记录！', function(btn) {
									if (btn == 'yes') {
										showWin(balanceWin, '订单取消结算',sm);
										//balanceForm.down('#balanceTime').setValue(Ext.Date.format(new Date(),'Y-m-d H:i:s'));
										balanceForm.down('#btnCancelBalance').show();
										balanceForm.down('#btnBalance').hide();
									}
								});
							///	
							}
						})			
						</sec:authorize>						
						<sec:authorize url="/produce/vBookingOffice!del">
						,getDelButton(ds, sm, 'produce/officeBooking!delete','删除')
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
					}
				});
				
				
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
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
