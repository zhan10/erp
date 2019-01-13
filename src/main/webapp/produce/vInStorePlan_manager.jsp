<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="vInStorePlanDefine.jsp"%>
	<%@ include file="vInStorePlanDataExt.jsp"%>
	<%@ include file="vInStorePlanFormExt.jsp"%>
	<%@ include file="vInStorePlanSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			
			Ext.QuickTips.init();
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);
			batchWin=getWindow('批量修改',320,150,320,150,batchForm);
			ds = getDs(mainFields, 'store/vInStorePlan!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('code', 100, '',0, '<s:text name="vInStorePlan.code" />'),
					'-',
					getTextField('deliverDept', 100, '',0, '<s:text name="vInStorePlan.deliverDept" />'),
					'-',
					getTextField('storeName', 100, '',0, '<s:text name="vInStorePlan.storeName" />'),
					'-',
					getTextField('storeDate', 100, '',0, '<s:text name="vInStorePlan.storeDate" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['code', '<s:text name="vInStorePlan.code" />']
							,['storeDate', '<s:text name="vInStorePlan.storeDate" />']
							,['inputerName', '<s:text name="vInStorePlan.inputerName" />']
							,['inputDate', '<s:text name="vInStorePlan.inputDate" />']
							,['deliverName', '<s:text name="vInStorePlan.deliverName" />']
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
								t_sql = tbar.getComponent('code').getValue();
								if (t_sql != "")
									sqlStr += " and code like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('deliverDept').getValue();
								if (t_sql != "")
									sqlStr += " and deliverDept like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('storeName').getValue();
								if (t_sql != "")
									sqlStr += " and storeName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('storeDate').getValue();
								if (t_sql != "")
									sqlStr += " and storeDate like '%"+ t_sql+ "%' ";
								var orderBy = tbar.getComponent('orderBy').getValue();
								if (orderBy != ''){
									order = " order by "+ orderBy;
									var orderType = tbar.getComponent('orderType').getValue();
									if (orderType == 'desc')
										order += " desc";
								}
							}catch(e){
								alert('查询条件有误' + e);
							}
							Ext.apply(
								ds.proxy.extraParams,{whereSql : sqlStr,order : order});
								ds.loadPage(1);
							}
						},
						'->','-'
						< sec:authorize url="/store/inStorePlan!add">
						,getAddButton(win, form,'新增'),
						getCopyAddButton(win, form, sm,'拷贝添加')
						</sec:authorize>
						< sec:authorize url="/store/inStorePlan!edit">
						,getEditButton(win, form, sm,'修改'),
						getBatchButton(batchWin,sm,'批量修改')
						</sec:authorize>
						< sec:authorize url="/store/inStorePlan!del">
						,getDelButton(ds, sm, 'store/inStorePlan!delete','删除')
						</sec:authorize>
						,getComSearchButton('复合查询')
					]
				});
				bbar = getBbar(ds);
				grid = getGrid(gridTitle, ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid, rowIndex, e) {
					showWin(win, form, sm);
				});
				var addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '新增',
					 handler: function(widget, event) {
						isEdit = false;
						addWin(win, form);
					}
				});
				var copyAddAction = Ext.create('Ext.Action', {
					iconCls: 'copy',
					 text: '拷贝添加',
						handler: function(widget, event) { 
						isEdit = false;
						addWin(win, form, true, sm);   
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						isEdit = true;
						editWin(win, form, sm);     
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'store/inStorePlan!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						addAction,copyAddAction,editAction,delAction
					 ]
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
