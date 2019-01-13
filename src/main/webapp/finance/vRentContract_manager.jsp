<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<script type="text/javascript" src="dateTime/UX_TimePickerField.js"></script>
    <script type="text/javascript" src="dateTime/UX_DateTimePicker.js"></script>
    <script type="text/javascript" src="dateTime/UX_DateTimeMenu.js"></script>
    <script type="text/javascript" src="dateTime/UX_DateTimeField.js"></script>
    <%@ include file="../c/cb_buildingss.jsp"%>
	<%@ include file="../c/cb_floorss.jsp"%>
	<%@ include file="../c/cb_workbenchTypess.jsp"%>
	<script type="text/javascript" src="test/productComm.js"></script>
	<%@ include file="vRentContractDefine.jsp"%>
	<%@ include file="vRentContractDataExt.jsp"%>
	<%@ include file="vRentContractFormExt.jsp"%>
	<%@ include file="vRentContractSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,300,form);
			ds = getDs(mainFields, 'finance/vRentContract!managerExt', baseSql,order);
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
				items : [
				    getTextField('floorName', 100, '',0, '<s:text name="vRentContract.floorName" />'),
					'-',
					getTextField('contractNumber', 100, '',0, '<s:text name="vRentContract.contractNumber" />'),
					'-',
					getTextField('customerName', 100, '',0, '<s:text name="vRentContract.customerName" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'roomNumber',
						width : 125,
						displayField: 'name',
    					valueField: 'id',
						mode : 'local',
						emptyText:'<s:text name="vRentContract.roomNumber" />',
						selectOnFocus : true,
						editable : true,
						store : cb_workbenchTypes_ds
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
							,['contractNumber', '<s:text name="vRentContract.contractNumber" />']
							,['customerName', '<s:text name="vRentContract.customerName" />']
							,['contractDate', '<s:text name="vRentContract.contractDate" />']
							,['usefulLife', '<s:text name="vRentContract.usefulLife" />']
							,['validDate', '<s:text name="vRentContract.validDate" />']
							,['downPayment', '<s:text name="vRentContract.downPayment" />']
							,['margin', '<s:text name="vRentContract.margin" />']
							,['roomNumber', '<s:text name="vRentContract.roomNumber" />']
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
							    t_sql = tbar.getComponent('floorName').getValue();
								if (t_sql != "")
									sqlStr += " and floorName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('contractNumber').getValue();
								if (t_sql != "")
									sqlStr += " and contractNumber like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('customerName').getValue();
								if (t_sql != "")
									sqlStr += " and customerName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('roomNumber').getValue();
								if (t_sql != "" && t_sql != undefined)
									sqlStr += " and roomNumber like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/finance/vRentContract!add">
						,getAddButton(win,winTitle + '——新增','新增',function(){
						form.down('#uploadFile').setVisible(true);
						form.down('#delFileFlag').setVisible(false);
						form.down('#fileShow').setVisible(false);
						}),
						getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加',function(){
						setRoomNumber();
						var recs=(sm.getSelection())[0];
			            var res=recs.get('buildingId');
				        Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+res,order : order});
				        cb_floors_ds.loadPage(1);
				        form.down('#uploadFile').setVisible(true);
						form.down('#delFileFlag').setVisible(true);
						form.down('#fileShow').setVisible(true);
						
						var recs=(sm.getSelection())[0];
				        var ress=recs.get('validDate');
				        var date = Ext.Date.add(new Date(ress), Ext.Date.HOUR, -8);
				        var a = Ext.Date.format(date,'Y-m-d H:i:s');
				        form.down('#validDate').setValue(a);
						})
						</sec:authorize>
						<sec:authorize url="/finance/vRentContract!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
						setRoomNumber();
						var rec=(sm.getSelection())[0];
						var res=rec.get('buildingId');
						Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+res,order : order});
						cb_floors_ds.loadPage(1);
						form.down('#uploadFile').setVisible(true);
						form.down('#delFileFlag').setVisible(true);
						form.down('#fileShow').setVisible(true);
						
						var recs=(sm.getSelection())[0];
				        var ress=recs.get('validDate');
				        var date = Ext.Date.add(new Date(ress), Ext.Date.HOUR, -8);
				        var a = Ext.Date.format(date,'Y-m-d H:i:s');
				        form.down('#validDate').setValue(a);
						})
						</sec:authorize>
						<sec:authorize url="/finance/vRentContract!del">
						,getDelButton(ds, sm, 'finance/rentContract!delete','删除')
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
						setRoomNumber();
						form.down('#uploadFile').setVisible(false);
						form.down('#delFileFlag').setVisible(false);
						form.down('#fileShow').setVisible(true);	
						var recs=(sm.getSelection())[0];
				        var ress=recs.get('validDate');
				        var date = Ext.Date.add(new Date(ress), Ext.Date.HOUR, -8);
				        var a = Ext.Date.format(date,'Y-m-d H:i:s');
				        form.down('#validDate').setValue(a);
					}
				});
				var addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '新增',
					handler: function(widget, event) {
						addWin(win, winTitle + '——新增');
						form.down('#uploadFile').setVisible(true);
						form.down('#delFileFlag').setVisible(false);
						form.down('#fileShow').setVisible(false);
					}
				});
				var copyAddAction = Ext.create('Ext.Action', {
					iconCls: 'copy',
					 text: '拷贝添加',
						handler: function(widget, event) { 
						copyAddWin(win,winTitle + '——拷贝添加', sm); 
						setRoomNumber();  
						var recs=(sm.getSelection())[0];
			            var res=recs.get('buildingId');
				        Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+res,order : order});
				        cb_floors_ds.loadPage(1);
				        form.down('#uploadFile').setVisible(true);
						form.down('#delFileFlag').setVisible(true);
						form.down('#fileShow').setVisible(true);
						
						var recs=(sm.getSelection())[0];
				        var ress=recs.get('validDate');
				        var date = Ext.Date.add(new Date(ress), Ext.Date.HOUR, -8);
				        var a = Ext.Date.format(date,'Y-m-d H:i:s');
				        form.down('#validDate').setValue(a);
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);   
						setRoomNumber();
						var rec=(sm.getSelection())[0];
						var res=rec.get('buildingId');
						Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+res,order : order});
						cb_floors_ds.loadPage(1);
						form.down('#uploadFile').setVisible(true);
						form.down('#delFileFlag').setVisible(true);
						form.down('#fileShow').setVisible(true);
						
						var recs=(sm.getSelection())[0];
				        var ress=recs.get('validDate');
				        var date = Ext.Date.add(new Date(ress), Ext.Date.HOUR, -8);
				        var a = Ext.Date.format(date,'Y-m-d H:i:s');
				        form.down('#validDate').setValue(a);
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'finance/rentContract!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/finance/vRentContract!add">,addAction,copyAddAction</sec:authorize>
						<sec:authorize url="/finance/vRentContract!edit">,editAction</sec:authorize>
						<sec:authorize url="/finance/vRentContract!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					setRoomNumber();
					form.down('#uploadFile').setVisible(false);
					form.down('#delFileFlag').setVisible(false);
					form.down('#fileShow').setVisible(true);
					//var sous=form.down('#usefulLife').getValue();
					var recs=(sm.getSelection())[0];
			        var ress=recs.get('validDate');
			        var date = Ext.Date.add(new Date(ress), Ext.Date.HOUR, -8);
			        var a = Ext.Date.format(date,'Y-m-d H:i:s');
			        form.down('#validDate').setValue(a);
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
