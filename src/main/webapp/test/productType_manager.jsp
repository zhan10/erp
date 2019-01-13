<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="productTypeDefine.jsp"%>
	<%@ include file="productTypeDataExt.jsp"%>
	<%@ include file="productType_genre.jsp"%>
	<script type="text/javascript" src="test/productComm.js"></script>
	<%@ include file="productTypeFormExt.jsp"%>
	<%@ include file="productTypeSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);		
		var productTypeId=0;
		var itmeLength;
		var arr = [];
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);
			win.on('close',function(){arr=[];});
			batchWin=getWindow('批量修改',320,160,320,160,batchForm);
			ds = getDs(mainFields, 'system/productType!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
				    getTextField('name', 100, '',0, '<s:text name="productType.name" />'),
		            '-',
		            //getTextField('price', 100, '',0, '<s:text name="productType.intro" />'),
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ],['name','<s:text name="productType.name" />'],
							//['price','<s:text name="productType.intro" />']
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
						<sec:authorize url="/product/productType!add">
						,getAddButton(win,winTitle + '——新增','新增',function(){
							productTypeId = 0;
							genre_tbar.setVisible(true);
							Ext.apply(genre_ds.proxy.extraParams,{whereSql :' and productTypeId='+productTypeId});
							genre_ds.load();
						}),
						getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加',function(){
							productTypeId = 0;
							Ext.apply(genre_ds.proxy.extraParams,{whereSql :' and productTypeId='+productTypeId});
							genre_ds.load();
						})
						</sec:authorize>
						<sec:authorize url="/product/productType!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							productTypeId = sm.getSelection()[0].data['id'];
							genre_tbar.setVisible(true);
							Ext.apply(genre_ds.proxy.extraParams,{whereSql :' and productTypeId='+productTypeId});
							genre_ds.load();
						})/* ,
						getBatchButton(batchWin,sm,'批量修改') */
						</sec:authorize>
						<sec:authorize url="/product/productType!del">
						,Ext.create('Ext.Button', {
							text : '删除',
							tooltip : '删除',
							itemId : 'delete',
							disabled : true,
							iconCls : 'delete',
							handler : function(){
								delProductTypeFromDB(ds,sm,'system/productType!delete',function(){});
							}
						})
						</sec:authorize>
						,getComSearchButton(searchWin,'复合查询')
					]
				});
				bbar = getBbar(ds);
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						productTypeId = sm.getSelection()[0].data['id'];
						Ext.apply(genre_ds.proxy.extraParams,{whereSql :' and productTypeId='+productTypeId});
						genre_ds.load();
						genre_tbar.setVisible(false);
						showWin(win, winTitle+'——查看',sm);	
					}
				});
				var addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '新增',
					handler: function(widget, event) {
						addWin(win, winTitle + '——新增');
						genre_tbar.setVisible(true);
						productTypeId = 0;
						Ext.apply(genre_ds.proxy.extraParams,{whereSql :' and productTypeId='+productTypeId});
						genre_ds.load();
					}
				});
				var copyAddAction = Ext.create('Ext.Action', {
					iconCls: 'copy',
					 text: '拷贝添加',
						handler: function(widget, event) { 
						copyAddWin(win,winTitle + '——拷贝添加', sm);   
						productTypeId = 0;
						Ext.apply(genre_ds.proxy.extraParams,{whereSql :' and productTypeId='+productTypeId});
						genre_ds.load();
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm); 
						genre_tbar.setVisible(true);
						productTypeId = sm.getSelection()[0].data['id'];
						Ext.apply(genre_ds.proxy.extraParams,{whereSql :' and productTypeId='+productTypeId});
						genre_ds.load();
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
							delProductTypeFromDB(ds,sm,'system/productType!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/product/productType!add">,addAction,copyAddAction</sec:authorize>
						<sec:authorize url="/product/productType!edit">,editAction</sec:authorize>
						<sec:authorize url="/product/productType!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					productTypeId = rec.get('id');
					genre_tbar.setVisible(false);
					Ext.apply(genre_ds.proxy.extraParams,{whereSql :' and productTypeId='+productTypeId});
					genre_ds.load();
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
