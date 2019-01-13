<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<script type="text/javascript" src="ini/getReportYearDs.js"></script>
	<script type="text/javascript" src="ini/getReportMonthDs.js"></script>
	<script type="text/javascript" src="ini/getReportDayDs.js"></script>
	<%@ include file="vDailyReportDefine.jsp"%>
	<%@ include file="vDailyReportDataExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight);
			ds = getDs(mainFields, 'finance/vDailyReportDate!managerExt', baseSql,order);
			ds.load();
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'reportYear',		
						width : 100,
						displayField: 'text',
    					valueField: 'value',
    					value: '-1',
    					label : '<s:text name="report.year" />',
						mode : 'local',
						selectOnFocus : true,
						editable : false,
						store :reportYearDs
					}),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'reportMonth',		
						width : 100,
						displayField: 'text',
    					valueField: 'value',
    					value: '-1',
    					label : '<s:text name="report.month" />',
						mode : 'local',
						selectOnFocus : true,
						editable : false,
						store : reportMonthDs
					}),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'reportDay',		
						width : 100,
						displayField: 'text',
    					valueField: 'value',
    					value: '-1',
    					label : '<s:text name="report.day" />',
						mode : 'local',
						selectOnFocus : true,
						editable : false,
						store : reportDayDs
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
							,['reportYear', '<s:text name="vDailyReport.year" />']
							,['reportMonth', '<s:text name="vDailyReport.month" />']
							,['reportDay', '<s:text name="vDailyReport.day" />']
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
								if (t_sql != "" && t_sql !="-1")
									sqlStr += " and reportYear like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('reportMonth').getValue();
								if (t_sql != "" && t_sql !="-1")
									sqlStr += " and reportMonth like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('reportDay').getValue();
								if (t_sql != "" && t_sql !="-1")
									sqlStr += " and reportDay like '%"+ t_sql+ "%' ";
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
						} ,
						{
							text : '当天',
							iconCls : 'search',
							handler : function() {	
								window.open("finance/toDayReport.jsp");
							},
						} 
					]
				});
				bbar = getBbar(ds);
				var year = "";
				var month = "";
				var day = "";
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						window.open("finance/vDailyReport.jsp?reportYear="+year+"&reportMonth="+month+"&reportDay="+day);
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					var year = rec.get("reportYear");
					var month = rec.get("reportMonth");
					var day = rec.get("reportDay");
					window.open("finance/vDailyReport.jsp?reportYear="+year+"&reportMonth="+month+"&reportDay="+day);
				});
				grid.on('itemcontextmenu',function(view, rec, node, index, e) {
					e.stopEvent();
					contextMenu.showAt(e.getXY());
					year = rec.get("reportYear");
					month = rec.get("reportMonth");
					day = rec.get("reportDay");
					return false;
				});
				Ext.create('Ext.Viewport', {
							layout : 'fit',
							items : grid
				});	
		});
	</script>
</body>
</html>
