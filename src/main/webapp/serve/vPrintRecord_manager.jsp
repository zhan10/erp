<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="vPrintRecordDefine.jsp"%>
	<%@ include file="vPrintRecordDataExt.jsp"%>
	<%@ include file="vPrintRecordFormExt.jsp"%>
	<%@ include file="vPrintRecordSearchExt.jsp"%>
	<script type="text/javascript" src="ini/getPrintFormatDs.js"></script>
	<script type="text/javascript" src="ini/getPaperFormatDs.js"></script>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,600,300,form);
			batchWin=getWindow('批量修改',320,160,320,160,batchForm);
			ds = getDs(mainFields, 'serve/vPrintRecord!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						/* grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1); */
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('consumerName', 100, '',0, '<s:text name="vPrintRecord.consumerName" />'),
					getTextField('cardNumber', 100, '',0, '<s:text name="vPrintRecord.cardNumber" />'),
					 '-',
					 Ext.create('Ext.form.field.ComboBox',{
		 	               itemId : 'printFormat',
		 	               width : 100,
		 	               displayField: 'text',
		 	               valueField: 'value',
		 	               value:-1,
		 	               label : '<s:text name="printRate.printFormat" />',
		 	               mode : 'local',
		 	               selectOnFocus : true,
		 	               editable : false,
		 	               store :printFormatDs
		                    }),
		 				   '-',
		 				   Ext.create('Ext.form.field.ComboBox',{
		 		               itemId : 'paperFormat',
		 		               width : 100,
		 		               displayField: 'text',
		 		               valueField: 'value',
		 		               value:-1,
		 		               label : '<s:text name="printRate.paperFormat" />',
		 		               mode : 'local',
		 		               selectOnFocus : true,
		 		               editable : false,
		 		               store :paperFormatDs
		 	                   }),
		 					   '-',
					Ext.create('Ext.form.DateField',{
		                  itemId :'printTimeFrom',
		                  width : 100,
		                  format : 'Y-m-d',
		                  emptyText:'<s:text name="vPrintRecord.printTime" />'
	                }),
	                '——',
	                Ext.create('Ext.form.DateField',{
		                  itemId :'printTimeTo',
		                  width : 100,
		                  format : 'Y-m-d',
		                  emptyText:'<s:text name="vPrintRecord.printTime" />'
	                }),			
	               	'-',Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ],
							[ 'printTime', '<s:text name="vPrintRecord.printTime" />'],
							[ 'consumerName', '<s:text name="vPrintRecord.consumerName" />'],
							[ 'cardNumber', '<s:text name="vPrintRecord.cardNumber" />'],
							[ 'printerModel', '<s:text name="vPrintRecord.printerModel" />'],
							[ 'printerMac', '<s:text name="vPrintRecord.printerMac" />'],
							[ 'printerIp', '<s:text name="vPrintRecord.printerIp" />'],
							[ 'printFormat', '<s:text name="vPrintRecord.printFormat" />'],
							[ 'paperFormat', '<s:text name="vPrintRecord.paperFormat" />'],
							[ 'paperCount', '<s:text name="vPrintRecord.paperCount" />'],
							[ 'syncTime', '<s:text name="vPrintRecord.syncTime" />'],
							[ 'price', '<s:text name="vPrintRecord.price" />']
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
								t_sql = tbar.getComponent('cardNumber').getValue();
								if (t_sql != "")
									sqlStr += " and cardNumber like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('printFormat').getValue();
								if (t_sql != "" && t_sql!="-1")
									sqlStr += " and printFormat like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('paperFormat').getValue();
								if (t_sql != "" && t_sql!="-1")
									sqlStr += " and paperFormat like '%"+ t_sql+ "%' ";
								t_sql1 = Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('printTimeFrom').getValue())),'Y-m-d');
								t_sql2 = Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('printTimeTo').getValue()),Ext.Date.DAY, +1),'Y-m-d');
								if (t_sql1 != ""&&t_sql1!="1970-01-01")
									sqlStr+="and printTime between '"+t_sql1+"' and '"+t_sql2+"'";
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
						/* <sec:authorize url="/serve/recipeType!add">
						,getAddButton(win,winTitle + '——新增','新增'),
						getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加')
						</sec:authorize>
						<sec:authorize url="/serve/recipeType!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改')
						
						</sec:authorize>
						<sec:authorize url="/serve/recipeType!del">
						,getDelButton(ds, sm, 'restaurant/recipeType!delete','删除')
						</sec:authorize> */
						,getComSearchButton(searchWin,'复合查询')
					]
				});
				bbar = getBbar(ds);
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						form.down('#total').setValue(price*paperCount);
					}
				});
				var addAction = Ext.create('Ext.Action', {
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
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);     
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'restaurant/recipeType!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						/* <sec:authorize url="/serve/recipeType!add">,addAction,copyAddAction</sec:authorize>
						<sec:authorize url="/serve/recipeType!edit">,editAction</sec:authorize>
						<sec:authorize url="/serve/recipeType!del">,delAction</sec:authorize> */
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
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
