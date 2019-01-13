<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<script type="text/javascript" src="ini/getDateDs.js"></script>
	<%@ include file="vVipRoomDefine.jsp"%>
	<%@ include file="vVipRoomDataExt.jsp"%>
	<script type="text/javascript" src="test/productComm.js"></script>
	<%@ include file="../c/cb_roomFacilitiess.jsp"%>
	<%@ include file="../c/cb_buildings.jsp"%>
	<%@ include file="../c/cb_floors.jsp"%>
	<%@ include file="vVipRoomFormExt.jsp"%>
	<%@ include file="vVipRoomSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);
			winPrice = getWindow(winTitle,500,200,500,200,formEditPrice);
			batchWin=getWindow('批量修改',320,160,320,160,batchForm);
			ds = getDs(mainFields, 'product/vVipRoom!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						grid.down('#editPrice').setDisabled(selections.length != 1);
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('cityName', 100, '',0, '<s:text name="vVipRoom.cityName" />'),
					'-',
					getTextField('areaName', 100, '',0, '<s:text name="vVipRoom.areaName" />'),
					'-',
					getTextField('buildingName', 100, '',0, '<s:text name="vVipRoom.buildingName" />'),
					'-',
					getTextField('name', 100, '',0, '<s:text name="vVipRoom.name" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['cityName', '<s:text name="vVipRoom.cityName" />']
							,['areaName', '<s:text name="vVipRoom.areaName" />']
							,['buildingName', '<s:text name="vVipRoom.buildingName" />']
							,['floorName', '<s:text name="vVipRoom.floorName" />']
							,['name', '<s:text name="vVipRoom.name" />']
							,['galleryful', '<s:text name="vVipRoom.galleryful" />']
							,['price', '<s:text name="vVipRoom.price" />']
							,['equipment', '<s:text name="vVipRoom.equipment" />']
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
								t_sql = tbar.getComponent('cityName').getValue();
								if (t_sql != "")
									sqlStr += " and cityName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('areaName').getValue();
								if (t_sql != "")
									sqlStr += " and areaName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('buildingName').getValue();
								if (t_sql != "")
									sqlStr += " and buildingName like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/product/vVipRoom!add">
						,getAddButton(win,winTitle + '——新增','新增',function(){form.down('#uploadFile').setVisible(true);	
						form.down('#delFileFlag').setVisible(false);	
						form.down('#fileShow').setVisible(false);}),
						getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加',function(){
							setEquipment();
						})
						</sec:authorize>
						<sec:authorize url="/product/vVipRoom!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
						var rec=(sm.getSelection())[0];
						setEquipment();
						if(rec.get('pic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/vipRoom/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');
					}else{
						form.down('#fileShow').setValue('');
					}
						form.down('#uploadFile').setVisible(true);	
						form.down('#delFileFlag').setVisible(true);	
						form.down('#fileShow').setVisible(true);
						form.down('#price').setReadOnly(true);
						form.down('#unit').setReadOnly(true);
						})/* ,
						getBatchButton(batchWin,sm,'批量修改') */
						</sec:authorize>
						<sec:authorize url="/product/vVipRoom!editPrice">
						,getEditPriceButton(winPrice,winTitle+'——改价', sm,'改价',function(){
							formEditPrice.down('#name').setReadOnly(true);
						})
						</sec:authorize>
						<sec:authorize url="/product/vVipRoom!del">
						,getDelButton(ds, sm, 'product/vipRoom!delete','删除')
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
						setEquipment();
						var rec=(sm.getSelection())[0];
						if(rec.get('pic')!=''){
							form.down('#fileShow').setValue('<a target="_blank" href="pics/vipRoom/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
						}else{
							form.down('#fileShow').setValue('');
						}
						form.down('#uploadFile').setVisible(false);	
						form.down('#delFileFlag').setVisible(false);	
						form.down('#fileShow').setVisible(true);
						Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
						cb_floors_ds.loadPage(1);
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
						setEquipment();
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
								editWin(win,winTitle+'——修改', sm); 
								setEquipment();
								var rec=(sm.getSelection())[0]; 
								if(rec.get('pic')!=''){
								form.down('#fileShow').setValue('<a target="_blank" href="pics/office/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
							}else{
								form.down('#fileShow').setValue('');
							}
							form.down('#uploadFile').setVisible(true);	
							form.down('#delFileFlag').setVisible(true);	
							form.down('#fileShow').setVisible(true);
							form.down('#fileShow').hideLabel=true;
							form.down('#price').setReadOnly(true);
							form.down('#unit').setReadOnly(true);
							Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
							cb_floors_ds.loadPage(1);
					 }
				});
				var editPriceAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					text: '改价',
					handler: function(widget, event) { 
						editWin(winPrice,winTitle+'——改价', sm); 
						formEditPrice.down('#name').setReadOnly(true);
					}
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'product/vipRoom!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/product/vVipRoom!add">,addAction,copyAddAction</sec:authorize>
						<sec:authorize url="/product/vVipRoom!edit">,editAction</sec:authorize>
						<sec:authorize url="/product/vVipRoom!del">,delAction</sec:authorize>
						<sec:authorize url="/product/vVipRoom!editPrice">,editPriceAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					setEquipment();
					if(rec.get('pic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/vipRoom/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow').setValue('');
					}
					form.down('#uploadFile').setVisible(false);	
					form.down('#delFileFlag').setVisible(false);	
					form.down('#fileShow').setVisible(true);					
					Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
					cb_floors_ds.loadPage(1);
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
