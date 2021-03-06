<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="warehouseDefine.jsp"%>
	<!-- 下拉框数据 -->
	<%@ include file="../c/cb_warehouse.jsp"%>
	<script type="text/javascript" src="ini/getWarehouseTypeStatusDs.js"></script>
	<%@ include file="warehouseDataExt.jsp"%>
	<%@ include file="tabs_warehouse.jsp"%>
	<%@ include file="warehouseFormExt.jsp"%>
	<%@ include file="warehouseSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);
			siteWin = getWindow(winTitle,winWidth,280,500,280,siteForm);
			ds = getDs(mainFields, 'warehouse/warehouse!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('serialNumber', 100, '',0, '<s:text name="warehouse.serialNumber" />'),
					'-',
					
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'type',		
						width : 100,
						value : 0,
						valueField : 'value',
						mode : 'local',
						editable : false,
						store : warehouseTypeDs
					}),	
					'-',
					getTextField('name', 100, '',0, '<s:text name="warehouse.name" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['serialNumber', '<s:text name="warehouse.serialNumber" />']
							,['type', '<s:text name="warehouse.type" />']
							,['name', '<s:text name="warehouse.name" />']
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
								t_sql = tbar.getComponent('serialNumber').getValue();
								if (t_sql != "")
									sqlStr += " and serialNumber like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('type').getValue();
								if (t_sql != "")
									sqlStr += " and type like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('name').getValue();
								if (t_sql != "")
									sqlStr += " and name like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/warehouse/warehouse!add">
						,getAddButton(win,winTitle + '——新增仓库','新增仓库',function(){
							Ext.apply(warehouseSite_ds.proxy.extraParams,{whereSql :' and wid=0'});
							warehouseSite_ds.load();
						})
						//,getAddButton(siteWin,winTitle + '——新增库位','新增库位',function(){})
						,Ext.create('Ext.Button', {
							text : '新增库位',
							tooltip : '库位添加',
							iconCls : 'add',
							itemId : 'tbar_btn_addSite',
							handler : function() {
								addWin(siteWin, winTitle + '——新增库位');	
							}
						})
						,getCopyAddButton(win,winTitle + '——仓库拷贝添加', sm,'拷贝添加',function(){
							Ext.apply(warehouseSite_ds.proxy.extraParams,{whereSql :' and wid=0'});
							warehouseSite_ds.load();
						})	
						</sec:authorize>
						<sec:authorize url="/warehouse/warehouse!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							var rec=(sm.getSelection())[0];
							Ext.apply(warehouseSite_ds.proxy.extraParams,{whereSql :' and wid='+rec.get('id')});
							warehouseSite_ds.load();
						})
						</sec:authorize>
						<sec:authorize url="/warehouse/warehouse!del">
						,getDelButton(ds, sm, 'warehouse/building!delete','删除')
						</sec:authorize>
					]
				});
				bbar = getBbar(ds);
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						showWin(win, winTitle+'——查看',sm);	
						var rec=(sm.getSelection())[0];
						Ext.apply(warehouseSite_ds.proxy.extraParams,{whereSql :' and wid='+rec.get('id')});
						warehouseSite_ds.load();
					}
				});
				var addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '新增',
					handler: function(widget, event) {
						addWin(win, winTitle + '——新增');
					}
				});
				var copyAddAction = Ext.create('Ext.Action', {
					iconCls: 'copy',
					text: '拷贝添加',
					handler: function(widget, event) { 
						copyAddWin(win,winTitle + '——拷贝添加', sm);   
						Ext.apply(warehouseSite_ds.proxy.extraParams,{whereSql :' and wid=0'});
						warehouseSite_ds.load();
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					text: '修改',
					handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);  
						var rec=(sm.getSelection())[0];
						Ext.apply(warehouseSite_ds.proxy.extraParams,{whereSql :' and wid='+rec.get('id')});
						warehouseSite_ds.load();
					}	
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'warehouse/building!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/warehouse/warehouse!add">,addAction,copyAddAction</sec:authorize>
						<sec:authorize url="/warehouse/warehouse!edit">,editAction</sec:authorize>
						<sec:authorize url="/warehouse/warehouse!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					Ext.apply(warehouseSite_ds.proxy.extraParams,{whereSql :' and wid='+rec.get('id')});
					warehouseSite_ds.load();
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
