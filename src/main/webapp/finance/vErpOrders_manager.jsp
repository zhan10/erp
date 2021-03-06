<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<script type="text/javascript" src="jsComm/commonality.js"></script>
	<script type="text/javascript" src="ini/getErpOrdersStatusDs.js"></script>
	<%@ include file="../c/cb_users.jsp"%>
	<%@ include file="vErpOrdersDefine.jsp"%>
	<%@ include file="vErpOrdersDataExt.jsp"%>
	<%@ include file="vErpOrdersFormExt.jsp"%>
	<%@ include file="vErpOrdersSearchExt.jsp"%>
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
			ds = getDs(mainFields, 'finance/vErpOrders!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#del').setDisabled(selections.length == 0);
						//grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
				    getTextField('ordersCode', 100, '',0, '<s:text name="vErpOrders.ordersCode" />'),
		            '-',
		            getTextField('mobile', 100, '',0, '<s:text name="vErpOrders.mobile" />'),
		            '-',
		            getTextField('code', 100, '',0, '<s:text name="vErpOrders.code" />'),
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ],
							['name','<s:text name="vErpOrders.name" />'],
							['userName','<s:text name="vErpOrders.userName" />']
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
								t_sql = tbar.getComponent('ordersCode').getValue();
								if (t_sql != "")
									sqlStr += " and ordersCode like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('mobile').getValue();
								if (t_sql != "")
									sqlStr += " and mobile like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('code').getValue();
								if (t_sql != "")
									sqlStr += " and code like '%"+ t_sql+ "%' ";

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
						<sec:authorize url="/finance/vErpOrders!del">
						,Ext.create('Ext.Button', {
							text : 'PASS',
							tooltip : 'PASS',
							disabled : true,
							iconCls : 'delete',
							itemId : 'del',
							handler : function(){
								var rec=(sm.getSelection())[0];
								var status = erpOrdersStatusDs.findRecord('text', '已删除').get('value')
								updateStatus("design/erpOrders!save",rec,'删除','您是否确认删除此订单，请仔细核对订单！',status,"订单删除成功!")
							}
						})
						</sec:authorize>
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
				var addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '新增',
					handler: function(widget, event) {
						addWin(win, winTitle + '——新增');
						var ordersCode =  randomNumber();
						form.down('#status').setValue(1);
						form.down('#ordersCode').setValue(ordersCode);
						form.down('#code').setReadOnly(true);
					}
				});
				var copyAddAction = Ext.create('Ext.Action', {
					iconCls: 'copy',
					 text: '拷贝添加',
						handler: function(widget, event) { 
						copyAddWin(win,winTitle + '——拷贝添加', sm);   
						var ordersCode =  randomNumber();
						form.down('#status').setValue(1);
						form.down('#ordersCode').setValue(ordersCode);
						form.down('#code').setReadOnly(true);
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);  
						form.down('#code').setReadOnly(true);
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						var rec=(sm.getSelection())[0];
						var status = erpOrdersStatusDs.findRecord('text', '已删除').get('value')
						updateStatus("design/erpOrders!save",rec,'删除','您是否确认删除此订单，请仔细核对订单！',status,"订单删除成功!")
						//delFromDB(ds,sm,'finance/vErpOrders!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/finance/vErpOrders!del">,delAction</sec:authorize>
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
