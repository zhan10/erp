<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<script type="text/javascript" src="ini/getDateDsOnly.js"></script>
	<script type="text/javascript" src="test/productComm.js"></script>
	<%@ include file="../c/cb_buildings.jsp"%>
	<%@ include file="../c/cb_floors.jsp"%>
	<%@ include file="../c/cb_roomFacilitiess.jsp"%>
	<%@ include file="workbenchTypeDefine.jsp"%>
	<%@ include file="workbenchTypeDataExt.jsp"%>
	
	<!-- kindeditor富文本 -->
	<script type="text/javascript" src="kindeditor/kindeditor-min.js"></script> 
	<script type="text/javascript" src="kindeditor/lang/zh_CN.js"></script>
	<script type="text/javascript" src="kindeditor/license.js"></script>
	
	<%@ include file="workbenchTypeFormExt.jsp"%>
	<%@ include file="workbenchTypeSearchExt.jsp"%>	
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
			ds = getDs(mainFields, 'product/workbenchType!managerExt', baseSql,order);
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
					getTextField('name', 100, '',0, '<s:text name="workbenchType.name" />'),
					'-',
					getTextField('intro', 100, '',0, '<s:text name="workbenchType.intro" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['name', '<s:text name="workbenchType.name" />']
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
								t_sql = tbar.getComponent('name').getValue();
								if (t_sql != "")
									sqlStr += " and name like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('intro').getValue();
								if (t_sql != "")
									sqlStr += " and intro like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/product/workbenchType!add">
						,getAddButton(win,winTitle + '——批量新增工位','批量新增工位',function(){
							form.down('#uploadFile').setVisible(true);
							form.down('#uploadFile1').setVisible(true);
							form.down('#uploadFile2').setVisible(true);
							form.down('#uploadFile3').setVisible(true);
							form.down('#uploadFile4').setVisible(true);
							form.down('#uploadFile5').setVisible(true);
							form.down('#delFileFlag0').setVisible(false);
							form.down('#delFileFlag1').setVisible(false);
							form.down('#delFileFlag2').setVisible(false);
							form.down('#delFileFlag3').setVisible(false);
							form.down('#delFileFlag4').setVisible(false);
							form.down('#delFileFlag5').setVisible(false);
							form.down('#fileShow').setVisible(false);
							form.down('#fileShow1').setVisible(false);
							form.down('#fileShow2').setVisible(false);
							form.down('#fileShow3').setVisible(false);
							form.down('#fileShow4').setVisible(false);
							form.down('#fileShow5').setVisible(false);}),
						getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加',function(){
							setEquipment();
						})
					
						</sec:authorize>
						 <sec:authorize url="/product/workbenchType!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							var rec=(sm.getSelection())[0];
							setEquipment();
							if(rec.get('planePic')!=''){
							form.down('#fileShow').setValue('<a target="_blank" href="pics/workbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');
						}else{
							form.down('#fileShow').setValue('');
						};
						if(rec.get('bigPic')!=''){
							form.down('#fileShow1').setValue('<a target="_blank" href="pics/workbench/'+rec.get('bigPic')+'">'+rec.get('bigPic')+'</a>');
						}else{
							form.down('#fileShow1').setValue('');
						};
						if(rec.get('leftPic')!=''){
							form.down('#fileShow2').setValue('<a target="_blank" href="pics/workbench/'+rec.get('leftPic')+'">'+rec.get('leftPic')+'</a>');
						}else{
							form.down('#fileShow2').setValue('');
						};
						if(rec.get('midPic')!=''){
							form.down('#fileShow3').setValue('<a target="_blank" href="pics/workbench/'+rec.get('midPic')+'">'+rec.get('midPic')+'</a>');
						}else{
							form.down('#fileShow3').setValue('');
						};
						if(rec.get('rightPic')!=''){
							form.down('#fileShow4').setValue('<a target="_blank" href="pics/workbench/'+rec.get('rightPic')+'">'+rec.get('rightPic')+'</a>');
						}else{
							form.down('#fileShow4').setValue('');
						};
						if(rec.get('planePic')!=''){
							form.down('#fileShow5').setValue('<a target="_blank" href="pics/workbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');
						}else{
							form.down('#fileShow5').setValue('');
						};
							form.down('#uploadFile').setVisible(true);
							form.down('#uploadFile1').setVisible(true);
							form.down('#uploadFile2').setVisible(true);
							form.down('#uploadFile3').setVisible(true);
							form.down('#uploadFile4').setVisible(true);
							form.down('#uploadFile5').setVisible(true);
							form.down('#delFileFlag0').setVisible(true);	
							form.down('#delFileFlag1').setVisible(true);
							form.down('#delFileFlag2').setVisible(true);
							form.down('#delFileFlag3').setVisible(true);
							form.down('#delFileFlag4').setVisible(true);
							form.down('#delFileFlag5').setVisible(true);
							form.down('#fileShow').setVisible(true);
							form.down('#fileShow1').setVisible(true);
							form.down('#fileShow2').setVisible(true);
							form.down('#fileShow3').setVisible(true);
							form.down('#fileShow4').setVisible(true);
							form.down('#fileShow5').setVisible(true);
							form.down('#buildingId').setReadOnly(true);
							form.down('#floorId').setReadOnly(true);
							form.down('#count').setReadOnly(true);
							form.down('#price').setReadOnly(true);
							form.down('#unit').setReadOnly(true);
							}) /* ,
						getBatchButton(batchWin,sm,'批量修改') */
						</sec:authorize>
						<sec:authorize url="/product/workbenchType!editPrice">
						,getEditPriceButton(winPrice,winTitle+'——改价', sm,'改价',function(){
							formEditPrice.down('#name').setReadOnly(true);
						})
						</sec:authorize>
						<sec:authorize url="/product/workbenchType!del">
						,getDelButton(ds, sm, 'product/workbenchType!delete','删除')
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
						if(rec.get('planePic')!=''){
							form.down('#fileShow').setValue('<a target="_blank" href="pics/workbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');//.setVisible(true);
						}else{
							form.down('#fileShow').setValue('');
						}
						if(rec.get('bigPic')!=''){
							form.down('#fileShow1').setValue('<a target="_blank" href="pics/workbench/'+rec.get('bigPic')+'">'+rec.get('bigPic')+'</a>');//.setVisible(true);
						}else{
							form.down('#fileShow1').setValue('');
						}
						if(rec.get('leftPic')!=''){
							form.down('#fileShow2').setValue('<a target="_blank" href="pics/workbench/'+rec.get('leftPic')+'">'+rec.get('leftPic')+'</a>');//.setVisible(true);
						}else{
							form.down('#fileShow2').setValue('');
						}
						if(rec.get('midPic')!=''){
							form.down('#fileShow3').setValue('<a target="_blank" href="pics/workbench/'+rec.get('midPic')+'">'+rec.get('midPic')+'</a>');//.setVisible(true);
						}else{
							form.down('#fileShow3').setValue('');
						}
						if(rec.get('rightPic')!=''){
							form.down('#fileShow4').setValue('<a target="_blank" href="pics/workbench/'+rec.get('rightPic')+'">'+rec.get('rightPic')+'</a>');//.setVisible(true);
						}else{
							form.down('#fileShow4').setValue('');
						}
						if(rec.get('planePic')!=''){
							form.down('#fileShow5').setValue('<a target="_blank" href="pics/workbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');//.setVisible(true);
						}else{
							form.down('#fileShow5').setValue('');
						}
						form.down('#uploadFile').setVisible(false);
						form.down('#uploadFile1').setVisible(false);
						form.down('#uploadFile2').setVisible(false);
						form.down('#uploadFile3').setVisible(false);
						form.down('#uploadFile4').setVisible(false);
						form.down('#uploadFile5').setVisible(false);
						form.down('#delFileFlag0').setVisible(false);
						form.down('#delFileFlag1').setVisible(false);
						form.down('#delFileFlag2').setVisible(false);
						form.down('#delFileFlag3').setVisible(false);
						form.down('#delFileFlag4').setVisible(false);
						form.down('#delFileFlag5').setVisible(false);
						form.down('#fileShow').setVisible(true);
						form.down('#fileShow1').setVisible(true);
						form.down('#fileShow2').setVisible(true);
						form.down('#fileShow3').setVisible(true);
						form.down('#fileShow4').setVisible(true);
						form.down('#fileShow5').setVisible(true);
						Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
						cb_floors_ds.loadPage(1);
					}
				});
				var addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '批量新增工位',
					handler: function(widget, event) {
						addWin(win, winTitle + '——批量新增工位');
						form.down('#uploadFile').setVisible(true);
						form.down('#uploadFile1').setVisible(true);
						form.down('#uploadFile2').setVisible(true);
						form.down('#uploadFile3').setVisible(true);
						form.down('#uploadFile4').setVisible(true);
						form.down('#uploadFile5').setVisible(true);
						form.down('#delFileFlag0').setVisible(false);
						form.down('#delFileFlag1').setVisible(false);
						form.down('#delFileFlag2').setVisible(false);
						form.down('#delFileFlag3').setVisible(false);
						form.down('#delFileFlag4').setVisible(false);
						form.down('#delFileFlag5').setVisible(false);
						form.down('#fileShow').setVisible(false);
						form.down('#fileShow1').setVisible(false);
						form.down('#fileShow2').setVisible(false);
						form.down('#fileShow3').setVisible(false);
						form.down('#fileShow4').setVisible(false);
						form.down('#fileShow5').setVisible(false);
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
						var rec=(sm.getSelection())[0];										
						setEquipment();
						if(rec.get('planePic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/workbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow').setValue('');
					};
					if(rec.get('bigPic')!=''){
						form.down('#fileShow1').setValue('<a target="_blank" href="pics/workbench/'+rec.get('bigPic')+'">'+rec.get('bigPic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow1').setValue('');
					};
					if(rec.get('leftPic')!=''){
						form.down('#fileShow2').setValue('<a target="_blank" href="pics/workbench/'+rec.get('leftPic')+'">'+rec.get('leftPic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow2').setValue('');
					};
					if(rec.get('midPic')!=''){
						form.down('#fileShow3').setValue('<a target="_blank" href="pics/workbench/'+rec.get('midPic')+'">'+rec.get('midPic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow3').setValue('');
					};
					if(rec.get('rightPic')!=''){
						form.down('#fileShow4').setValue('<a target="_blank" href="pics/workbench/'+rec.get('rightPic')+'">'+rec.get('rightPic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow4').setValue('');
					};
					if(rec.get('planePic')!=''){
						form.down('#fileShow5').setValue('<a target="_blank" href="pics/workbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow5').setValue('');
					};
					form.down('#uploadFile').setVisible(true);
					form.down('#uploadFile1').setVisible(true);
					form.down('#uploadFile2').setVisible(true);
					form.down('#uploadFile3').setVisible(true);
					form.down('#uploadFile4').setVisible(true);
					form.down('#uploadFile5').setVisible(true);
					form.down('#delFileFlag0').setVisible(true);	
					form.down('#delFileFlag1').setVisible(true);
					form.down('#delFileFlag2').setVisible(true);
					form.down('#delFileFlag3').setVisible(true);
					form.down('#delFileFlag4').setVisible(true);
					form.down('#delFileFlag5').setVisible(true);
					form.down('#fileShow').setVisible(true);
					form.down('#fileShow1').setVisible(true);
					form.down('#fileShow2').setVisible(true);
					form.down('#fileShow3').setVisible(true);
					form.down('#fileShow4').setVisible(true);
					form.down('#fileShow5').setVisible(true);
					form.down('#fileShow').hideLabel=true;
					form.down('#fileShow1').hideLabel=true;
					form.down('#fileShow2').hideLabel=true;
					form.down('#fileShow3').hideLabel=true;
					form.down('#fileShow4').hideLabel=true;
					form.down('#fileShow5').hideLabel=true;
					form.down('#buildingId').setReadOnly(true);
					form.down('#floorId').setReadOnly(true);
					form.down('#count').setReadOnly(true);
					form.down('#price').setReadOnly(true);
					form.down('#unit').setReadOnly(true);
					Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
					cb_floors_ds.loadPage(1);
					 } 
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'product/workbenchType!delete',function(){});
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
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/product/workbenchType!add">,addAction,copyAddAction</sec:authorize>
						<sec:authorize url="/product/workbenchType!edit">,editAction</sec:authorize>
						<sec:authorize url="/product/workbenchType!del">,delAction</sec:authorize>
						<sec:authorize url="/product/workbenchType!editPrice">,editPriceAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					setEquipment();
					if(rec.get('planePic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/workbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow').setValue('');
					}
					if(rec.get('bigPic')!=''){
						form.down('#fileShow1').setValue('<a target="_blank" href="pics/workbench/'+rec.get('bigPic')+'">'+rec.get('bigPic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow1').setValue('');
					}
					if(rec.get('leftPic')!=''){
						form.down('#fileShow2').setValue('<a target="_blank" href="pics/workbench/'+rec.get('leftPic')+'">'+rec.get('leftPic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow2').setValue('');
					}
					if(rec.get('midPic')!=''){
						form.down('#fileShow3').setValue('<a target="_blank" href="pics/workbench/'+rec.get('midPic')+'">'+rec.get('midPic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow3').setValue('');
					}
					if(rec.get('rightPic')!=''){
						form.down('#fileShow4').setValue('<a target="_blank" href="pics/workbench/'+rec.get('rightPic')+'">'+rec.get('rightPic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow4').setValue('');
					}
					if(rec.get('planePic')!=''){
						form.down('#fileShow5').setValue('<a target="_blank" href="pics/workbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow5').setValue('');
					}
					form.down('#uploadFile').setVisible(false);
					form.down('#uploadFile1').setVisible(false);
					form.down('#uploadFile2').setVisible(false);
					form.down('#uploadFile3').setVisible(false);
					form.down('#uploadFile4').setVisible(false);
					form.down('#uploadFile5').setVisible(false);
					form.down('#delFileFlag0').setVisible(false);
					form.down('#delFileFlag1').setVisible(false);
					form.down('#delFileFlag2').setVisible(false);
					form.down('#delFileFlag3').setVisible(false);
					form.down('#delFileFlag4').setVisible(false);
					form.down('#delFileFlag5').setVisible(false);
					form.down('#fileShow').setVisible(true);
					form.down('#fileShow1').setVisible(true);
					form.down('#fileShow2').setVisible(true);
					form.down('#fileShow3').setVisible(true);
					form.down('#fileShow4').setVisible(true);
					form.down('#fileShow5').setVisible(true);
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
