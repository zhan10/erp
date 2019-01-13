<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="vMonthlyReportDefine.jsp"%>
	<%@ include file="vMonthlyReportDataExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight);
			ds = getDs(mainFields, 'finance/vMonthlyReportDate!managerExt', baseSql,order);
			ds.load();
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'reportYear',		
						width : 100,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','年' ],['2015', '2015']
							,['2016', '2016'],['2017', '2017']
							,['2018', '2018'],['2019', '2019']
							,['2020', '2020'],['2021', '2021']
						]
					}),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'reportMonth',		
						width : 100,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','月' ],['1', '1'],['2', '2'],['3', '3']
							,['4', '4'],['5', '5'],['6', '6'],['7', '7']
							,['8', '8'],['9', '9'],['10', '10'],['11', '11']
							,['12', '12']
						]
					}),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 100,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['reportYear', '<s:text name="vMonthlyReport.year" />']
							,['reportMonth', '<s:text name="vMonthlyReport.month" />']
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
								t_sql = tbar.getComponent('reportYear').getValue();
								if (t_sql != "")
									sqlStr += " and reportYear like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('reportMonth').getValue();
								if (t_sql != "")
									sqlStr += " and reportMonth like '%"+ t_sql+ "%' ";
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
						},{
							text : '当月',
							iconCls : 'search',
							handler : function() {
								window.open("finance/theMonthReport.jsp");
							},
						} 
					]
				});
				bbar = getBbar(ds);
				var year = "";
				var month = "";
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						//showWin(win, winTitle+'——查看',sm);	
						window.open("finance/vMonthlyReport.jsp?reportYear="+year+"&reportMonth="+month);
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					//showWinByRec(win,winTitle+'——查看',rec);
					var year = rec.get("reportYear");
					var month = rec.get("reportMonth");
					window.open("finance/vMonthlyReport.jsp?reportYear="+year+"&reportMonth="+month);
				});
				grid.on('itemcontextmenu',function(view, rec, node, index, e) {
					e.stopEvent();
					contextMenu.showAt(e.getXY());
					year = rec.get("reportYear");
					month = rec.get("reportMoth");
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
