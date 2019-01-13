<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="vFloorLockDefine.jsp"%>
	<!-- 下拉框数据 -->
	<%@ include file="../c/cb_buildings.jsp"%>
	<%@ include file="../c/cb_floors.jsp"%>
	<!-- 引入日期时间控件 -->
	<script type="text/javascript" src="dateTime/UX_TimePickerField.js"></script>
	<script type="text/javascript" src="dateTime/UX_DateTimePicker.js"></script>
	<script type="text/javascript" src="dateTime/UX_DateTimeMenu.js"></script>
	<script type="text/javascript" src="dateTime/UX_DateTimeField.js"></script>
	<%@ include file="vFloorLockDataExt.jsp"%>
	<%@ include file="vFloorLockFormExt.jsp"%>
	<%@ include file="vFloorLockSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,180,form);
			batchWin=getWindow('批量修改',320,160,320,160,batchForm);
			ds = getDs(mainFields, 'visit/vFloorLock!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('buildingName', 100, '',0, '<s:text name="vFloorLock.buildingName" />'),
					'-',
					getTextField('floorName', 100, '',0, '<s:text name="vFloorLock.floorName" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 100,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['lockFrom', '<s:text name="vFloorLock.lockFrom" />']
							,['lockTo', '<s:text name="vFloorLock.lockTo" />']
							,['buildingName', '<s:text name="vFloorLock.buildingName" />']
							,['floorName', '<s:text name="vFloorLock.floorName" />']
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
								t_sql = tbar.getComponent('buildingName').getValue();
								if (t_sql != "")
									sqlStr += " and buildingName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('floorName').getValue();
								if (t_sql != "")
									sqlStr += " and floorName like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/visit/floorLock!add">
						,getAddButton(win,winTitle + '——新增','新增')
						</sec:authorize>
						<sec:authorize url="/visit/floorLock!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							var rec=(sm.getSelection())[0];
							Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
							cb_floors_ds.loadPage(1);
						})
						</sec:authorize>
						<sec:authorize url="/visit/floorLock!del">
						,getDelButton(ds, sm, 'visit/floorLock!delete','删除')
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
						Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
						cb_floors_ds.loadPage(1);
					}
				});
				var addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '新增',
					handler: function(widget, event) {
						addWin(win, winTitle + '——新增');
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);  
						var rec=(sm.getSelection())[0];
						Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
						cb_floors_ds.loadPage(1);
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'visit/floorLock!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/visit/floorLock!add">,addAction</sec:authorize>
						<sec:authorize url="/visit/floorLock!edit">,editAction</sec:authorize>
						<sec:authorize url="/visit/floorLock!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
					cb_floors_ds.loadPage(1);
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
