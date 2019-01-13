<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<%@ include file="../jspComm/extHeader.jsp"%>
<%@ include file="vBookingDefine.jsp"%>
<script type="text/javascript" src="ini/getBookingStatusDs.js"></script>
<script type="text/javascript" src="produce/commonality.js"></script>
<!-- 引入日期时间控件 -->
<script type="text/javascript" src="dateTime/UX_TimePickerField.js"></script>
<script type="text/javascript" src="dateTime/UX_DateTimePicker.js"></script>
<script type="text/javascript" src="dateTime/UX_DateTimeMenu.js"></script>
<script type="text/javascript" src="dateTime/UX_DateTimeField.js"></script>
<%@ include file="vBookingDataExt.jsp"%>
<%@ include file="tabs_booking.jsp"%>
<%@ include file="vBookingFormExt.jsp"%>
<%@ include file="vBookingSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
	var userId = <sec:authentication property="principal.userId"/>;
	var userName = '<sec:authentication property="principal.name"/>'
	var bookingId=0;
	var originalCost;
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);		
		Ext.onReady(function() {
			Ext.QuickTips.init();			
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);
			
			batchWin=getWindow('批量修改',320,160,320,160,batchForm);
			ds = getDs(mainFields, 'produce/vBooking!managerExt', baseSql,order);
			ds.load();
			setTotal(baseSql.substr(baseSql.length-1,1),"","","","");
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						grid.down('#gridBack').setDisabled(selections.length != 1);
						grid.down('#gridBalance').setDisabled(selections.length != 1);
						grid.down('#gridPass').setDisabled(selections.length != 1);
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					}
				}
			});		
				
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
				Ext.create('Ext.form.field.ComboBox',{
						itemId : 'status',
						width : 100,
						displayField: 'text',
    					valueField: 'value',
    					value:-1,
						label : '<s:text name="vBooking.status" />',
						mode : 'local',
						selectOnFocus : true,
						editable : false,
						store : bookingStatusDs
					}),
					'-',
				 Ext.create('Ext.form.DateField',{
	                  name:'bookingTime',
	                  id : 'bookingTime',
	                  width : 120,
	                  format : 'Y-m-d',
	                  emptyText:'订单时间'
                      }),		
                      '-',
					getTextField('buildingName', 100, '',0, '<s:text name="vBooking.buildingName" />'),
					'-',
					getTextField('code', 100, '',0, '<s:text name="vBooking.code" />'),
					'-',
					getTextField('consumerName', 100, '',0, '<s:text name="vBooking.consumerName" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['buildingName', '<s:text name="vBooking.buildingName" />']
							,['persons', '<s:text name="vBooking.persons" />']
							,['bookingTime', '<s:text name="vBooking.bookingTime" />']
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
								t_sql = tbar.getComponent('status').getValue();
								if (t_sql != "" && t_sql!="-1")
									sqlStr += " and status ="+ t_sql;
								t_sql = tbar.getComponent('buildingName').getValue();
								if (t_sql != "")
									sqlStr += " and buildingName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('code').getValue();
								if (t_sql != "")
									sqlStr += " and code like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('consumerName').getValue();
								if (t_sql != "")
									sqlStr += " and consumerName like '%"+ t_sql+ "%' ";
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('bookingTime').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',bookingTime)=0";
								var orderBy = tbar.getComponent('orderBy').getValue();
								if (orderBy != ''){
									order = " order by "+ orderBy;
									var orderType = tbar.getComponent('orderType').getValue();
									if (orderType == 'desc')
										order += " desc";
								};
								if(baseSql==""){
									setTotal(tbar.getComponent('status').getValue(),
											Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('bookingTime').getValue())),'Y-m-d'),
											tbar.getComponent('buildingName').getValue(),
											tbar.getComponent('code').getValue(),
											tbar.getComponent('consumerName').getValue());
								}else{
								setTotal(baseSql.substr(baseSql.length-1,1),
										Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('bookingTime').getValue())),'Y-m-d'),
										tbar.getComponent('buildingName').getValue(),
										tbar.getComponent('code').getValue(),
										tbar.getComponent('consumerName').getValue());
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
						<sec:authorize url="/produce/vBooking!pass">
						,Ext.create('Ext.Button', {
							text : '审核',
							tooltip : '订单审核',
							hidden : true,
							disabled : true,
							iconCls : 'edit',
							itemId : 'gridPass',
							handler : gridPass
						})
						</sec:authorize>
						<sec:authorize url="/produce/vBooking!back">
						,Ext.create('Ext.Button', {
							text : '退回',
							tooltip : '订单退回',
							hidden : true,
							disabled : true,
							iconCls : 'edit',
							itemId : 'gridBack',
							handler : gridBack
						})
						</sec:authorize>
						<sec:authorize url="/produce/vBooking!balance">
						,Ext.create('Ext.Button', {
							text : '结算',
							tooltip : '订单结算',
							hidden : true,
							disabled : true,
							iconCls : 'balance',
							itemId : 'gridBalance',
							handler :  function() {
								Ext.MessageBox.confirm('结算确认', '您是否确认结算已选中的这' + sm.getCount()
										+ '条记录，请仔细核对要结算的记录！', function(btn) {
									if (btn == 'yes') {
										var records = grid.getSelectionModel().getSelection();
										bookingId = records[0].get("id");
										showWin(win, '订单结算',sm);
										tabs.setActiveTab(0);
										Ext.apply(workbench_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
		                				workbench_ds.load();
										Ext.apply(office_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
										office_ds.load();
										Ext.apply(meetingRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
										meetingRoom_ds.load();
										Ext.apply(exhibitionRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
										exhibitionRoom_ds.load();
										Ext.apply(telRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
										telRoom_ds.load();
										Ext.apply(vipRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
										vipRoom_ds.load();
										form.down('#balanceTime').setValue(Ext.Date.format(new Date(),'Y-m-d H:i:s'));
										var total = form.down('#total').getValue();
										form.down('#balancePrice').setValue(total);
										form.down('#btnBalance').show();
									}
								});
							}
						})
						</sec:authorize>
					/*	<sec:authorize url="/produce/booking!add">
						,getAddButton(win,winTitle + '——新增','新增'),
						getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加')
						</sec:authorize>
						*/
						<sec:authorize url="/produce/vBooking!edit">
						,getEditButton(win,winTitle+'——修改价格', sm,'修改价格',function(){
							bookingId = sm.getSelection()[0].data['id'];							
							tabs.setActiveTab(0);
							Ext.apply(workbench_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
            				workbench_ds.load();
							Ext.apply(office_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
							office_ds.load();
							Ext.apply(meetingRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
							meetingRoom_ds.load();
							Ext.apply(exhibitionRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
							exhibitionRoom_ds.load();
							Ext.apply(telRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
							telRoom_ds.load();
							Ext.apply(vipRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
							vipRoom_ds.load();
							form.down('#status').setReadOnly(true);
							form.down('#code').setReadOnly(true);
							form.down('#bookingTime').setReadOnly(true);
							form.down('#buildingName').setReadOnly(true);
							form.down('#cityName').setReadOnly(true);
							form.down('#persons').setReadOnly(true);
							form.down('#consumerName').setReadOnly(true);
							form.down('#tel').setReadOnly(true);
							form.down('#email').setReadOnly(true);
							form.down('#originalCost').setReadOnly(true);
							form.down('#amender').setReadOnly(true);
							form.down('#deposit').setReadOnly(true);
							form.down('#balanceTime').setReadOnly(true);
							form.down('#balancePrice').setReadOnly(true);
							form.down('#amenderId').setValue(userId);
							form.down('#amender').setValue(userName);
							var times=new Date();
							var timess=Ext.Date.format(times,'Y-m-d H:i:s');
							form.down('#amendTime').setValue(timess);
							var originalCost = form.down('#originalCost').getValue();
							if(originalCost==''){
								var total = form.down('#total').getValue();
								form.down('#originalCost').setValue(total);
							}						
						})
						</sec:authorize>
						<sec:authorize url="/produce/vBooking!del">
						,getDelButton(ds, sm, 'produce/booking!delete','删除')
						</sec:authorize>
						<sec:authorize url="/produce/vBooking!total">
					    ,setSummary()
					    </sec:authorize> 
						//,getComSearchButton(searchWin,'复合查询')
					]
				});
				bbar = getBbar(ds);
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						showWin(win, winTitle+'——查看',sm);
						form.down('#btnBalance').hide();
						form.down('#btnRefuse').hide();
						form.down('#btnExecute').hide();
					}
				});
				/* var addAction = Ext.create('Ext.Action', {
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
				}); */
				editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					hidden : true,
					 text: '修改价格',
						handler: function(widget, event) { 
						var records = grid.getSelectionModel().getSelection();
						bookingId = records[0].get("id");
						editWin(win,winTitle+'——修改价格', sm);
						tabs.setActiveTab(0);
						Ext.apply(workbench_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
        				workbench_ds.load();
						Ext.apply(office_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
						office_ds.load();
						Ext.apply(meetingRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
						meetingRoom_ds.load();
						Ext.apply(exhibitionRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
						exhibitionRoom_ds.load();
						Ext.apply(telRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
						telRoom_ds.load();
						Ext.apply(vipRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
						vipRoom_ds.load();
						form.down('#status').setReadOnly(true);
						form.down('#code').setReadOnly(true);
						form.down('#bookingTime').setReadOnly(true);
						form.down('#buildingName').setReadOnly(true);
						form.down('#cityName').setReadOnly(true);
						form.down('#persons').setReadOnly(true);
						form.down('#consumerName').setReadOnly(true);
						form.down('#tel').setReadOnly(true);
						form.down('#email').setReadOnly(true);
						form.down('#originalCost').setReadOnly(true);
						form.down('#amender').setReadOnly(true);
						form.down('#amenderId').setValue(userId);
						form.down('#amender').setValue(userName);
						var times=new Date();
						var timess=Ext.Date.format(times,'Y-m-d H:i:s');
						form.down('#amendTime').setValue(timess);
						var originalCost = form.down('#originalCost').getValue();
						if(originalCost==''){
							var total = form.down('#total').getValue();
							form.down('#originalCost').setValue(total);
						}
					 }
				});
				backAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					hidden : true,
					text: '退回',
					handler: gridBack
				});
				balanceAction = Ext.create('Ext.Action', {
					iconCls: 'balance',
					hidden : true,
					text: '结算',
					handler :  function() {
						Ext.MessageBox.confirm('结算确认', '您是否确认结算已选中的这' + sm.getCount()
								+ '条记录，请仔细核对要结算的记录！', function(btn) {
							if (btn == 'yes') {
								var records = grid.getSelectionModel().getSelection();
								bookingId = records[0].get("id");
								showWin(win, '订单结算',sm);
								tabs.setActiveTab(0);
								Ext.apply(workbench_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
                				workbench_ds.load();
								Ext.apply(office_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
								office_ds.load();
								Ext.apply(meetingRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
								meetingRoom_ds.load();
								Ext.apply(exhibitionRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
								exhibitionRoom_ds.load();
								Ext.apply(telRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
								telRoom_ds.load();
								Ext.apply(vipRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
								vipRoom_ds.load();
								form.down('#balanceTime').setValue(Ext.Date.format(new Date(),'Y-m-d H:i:s'));
								var total = form.down('#total').getValue();
								form.down('#balancePrice').setValue(total);
								form.down('#btnBalance').show();
							}
						});
					}
				});
				 delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'produce/booking!delete',function(){});
					}
				}); 
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						//<sec:authorize url="/produce/booking!add">,addAction,copyAddAction</sec:authorize>
						<sec:authorize url="/produce/vBooking!edit">,editAction</sec:authorize>
						<sec:authorize url="/produce/vBooking!back">,backAction</sec:authorize>
						<sec:authorize url="/produce/vBooking!balance">,balanceAction</sec:authorize>
						<sec:authorize url="/produce/vBooking!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.down('#tbar_btn_edit').hide();
				grid.on('itemdblclick', function(grid,rec) {
								bookingId=rec.get('id');
								showWinByRec(win,winTitle+'——查看',rec);
								//tabs.setActiveTab(0);
								Ext.apply(workbench_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
                				workbench_ds.load();
								Ext.apply(office_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
								office_ds.load();
								Ext.apply(meetingRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
								meetingRoom_ds.load();
								Ext.apply(exhibitionRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
								exhibitionRoom_ds.load();
								Ext.apply(telRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
								telRoom_ds.load();
								Ext.apply(vipRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
								vipRoom_ds.load();
                				form.down('#btnBalance').hide();
        						form.down('#btnRefuse').hide();
        						form.down('#btnExecute').hide();
								//tabs.setActiveTab(0);
								//roll_tbar.down('#addItems').show();
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
