<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="vProductDefine.jsp"%>
	<%@ include file="vProductDataExt.jsp"%>
	<%@ include file="../c/cb_building.jsp"%>
	<%@ include file="../c/cb_floor.jsp"%>
	<%@ include file="../c/cb_genre.jsp"%>
	<%@ include file="../c/cb_roomFacilities.jsp"%>
	<%@ include file="../c/cb_productType.jsp"%>
	<script type="text/javascript" src="test/productComm.js"></script>
	<script type="text/javascript" src="ini/getProductUnitDs.js"></script>
	<%@ include file="vProductFormExt.jsp"%>
	<%@ include file="vProductSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		var id = eval(location.search.substring(11));
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);
			batchWin=getWindow('批量修改',320,160,320,160,batchForm);
			ds = getDs(mainFields, 'system/vProduct!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'productName',
						width : 100,
						displayField: 'name',
    					valueField: 'id',
						mode : 'local',
						emptyText:'<s:text name="vProduct.productName" />',
						selectOnFocus : true,
						editable : true,
						store : cb_productType_ds
					}),	
					'-',
					getTextField('buildingName', 100, '',0, '<s:text name="vProduct.buildingName" />'),
					'-',
					getTextField('name', 100, '',0, '<s:text name="vProduct.name" />'),
					'-',
					getTextField('floorName', 100, '',0, '<s:text name="vProduct.floorName" />'),'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['productName', '<s:text name="vProduct.productName" />']
							,['buildingName', '<s:text name="vProduct.buildingName" />']
							,['floorName', '<s:text name="vWorkbench.floorName" />']
							,['name', '<s:text name="vProduct.name" />']
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
								t_sql = tbar.getComponent('productName').getValue();
								if (t_sql != null)
									sqlStr += " and productId = "+t_sql;
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
						<sec:authorize url="/product/workbench!add">
						,getAddButton(win,winTitle + '——新增','新增',function(){form.down('#uploadFile').setVisible(true);	
						form.down('#delFileFlag').setVisible(false);	
						form.down('#fileShow').setVisible(false);	
						getProduct();
						}),
						getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加',function(){
							getProduct();
							var floorId=(sm.getSelection())[0].get('floorId');
							form.down('#floorName').setValue(floorId);
							setEquipment();
						})
						</sec:authorize>
						<sec:authorize url="/product/workbench!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
						var rec=(sm.getSelection())[0];
						//str=form.down('#facility').getValue();
						if(rec.get('pic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/workbench/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');
					}else{
						form.down('#fileShow').setValue('');
					}
						form.down('#uploadFile').setVisible(true);	
						form.down('#delFileFlag').setVisible(true);	
						form.down('#fileShow').setVisible(true);
						form.down('#productId').setReadOnly(true);
						Ext.apply(cb_genre_ds.proxy.extraParams,{whereSql : ' and productTypeId='+rec.get('productId'),order : order});
						cb_genre_ds.loadPage(1);
						Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
						cb_floors_ds.loadPage(1);
						var floorId=rec.get('floorId');
						form.down('#floorName').setValue(floorId);
						setEquipment();
						})/* ,
						getBatchButton(batchWin,sm,'批量修改') */
						</sec:authorize>
						<sec:authorize url="/product/workbench!del">
						,getDelButton(ds, sm, 'system/products!delete','删除')
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
						var rec=(sm.getSelection())[0];
						if(rec.get('pic')!=''){
							form.down('#fileShow').setValue('<a target="_blank" href="pics/workbench/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
						}else{
							form.down('#fileShow').setValue('');
						}
						form.down('#uploadFile').setVisible(false);	
						form.down('#delFileFlag').setVisible(false);	
						form.down('#fileShow').setVisible(true);
						Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
						cb_floors_ds.loadPage(1);
						var floorId=rec.get('floorId');
						form.down('#floorName').setValue(floorId);
						setEquipment();
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
						getProduct();
					}
				});
				var copyAddAction = Ext.create('Ext.Action', {
					iconCls: 'copy',
					 text: '拷贝添加',
						handler: function(widget, event) { 
						copyAddWin(win,winTitle + '——拷贝添加', sm); 
						var productId = ds.getAt(1).get('productId');
						getProduct();
						var floorId=(sm.getSelection())[0].get('floorId');
						form.down('#floorName').setValue(floorId);
						setEquipment();
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
								editWin(win,winTitle+'——修改', sm);  
								var rec=(sm.getSelection())[0]; 
								if(rec.get('pic')!=''){
								form.down('#fileShow').setValue('<a target="_blank" href="pics/workbench/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
							}else{
								form.down('#fileShow').setValue('');
							}
							form.down('#uploadFile').setVisible(true);	
							form.down('#delFileFlag').setVisible(true);	
							form.down('#fileShow').setVisible(true);
							form.down('#fileShow').hideLabel=true;
							form.down('#productId').setReadOnly(true);
							Ext.apply(cb_genre_ds.proxy.extraParams,{whereSql : ' and productTypeId='+rec.get('productId'),order : order});
							cb_genre_ds.loadPage(1);
							Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
							cb_floors_ds.loadPage(1);
							var floorId=rec.get('floorId');
							form.down('#floorName').setValue(floorId);
							setEquipment();
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'system/products!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/product/workbench!add">,addAction,copyAddAction</sec:authorize>
						<sec:authorize url="/product/workbench!edit">,editAction</sec:authorize>
						<sec:authorize url="/product/workbench!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				//grid.columns[3].hidden=true;
				//form.down('#equipment').setEditable(false);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					if(rec.get('pic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/workbench/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow').setValue('');
					}
					form.down('#uploadFile').setVisible(false);	
					form.down('#delFileFlag').setVisible(false);	
					form.down('#fileShow').setVisible(true);
					Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
					cb_floors_ds.loadPage(1); 
					var floorId=rec.get('floorId');
					form.down('#floorName').setValue(floorId);
					setEquipment();
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
				function getProduct(){
					if(ds.getAt(0)==undefined){
						form.down('#productId').setValue(id);
						form.down('#productId').setReadOnly(true);
						Ext.apply(cb_genre_ds.proxy.extraParams,{whereSql : ' and productTypeId='+id,
							order : order
						});
						cb_genre_ds.loadPage(1);
					}else{
						form.down('#productId').setValue(id);
						form.down('#productId').setReadOnly(true);
						Ext.apply(cb_genre_ds.proxy.extraParams,{whereSql : ' and productTypeId='+id,
									order : order
								});
						cb_genre_ds.loadPage(1);
					}
				}
		});
	</script>
</body>
</html>
