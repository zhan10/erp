<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="vRefundRecordDefine.jsp"%>
	<%@ include file="vRefundRecordDataExt.jsp"%>
	<%@ include file="../c/cd_consumer.jsp"%>
	<%@ include file="../c/cd_booking.jsp"%>
	<script type="text/javascript" src="ini/getBookingStatusDs.js"></script>
	<script type="text/javascript" src="dateTime/UX_TimePickerField.js"></script>
    <script type="text/javascript" src="dateTime/UX_DateTimePicker.js"></script>
    <script type="text/javascript" src="dateTime/UX_DateTimeMenu.js"></script>
    <script type="text/javascript" src="dateTime/UX_DateTimeField.js"></script>
	<%@ include file="vRefundRecordFormExt.jsp"%>
	<%@ include file="vRefundRecordSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();			
			win = getWindow(winTitle,winWidth,winHeight,300,200,form);			
			ds = getDs(mainFields, 'crm/vRefundRecord!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);						
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('code', 100, '',0, '<s:text name="vRefundRecord.code" />'),
					'-',
					getTextField('consumerName', 100, '',0, '<s:text name="vRefundRecord.consumerName" />'),
					'-',
					Ext.create('Ext.form.DateField',{
	                  name:'refundTime',
	                  id : 'refundTime',
	                  width : 100,
	                  format : 'Y-m-d',
	                  emptyText:'退款时间'
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
							,['code', '<s:text name="vRefundRecord.code" />']
							,['consumerName', '<s:text name="vRefundRecord.consumerName" />']
							,['refundTime', '<s:text name="vRefundRecord.refundTime" />']
							,['amount', '<s:text name="vRefundRecord.amount" />']
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
								t_sql = tbar.getComponent('consumerName').getValue();
								if (t_sql != "")
									sqlStr += " and consumerName like '%"+ t_sql+ "%' ";
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('refundTime').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',refundTime)=0";
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
						<sec:authorize url="/crm/vRefundRecord!add">
						,getAddButton(win,winTitle + '——新增','新增')
						</sec:authorize>
						<sec:authorize url="/crm/vRefundRecord!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改')
						</sec:authorize>
						<sec:authorize url="/crm/vRefundRecord!del">
						,getDelButton(ds, sm, 'crm/refundRecord!delete','删除')
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
						delFromDB(ds,sm,'crm/refundRecord!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/crm/vRefundRecord!add">,addAction</sec:authorize>
						<sec:authorize url="/crm/vRefundRecord!edit">,editAction</sec:authorize>
						<sec:authorize url="/crm/vRefundRecord!del">,delAction</sec:authorize>
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
