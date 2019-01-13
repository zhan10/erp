<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="receiptDefine.jsp"%>
	<%@ include file="receiptDataExt.jsp"%>
	<%@ include file="receiptFormExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,300,form);
			ds = getDs(mainFields, 'finance/receipt!managerExt', baseSql,order);
			ds.load();
			 sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						//grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
						//grid.down('#gridDispose').setDisabled(selections.length != 1);
						//grid.down('#gridFinish').setDisabled(selections.length != 1);
					}
				}
			}); 
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					Ext.create('Ext.form.DateField',{
						name:'timeEntry',
					    itemId : 'timeEntry',
					    width : 100,
					    format : 'Y-m-d',
					    emptyText:'入账起始时间'
					}),
					'——',
					Ext.create('Ext.form.DateField',{
						name:'timeEntry',
					    itemId : 'timeEntryTo',
					    width : 100,
					    format : 'Y-m-d',
					    emptyText:'入账截至时间'
					}),
					'-',
					getTextField('accountNumber', 100, '',0, '<s:text name="receipt.accountNumber" />'),
					'-',
					getTextField('outTradeNo', 100, '',0, '<s:text name="receipt.outTradeNo" />'),
					'-',
					getTextField('tradeNo', 100, '',0, '<s:text name="receipt.tradeNo" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 100,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['timeEntry', '<s:text name="receipt.timeEntry" />']
							,['accountNumber', '<s:text name="receipt.accountNumber" />']
							,['outTradeNo', '<s:text name="receipt.outTradeNo" />']
							,['tradeNo', '<s:text name="receipt.tradeNo" />']
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
								t_sql1=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('timeEntry').getValue())),'Y-m-d');
								t_sql2=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('timeEntryTo').getValue())),'Y-m-d');
								if (t_sql1 != ""&&t_sql1!="1970-01-01"){
									if(t_sql2 != ""&&t_sql2!="1970-01-01")
									sqlStr+="and timeEntry between '"+t_sql1+"' and '"+t_sql2+"'";
								}
								t_sql = tbar.getComponent('accountNumber').getValue();
								if (t_sql != "")
									sqlStr += " and accountNumber like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('outTradeNo').getValue();
								if (t_sql != "")
									sqlStr += " and outTradeNo like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('tradeNo').getValue();
								if (t_sql != "")
									sqlStr += " and tradeNo like '%"+ t_sql+ "%' ";
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
					/* 	<sec:authorize url="/content/news!add">
						,getAddButton(win,winTitle + '——新增','新增')
						</sec:authorize>
						<sec:authorize url="/content/news!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改')
						</sec:authorize>
						<sec:authorize url="/content/news!del">
						,getDelButton(ds, sm, 'news/news!delete','删除')
						</sec:authorize>
						,getComSearchButton(searchWin,'复合查询') 
						<sec:authorize url="/finance/receipt!del">
						,getDelButton(ds, sm, 'finance/receipt!delete','删除')
						</sec:authorize>*/
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
	/*				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'finance/receipt!delete',function(){});
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
					}
				});
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
						delFromDB(ds,sm,'news/news!delete',function(){});
					}
				});*/
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						/*<sec:authorize url="/finance/receipt!del">,delAction</sec:authorize>
						 <sec:authorize url="/content/news!edit">,editAction</sec:authorize>
						<sec:authorize url="/content/news!add">,addAction</sec:authorize>
						<sec:authorize url="/content/news!del">,delAction</sec:authorize> */
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
