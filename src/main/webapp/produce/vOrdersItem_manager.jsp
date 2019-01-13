<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="vOrdersItemDefine.jsp"%>
	<%@ include file="vOrdersItemDataExt.jsp"%>
	<%@ include file="vOrdersItemFormExt.jsp"%>
	<%@ include file="vOrdersItemSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);			
			ds = getDs(mainFields, 'sales/vOrdersItem!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel');
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('ordersNum', 100, '',0, '<s:text name="vOrdersItem.ordersNum" />'),
					'-',
					getTextField('salesName', 100, '',0, '<s:text name="vOrdersItem.salesName" />'),
					'-',
					getTextField('customCode', 100, '',0, '<s:text name="vOrdersItem.customCode" />'),
					'-',
					getTextField('customName', 100, '',0, '<s:text name="vOrdersItem.customName" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['ordersNum', '<s:text name="vOrdersItem.ordersNum" />']
							,['customCode', '<s:text name="vOrdersItem.customCode" />']
							,['storeLimit', '<s:text name="vOrdersItem.storeLimit" />']
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
								t_sql = tbar.getComponent('ordersNum').getValue();
								if (t_sql != "")
									sqlStr += " and ordersNum like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('salesName').getValue();
								if (t_sql != "")
									sqlStr += " and salesName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('customCode').getValue();
								if (t_sql != "")
									sqlStr += " and customCode like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('customName').getValue();
								if (t_sql != "")
									sqlStr += " and customName like '%"+ t_sql+ "%' ";								
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
						,getComSearchButton(searchWin,'复合查询')
					]
				});
				
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
				
				bbar = getBbar(ds);
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win, winTitle+'——查看',rec);
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
