<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<%@ include file="../jspComm/extHeader.jsp"%>
<%@ include file="vConsumeRecordDefine.jsp"%>
<!-- 下拉框数据 -->
<%@ include file="../c/cd_consumeType.jsp"%>
<%@ include file="../c/cd_paymentType.jsp"%>
<%@ include file="../c/cd_users.jsp"%>
<%@ include file="../c/cd_consumer.jsp"%>
<%@ include file="../c/cd_booking.jsp"%>
<%@ include file="../c/cd_consumeArea.jsp"%>
<!-- 引入日期时间控件 -->
<script type="text/javascript" src="dateTime/UX_TimePickerField.js"></script>
<script type="text/javascript" src="dateTime/UX_DateTimePicker.js"></script>
<script type="text/javascript" src="dateTime/UX_DateTimeMenu.js"></script>
<script type="text/javascript" src="dateTime/UX_DateTimeField.js"></script>
<!-- <script type="text/javascript" src="ini/getConsumeTypeDs.js"></script> -->
<%@ include file="vConsumeRecordDataExt.jsp"%>
<%@ include file="vConsumeRecordFormExt.jsp"%>
<%@ include file="vConsumeRecordSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
	var usersName = '<sec:authentication property="principal.name"/>'
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.dateformat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,300,200,form);		
			ds = getDs(mainFields, 'crm/vConsumeRecord!managerExt', baseSql,order);
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
				items : [Ext.create('Ext.form.field.ComboBox',{
						itemId : 'balance',		
						width : 80,
						hidden: true,
						value : -1,
						mode : 'local',
						editable : false,
						store : [
							[-1,'结算状态']
							,[0, '未结算']
							,[1, '已结算']							
						]
					}),					
					'-',
					getTextField('consumerName', 80, '',0, '<s:text name="vConsumeRecord.consumerName" />'),
					'-',
					
				Ext.create('Ext.form.field.ComboBox',{
						itemId : 'consumeName',
						width : 100,
						displayField: 'name',
    					valueField: 'id',
						mode : 'local',
						emptyText:'<s:text name="vConsumeRecord.consumeType" />',
						selectOnFocus : true,
						editable : true,
						store : cb_consumeType_ds
					}),					
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'consumeAreaName',
						width : 100,
						displayField: 'name',
    					valueField: 'id',
						mode : 'local',
						emptyText:'<s:text name="consumeArea.name" />',
						selectOnFocus : true,
						editable : true,
						store : cb_consumeArea_ds
					}),					
					'-',
					getTextField('bookingCode', 80, '',0, '<s:text name="vConsumeRecord.bookingCode" />'),
					'-',
					 Ext.create('Ext.form.DateField',{
	                  name:'consumeFrom',
	                  id : 'consumeFrom',
	                  width : 100,
	                  format : 'Y-m-d',
	                  emptyText:'消费开始时间'
                      }),		
                      '-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 120,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['consumerName', '<s:text name="vConsumeRecord.consumerName" />']
							,['consumeAreaName', '<s:text name="consumeArea.name" />']
							,['paymentName', '<s:text name="vConsumeRecord.paymentName" />']
							,['consumeName', '<s:text name="vConsumeRecord.consumeType" />']
							,['consumeName', '<s:text name="vConsumeRecord.consumeType" />']
							,['usersName', '<s:text name="vConsumeRecord.usersName" />']
							,['bookingCode', '<s:text name="vConsumeRecord.bookingCode" />']
							,['consumeFrom', '<s:text name="vConsumeRecord.consumeFrom" />']
							,['consumeTo', '<s:text name="vConsumeRecord.consumeTo" />']
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
								t_sql = tbar.getComponent('balance').getValue();
								if (t_sql!=-1&&t_sql!=null)
									sqlStr += " and balance = "+ t_sql;
								t_sql = tbar.getComponent('consumerName').getValue();
								if (t_sql != "")
									sqlStr += " and consumerName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('consumeName').getValue();
								if (t_sql != null)
									sqlStr += " and consumeTypeId ="+ t_sql;
								
								t_sql = tbar.getComponent('consumeAreaName').getValue();
								//alert(t_sql);
								if (t_sql != null)
									sqlStr += " and consumeAreaId ="+ t_sql;
								
								t_sql = tbar.getComponent('bookingCode').getValue();
								if (t_sql != "")
									sqlStr += " and bookingCode like '%"+ t_sql+ "%' ";
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('consumeFrom').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',consumeFrom)=0";
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
						<sec:authorize url="/crm/vConsumeRecord!add">
						,getAddButton(win,winTitle + '——新增','新增',function(){
							form.down('#usersName').setReadOnly(true);
							form.down('#usersName').setValue(usersName);
						})
						,getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加',function(){
							form.down('#usersName').setReadOnly(true);
							form.down('#usersName').setValue(usersName);
							getChargeType();
						})
						</sec:authorize>
						<sec:authorize url="/crm/vConsumeRecord!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							form.down('#balance').setReadOnly(true);
							form.down('#usersName').setReadOnly(true);
							form.down('#usersName').setValue(usersName);
							getChargeType();
						})
						</sec:authorize>
						<sec:authorize url="/crm/vConsumeRecord!del">
						,getDelButton(ds, sm, 'crm/consumeRecord!delete','删除')
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
						form.down('#btnCount').setDisabled(true);
						getChargeType();
					}
				});
				
				var addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '新增',
					handler: function(widget, event) {
						addWin(win, winTitle + '——新增');
						form.down('#usersName').setReadOnly(true);
						form.down('#usersName').setValue(usersName);
					}
				});
				var copyAddAction = Ext.create('Ext.Action', {
					iconCls: 'copy',
					 text: '拷贝添加',
						handler: function(widget, event) { 
						copyAddWin(win,winTitle + '——拷贝添加', sm);  
						form.down('#usersName').setReadOnly(true);
						form.down('#usersName').setValue(usersName);
						getChargeType();
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm); 
						form.down('#usersName').setReadOnly(true);
						form.down('#usersName').setValue(usersName);
						getChargeType();
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'crm/consumeRecord!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/crm/vConsumeRecord!add">,addAction,copyAddAction</sec:authorize>
						<sec:authorize url="/crm/vConsumeRecord!edit">,editAction</sec:authorize>
						<sec:authorize url="/crm/vConsumeRecord!del">,delAction</sec:authorize>
						]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					getChargeType();
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
		function getChargeType(){
			var chargeType = form.down('#consumeTypeId').findRecord('id',form.down('#consumeTypeId').getValue()).get('chargeType');
			if(chargeType==1){
				form.down('#consumeDate').setVisible(true);
				form.down('#number').setVisible(false);
			}else{
				form.down('#consumeDate').setVisible(false);
				form.down('#number').setVisible(true);
			}
		}
	</script>
</body>
</html>
