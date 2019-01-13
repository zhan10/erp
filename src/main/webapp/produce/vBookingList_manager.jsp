<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<script type="text/javascript" src="ini/getVBookingListStateDs.js"></script>
	<script type="text/javascript" src="ini/getBookingStatusDs.js"></script>
	<script type="text/javascript" src="produce/commonality.js"></script>
	<%@ include file="vBookingListDataExt.jsp"%>
	<%@ include file="vBookingListDefine.jsp"%>
	<script type="text/javascript" src="dateTime/UX_TimePickerField.js"></script>
    <script type="text/javascript" src="dateTime/UX_DateTimePicker.js"></script>
    <script type="text/javascript" src="dateTime/UX_DateTimeMenu.js"></script>
    <script type="text/javascript" src="dateTime/UX_DateTimeField.js"></script>
	<%@ include file="vBookingListFormExt.jsp"%>
	<%@ include file="vBookingListSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,300,form);
			/*batchWin=getWindow('批量修改',320,160,320,160,batchForm);*/
			ds = getDs(mainFields, 'produce/vBookingList!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						//grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						//grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						grid.down('#gridRegister').setDisabled(selections.length != 1);
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
				   Ext.create('Ext.form.DateField',{
	                  name:'bookingTime',
	                  id : 'bookingTime',
	                  width : 120,
	                  format : 'Y-m-d',
	                  emptyText:'订单时间'
                      }),		
                      '-',
                   Ext.create('Ext.form.DateField',{
	                  name:'dateFrom',
	                  id : 'dateFrom',
	                  width : 120,
	                  format : 'Y-m-d',
	                  emptyText:'预订入驻时间'
                      }),		
                      '-',
                       Ext.create('Ext.form.DateField',{
	                  name:'dateTo',
	                  id : 'dateTo',
	                  width : 120,
	                  format : 'Y-m-d',
	                  emptyText:'预订离开时间'
                      }),		
                      '-',
					getTextField('consumerName', 100, '',0, '<s:text name="vBookingList.consumerName" />'),
					'-',
					getTextField('code', 100, '',0, '<s:text name="vBookingList.code" />'),
					'-',
					getTextField('certificateCode', 100, '',0, '<s:text name="vBookingList.certificateCode" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['consumerName', '<s:text name="vBookingList.consumerName" />']
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
								t_sql = tbar.getComponent('consumerName').getValue();
								if (t_sql != "")
									sqlStr += " and consumerName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('code').getValue();
								if (t_sql != "")
									sqlStr += " and code like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('certificateCode').getValue();
								if (t_sql != "")
									sqlStr += " and certificateCode like '%"+ t_sql+ "%' ";
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('dateFrom').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',dateFrom)=0";
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('bookingTime').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',bookingTime)=0";
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('dateTo').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',dateTo)=0";
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
						'->'
						/*<sec:authorize url="/produce/vBookingList!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改')
						</sec:authorize>*/
						<sec:authorize url="/produce/vBookingList!register">
						,Ext.create('Ext.Button', {
							text : '入驻登记',
							tooltip : '入驻登记',
							hidden : true,
							disabled : true,
							iconCls : 'edit',
							itemId : 'gridRegister',
							handler :  function() {
								Ext.MessageBox.confirm('登记确认', '您是否确认登记已选中的这' + sm.getCount()
										+ '条记录，请仔细核对要登记的记录！', function(btn) {
									if (btn == 'yes') {
										showWin(win, '入驻登记',sm);
										form.down('#btnRegister').show();
										form.down('#badge').setReadOnly(false);
									}
								});
							}
						})
						</sec:authorize>
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
				/*var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);     
					 }
				});*/
				registerAction=Ext.create('Ext.Action',{
					iconCls: 'edit',
					hidden : true,
					text: '入驻登记',
					handler :  function() {
						Ext.MessageBox.confirm('登记确认', '您是否确认登记已选中的这' + sm.getCount()
								+ '条记录，请仔细核对要登记的记录！', function(btn) {
							if (btn == 'yes') {
								showWin(win, '入驻登记',sm);
								form.down('#btnRegister').show();
								form.down('#badge').setReadOnly(false);
							}
						});
					}
				});
				 var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [	
						showAction,'-'
						//<sec:authorize url="/produce/vBookingList!edit">,editAction</sec:authorize>
						<sec:authorize url="/produce/vBookingList!register">,registerAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				//grid.down('#tbar_btn_edit').hide();
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
