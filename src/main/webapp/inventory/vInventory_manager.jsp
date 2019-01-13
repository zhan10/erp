<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="vInventoryDefine.jsp"%>
	<!-- 下拉框数据 -->
	<%@ include file="../c/cb_mateType.jsp"%>
	<%@ include file="../c/cb_mater.jsp"%>
	<%@ include file="../c/cb_warehouse.jsp"%>
	<%@ include file="../c/cb_warehouseSite.jsp"%>
	<script type="text/javascript" src="ini/getWarehouseTypeStatusDs.js"></script>
	<%@ include file="vInventoryDataExt.jsp"%>
	<%@ include file="vInventoryFormExt.jsp"%>
	<%@ include file="vInventorySearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		var userId = <sec:authentication property="principal.userId"/>;
		var userName = '<sec:authentication property="principal.name"/>'
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,640,400,form);
			batchWin=getWindow('批量修改',320,160,320,160,batchForm);
			ds = getDs(mainFields, 'inventory/vInventory!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						//grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('materid', 100, '',0, '<s:text name="vInventory.materid" />'),
					'-',
					getTextField('matername', 100, '',0, '<s:text name="vInventory.matername" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 100,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['materid', '<s:text name="vInventory.materid" />']
							,['matername', '<s:text name="vInventory.matername" />']
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
								t_sql = tbar.getComponent('materid').getValue();
								if (t_sql != "")
									sqlStr += " and materid like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('matername').getValue();
								if (t_sql != "")
									sqlStr += " and matername like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/mater/mater!add">
						,getAddButton(win,winTitle + '——入库','入库',function(){
							form.down('#records').hide();
							form.down('#type').setValue(1);
							set();
						})
						,getEditButton(win,winTitle+'——出库', sm,'出库',function(){
							var rec=(sm.getSelection())[0];
							get(rec.get("materid"))
							form.down('#records').show();
							form.down('#id').setValue("");
							form.down('#quantities').setValue("");
							form.down('#type').setValue(2);
							form.down('#matetypeid').setReadOnly(true);
							form.down('#materid').setReadOnly(true);
							set();
						}),getBatchButton(batchWin,sm,'批量修改数量')
						/* ,getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加',function(){
							set();
						})	 */
						</sec:authorize>
						/* <sec:authorize url="/mater/mater!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							set();
						})
						</sec:authorize>
						<sec:authorize url="/mater/mater!del">
						,getDelButton(ds, sm, 'mater/mater!delete','删除')
						</sec:authorize> */
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
						set();
					}
				});
				var copyAddAction = Ext.create('Ext.Action', {
					iconCls: 'copy',
					text: '拷贝添加',
					handler: function(widget, event) { 
						copyAddWin(win,winTitle + '——拷贝添加', sm);   
						set();
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					text: '修改',
					handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);  
						set();
					}	
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'mater/mater!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/mater/mater!add">,addAction,copyAddAction</sec:authorize>
						<sec:authorize url="/mater/mater!edit">,editAction</sec:authorize>
						<sec:authorize url="/mater/mater!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					get(rec.get("materid"))
					showWinByRec(win,winTitle+'——查看',rec);
				});
				 /*grid.on('itemcontextmenu',function(view, rec, node, index, e) {
					e.stopEvent();
					contextMenu.showAt(e.getXY());
					return false;
				}); */
				var viewport = Ext.create('Ext.Viewport', {
					layout : 'fit',
					items : grid
				});	
		});
		function set(){
			var time=Ext.Date.format(new Date(),'Y-m-d H:i:s');
			form.down('#updateTime').setValue(time);
			form.down('#updateTime').setReadOnly(true);
			form.down('#principal').setValue(userName);
			form.down('#principal').setReadOnly(true);
			form.down('#records').setReadOnly(true);
		}
		function get(materid){
			Ext.Ajax.request({
				url : "inventory/inventory!getResult",
				timeout : 60000,
				params : {
					materid : materid
				},
				method : 'post',
				success : function(response) {
					var json = Ext.JSON.decode(response.responseText);
					form.down('#records').setValue(json.records[1]);
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	</script>
</body>
</html>
