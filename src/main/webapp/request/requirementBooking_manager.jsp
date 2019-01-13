<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="requirementBookingDefine.jsp"%>
	<script type="text/javascript" src="ini/getRequirementBookingStatusDs.js"></script>
	<script type="text/javascript" src="request/commonality.js"></script>
	<%@ include file="requirementBookingDataExt.jsp"%>
	<%@ include file="requirementBookingFormExt.jsp"%>
	<%@ include file="requirementBookingSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);
			batchWin=getWindow('批量修改',320,160,320,160,batchForm);
			ds = getDs(mainFields, 'requirement/requirementBooking!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#btnDispose').setDisabled(selections.length != 1);
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('consumerName', 100, '',0, '<s:text name="orderRequestConsumer.name" />'),
					'-',
					getTextField('tel', 100, '',0, '<s:text name="orderRequest.tel" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 100,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['consumerName', '<s:text name="orderRequestConsumer.name" />']
							,['tel', '<s:text name="orderRequest.tel" />']
							,['createTime', '<s:text name="orderRequestCreate.time" />']
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
									sqlStr += " and consumer_name like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('tel').getValue();
								if (t_sql != "")
									sqlStr += " and tel like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/request/requirementBooking!dispose">
						,Ext.create('Ext.Button', {
							text : '处理完成',
							tooltip : '需求处理完成',
							//hidden : true,
							disabled : true,
							iconCls : 'check',
							itemId :'btnDispose',
							handler : function(){
								Ext.MessageBox.confirm('处理完成确认', '您是否确认已选中的这' + sm.getCount()
										+ '条记录，请仔细核对未处理的记录！', function(btn) {
									if (btn == 'yes') {
										editWin(win,winTitle+'——处理', sm);
										form.down('#status').setReadOnly(true);
										form.down('#consumerName').setReadOnly(true);
										form.down('#tel').setReadOnly(true);
										form.down('#createTime').setReadOnly(true);
										form.down('#content').setReadOnly(true);
										form.down('#btnDispose').show();
									}
								});
							}
						})	
						</sec:authorize>
						<sec:authorize url="/request/requirementBooking!del">
						,getDelButton(ds, sm, 'requirement/requirementBooking!delete','删除')
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
						form.down('#btnDispose').hide();
					}
				});
				editAction = Ext.create('Ext.Action', {
					iconCls: 'check',
					 text: '处理完成',
					 handler : function(){
							Ext.MessageBox.confirm('处理完成确认', '您是否确认已选中的这' + sm.getCount()
									+ '条记录，请仔细核对未处理的记录！', function(btn) {
								if (btn == 'yes') {
									editWin(win,winTitle+'——处理', sm);
									form.down('#status').setReadOnly(true);
									form.down('#consumerName').setReadOnly(true);
									form.down('#tel').setReadOnly(true);
									form.down('#createTime').setReadOnly(true);
									form.down('#content').setReadOnly(true);
									form.down('#btnDispose').show();
								}
							});
						}
				});
				delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'requirement/requirementBooking!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/request/requirementBooking!edit">,editAction</sec:authorize>
						<sec:authorize url="/request/requirementBooking!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					form.down('#btnDispose').hide();
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
