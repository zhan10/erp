<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="printRateDefine.jsp"%>
	<%@ include file="printRateDataExt.jsp"%>
	<%@ include file="printRateFormExt.jsp"%>
	<%@ include file="printRateSearchExt.jsp"%>
	<script type="text/javascript" src="ini/getPrintFormatDs.js"></script>
	<script type="text/javascript" src="ini/getPaperFormatDs.js"></script>
	<script type="text/javascript" src="ini/getChargeTypesDs.js"></script>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,600,155,form);
			batchWin=getWindow('批量修改',320,160,320,160,batchForm);
			ds = getDs(mainFields, 'serve/printRate!managerExt', baseSql,order);
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
				Ext.create('Ext.form.field.ComboBox',{
	               itemId : 'printFormat',
	               width : 100,
	               displayField: 'text',
	               valueField: 'value',
	               value:-1,
	               label : '<s:text name="printRate.printFormat" />',
	               mode : 'local',
	               selectOnFocus : true,
	               editable : false,
	               store :printFormatDs
                   }),
				   '-',
				   Ext.create('Ext.form.field.ComboBox',{
		               itemId : 'paperFormat',
		               width : 100,
		               displayField: 'text',
		               valueField: 'value',
		               value:-1,
		               label : '<s:text name="printRate.paperFormat" />',
		               mode : 'local',
		               selectOnFocus : true,
		               editable : false,
		               store :paperFormatDs
	                   }),
					   '-',
					Ext.create('Ext.form.field.ComboBox',{
			               itemId : 'chargeType',
			               width : 100,
			               displayField: 'text',
			               valueField: 'value',
			               value:-1,
			               label : '<s:text name="printRate.chargeType" />',
			               mode : 'local',
			               selectOnFocus : true,
			               editable : false,
			               store :chargeTypesDs
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
							,['printFormat', '<s:text name="printRate.printFormat" />']
							,['paperFormat', '<s:text name="printRate.paperFormat" />']
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
								t_sql = tbar.getComponent('printFormat').getValue();
								if (t_sql != "" && t_sql!="-1")
									sqlStr += " and printFormat like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('paperFormat').getValue();
								if (t_sql != "" && t_sql!="-1")
									sqlStr += " and paperFormat like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('chargeType').getValue();
								if (t_sql != "" && t_sql!="-1")
									sqlStr += " and chargeType like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/serve/printRate!add">
						,getAddButton(win,winTitle + '——新增','新增'),
						/* getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加') */
						</sec:authorize>
						<sec:authorize url="/serve/printRate!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改')
						
						</sec:authorize>
						<sec:authorize url="/serve/printRate!del">
						,getDelButton(ds, sm, 'serve/printRate!delete','删除')
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
				var addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '新增',
					handler: function(widget, event) {
						addWin(win, winTitle + '——新增');
					}
				});
			/* 	var copyAddAction = Ext.create('Ext.Action', {
					iconCls: 'copy',
					 text: '拷贝添加',
						handler: function(widget, event) { 
						copyAddWin(win,winTitle + '——拷贝添加', sm);   
					}
				}); */
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);     
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'serve/printRate!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/serve/printRate!add">,addAction</sec:authorize>
						<sec:authorize url="/serve/printRate!edit">,editAction</sec:authorize>
						<sec:authorize url="/serve/printRate!del">,delAction</sec:authorize>
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
