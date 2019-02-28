<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="materDefine.jsp"%>
	<script type="text/javascript" src="mater/mateType.js"></script>
	<!-- 下拉框数据 -->
	<%@ include file="../c/cb_warehouse.jsp"%>
	<%@ include file="../c/cb_mateType.jsp"%>
	<%@ include file="../c/cb_warehouse.jsp"%>
	<%@ include file="../c/cb_warehouseSite.jsp"%>
	<script type="text/javascript" src="ini/getWarehouseTypeStatusDs.js"></script>
	<%@ include file="materDataExt.jsp"%>
	<%@ include file="materFormExt.jsp"%>
	<%@ include file="materSearchExt.jsp"%>
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
			win = getWindow(winTitle,winWidth,winHeight,640,470,form);
			ds = getDs(mainFields, 'mater/mater!managerExt', baseSql,order);
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
					getTextField('materid', 100, '',0, '<s:text name="mater.materid" />'),
					'-',
					getTextField('matetypeid', 100, '',0, '<s:text name="mater.matetypeid" />'),
					'-',
					getTextField('matername', 100, '',0, '<s:text name="mater.matername" />'),
					'-',
					getTextField('ckid', 100, '',0, '<s:text name="mater.ckid" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 100,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['materid', '<s:text name="mater.materid" />']
							,['matetypeid', '<s:text name="mater.matetypeid" />']
							,['matername', '<s:text name="mater.matername" />']
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
								t_sql = tbar.getComponent('matetypeid').getValue();
								if (t_sql != "")
									sqlStr += " and matetypeid like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('matername').getValue();
								if (t_sql != "")
									sqlStr += " and matername like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('ckid').getValue();
								if (t_sql != "")
									sqlStr += " and ckid like '%"+ t_sql+ "%' ";
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
						,getAddButton(win,winTitle + '——新增','新增',function(){
							Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' and grade=1'});
							cb_mateType_ds.loadPage(1);
							set();
						})
						,getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加',function(){
							var rec=(sm.getSelection())[0];
							Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' '});
							cb_mateType_ds.loadPage(1);
							form.down('#matetypeid0').setValue(rec.get("matetypeid"));
							set();
						})	
						</sec:authorize>
						<sec:authorize url="/mater/mater!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							var rec=(sm.getSelection())[0];
							Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' '});
							cb_mateType_ds.loadPage(1);
							form.down('#matetypeid0').setValue(rec.get("matetypeid"));
							set();
						})
						</sec:authorize>
						<sec:authorize url="/mater/mater!del">
						,getDelButton(ds, sm, 'mater/mater!delete','删除')
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
						Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' '});
						cb_mateType_ds.loadPage(1);
						form.down('#matetypeid0').setValue(rec.get("matetypeid"));
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
						var rec=(sm.getSelection())[0];
						Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' '});
						cb_mateType_ds.loadPage(1);
						form.down('#matetypeid0').setValue(rec.get("matetypeid"));
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					text: '修改',
					handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);  
						set();
						var rec=(sm.getSelection())[0];
						Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' '});
						cb_mateType_ds.loadPage(1);
						form.down('#matetypeid0').setValue(rec.get("matetypeid"));
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
					showWinByRec(win,winTitle+'——查看',rec);
					Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' '});
					cb_mateType_ds.loadPage(1);
					form.down('#matetypeid0').setValue(rec.get("matetypeid"));
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
		function set(){
			var time=Ext.Date.format(new Date(),'Y-m-d H:i:s');
			form.down('#lastmoddate').setValue(time);
			form.down('#lastmodmaker').setValue(userName);
			form.down('#lastmoddate').setReadOnly(true);
			form.down('#lastmodmaker').setReadOnly(true);
			/* form.down('#mwidth').setReadOnly(true);
			form.down('#mheighth').setReadOnly(true);
			form.down('#mdeepth').setReadOnly(true); */
		}
	</script>
</body>
</html>
