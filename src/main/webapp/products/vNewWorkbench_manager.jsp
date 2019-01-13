<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="vNewWorkbenchDefine.jsp"%>
	<!-- 下拉框数据 -->
	<%@ include file="../c/cb_buildings.jsp"%>
	<%@ include file="../c/cb_floors.jsp"%>
	<%@ include file="vNewWorkbenchDataExt.jsp"%>
	<%@ include file="vNewWorkbenchFormExt.jsp"%>
	<%@ include file="vNewWorkbenchBookingGridExt.jsp"%>
	<%@ include file="vNewWorkbenchSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);
			bookingWin = getWindow(winTitle,winWidth,winHeight,500,200,workbench_grid);
			ds = getDs(mainFields, 'products/vNewWorkbench!managerExt', baseSql,order);
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
					getTextField('buildingName', 100, '',0, '<s:text name="vNewWorkbench.buildingName" />'),
					'-',
					getTextField('floorName', 100, '',0, '<s:text name="vNewWorkbench.floorName" />'),
					'-',
					getTextField('name', 100, '',0, '<s:text name="vNewWorkbench.name" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['buildingName', '<s:text name="vNewWorkbench.buildingName" />']
							,['floorName', '<s:text name="vNewWorkbench.floorName" />']
							,['name', '<s:text name="vNewWorkbench.name" />']
							,['quantity', '<s:text name="vNewWorkbench.quantity" />']
							,['price', '<s:text name="vNewWorkbench.price" />']
							,['deposit', '<s:text name="vNewWorkbench.deposit" />']
							,['payRatio', '<s:text name="vNewWorkbench.payRatio" />']
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
								t_sql = tbar.getComponent('buildingName').getValue();
								if (t_sql != "")
									sqlStr += " and buildingName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('floorName').getValue();
								if (t_sql != "")
									sqlStr += " and floorName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('name').getValue();
								if (t_sql != "")
									sqlStr += " and name like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/products/newWorkbench!add">
						,getAddButton(win,winTitle + '——新增','新增')
						</sec:authorize>
						<sec:authorize url="/products/newWorkbench!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							var rec=(sm.getSelection())[0];
							Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
							cb_floors_ds.loadPage(1);
							if(rec.get('planePic')!=''&&rec.get('planePic')!=null){
								form.down('#fileShow1').setValue('<a target="_blank" href="pics/newWorkbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');//.setVisible(true);
							}else{
								form.down('#fileShow1').setValue('');
							}
							if(rec.get('coverPic')!=''&&rec.get('coverPic')!=null){
								form.down('#fileShow2').setValue('<a target="_blank" href="pics/newWorkbench/'+rec.get('coverPic')+'">'+rec.get('coverPic')+'</a>');//.setVisible(true);
							}else{
								form.down('#fileShow2').setValue('');
							}
							form.down('#uploadFile1').setVisible(true);
							form.down('#uploadFile2').setVisible(true);
							form.down('#delFileFlag1').setVisible(true);
							form.down('#delFileFlag0').setVisible(true);
							form.down('#fileShow1').setVisible(true);
							form.down('#fileShow2').setVisible(true);
							form.down('#editId').setValue(rec.get('floorName'));
						})
						</sec:authorize>
						<sec:authorize url="/products/newWorkbench!del">
						,getDelButton(ds, sm, 'products/newWorkbench!delete','删除')
						</sec:authorize>
					]
				});
				bbar = getBbar(ds);
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						showWin(win, winTitle+'——查看',sm);
						form.down('#uploadFile1').setVisible(false);
						form.down('#uploadFile2').setVisible(false);
						form.down('#delFileFlag1').setVisible(false);
						form.down('#delFileFlag0').setVisible(false);
						form.down('#fileShow1').setVisible(true);
						form.down('#fileShow2').setVisible(true);
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
						form.down('#editId').setValue(rec.get('floorName'));
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'products/newWorkbench!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/products/newWorkbench!add">,addAction</sec:authorize>
						<sec:authorize url="/products/newWorkbench!edit">,editAction</sec:authorize>
						<sec:authorize url="/products/newWorkbench!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
					cb_floors_ds.loadPage(1);
					if(rec.get('planePic')!=''&&rec.get('planePic')!=null){
						form.down('#fileShow1').setValue('<a target="_blank" href="pics/newWorkbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow1').setValue('');
					}
					if(rec.get('coverPic')!=''&&rec.get('coverPic')!=null){
						form.down('#fileShow2').setValue('<a target="_blank" href="pics/newWorkbench/'+rec.get('coverPic')+'">'+rec.get('coverPic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow2').setValue('');
					}
					form.down('#uploadFile1').setVisible(false);
					form.down('#uploadFile2').setVisible(false);
					form.down('#delFileFlag1').setVisible(false);
					form.down('#delFileFlag0').setVisible(false);
					form.down('#fileShow1').setVisible(true);
					form.down('#fileShow2').setVisible(true);
				});
				grid.on('itemcontextmenu',function(view, rec, node, index, e) {
					Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
					cb_floors_ds.loadPage(1);
					if(rec.get('planePic')!=''&&rec.get('planePic')!=null){
						form.down('#fileShow1').setValue('<a target="_blank" href="pics/newWorkbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow1').setValue('');
					}
					if(rec.get('coverPic')!=''&&rec.get('coverPic')!=null){
						form.down('#fileShow2').setValue('<a target="_blank" href="pics/newWorkbench/'+rec.get('coverPic')+'">'+rec.get('coverPic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow2').setValue('');
					}
					form.down('#editId').setValue(rec.get('floorName'));
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
