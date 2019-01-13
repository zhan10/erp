<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="vOrdersDefine.jsp"%>
	<%@ include file="vOrdersDataExt.jsp"%>
	<script type="text/javascript" src="dateTime/UX_TimePickerField.js"></script>
    <script type="text/javascript" src="dateTime/UX_DateTimePicker.js"></script>
    <script type="text/javascript" src="dateTime/UX_DateTimeMenu.js"></script>
    <script type="text/javascript" src="dateTime/UX_DateTimeField.js"></script>
	<script type="text/javascript" src="ini/getVOrdersStatusDs.js"></script>
	<script type="text/javascript" src="serve/commonality.js"></script>
	<%@ include file="tabs_vOrdersList.jsp"%>
	<%@ include file="vOrdersFormExt.jsp"%>
	<%@ include file="vOrdersSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
	    var consumerId;
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);
				//填充订单详情grid
			/* win.on('show',function(){
				alert(form.down('#id').getValue());
			}); */
	
			batchWin=getWindow('批量修改',320,160,320,160,batchForm);
			ds = getDs(mainFields, 'restaurant/vOrders!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
					 	grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						//grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					 	grid.down('#distribution').setDisabled(selections.length != 1);
					 	grid.down('#conduct').setDisabled(selections.length != 1);
					 	grid.down('#accomplish').setDisabled(selections.length != 1);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [	
					Ext.create('Ext.form.field.ComboBox',{
					itemId : 'expire',
					width : 80,value:-1,						
					hideLabel : true,
					mode : 'local',
					selectOnFocus : true,
					editable : false,
					hidden:true,
					store : [[-1,'过期状态' ],[0,'正常' ],[1,'已过期' ]]
					}),	
					'-',
					 Ext.create('Ext.form.DateField',{
	                  name:'ordersTime',
	                  id : 'ordersTime',
	                  width : 100,
	                  format : 'Y-m-d',
	                  emptyText:'订单时间'
                      }),		
                      '-',
					getTextField('total', 100, '',0, '<s:text name="vOrders.total" />'),
					'-',
					getTextField('consumerName', 100, '',0, '<s:text name="vOrders.consumerName" />'),
					'-',
					getTextField('tel', 100, '',0, '<s:text name="vOrders.tel" />'),
					'-',
					getTextField('cityName', 100, '',0, '<s:text name="vOrders.cityName" />'),
					'-',
					getTextField('name', 100, '',0, '<s:text name="vOrders.name" />'),
					'-',
					getTextField('address', 100, '',0, '<s:text name="vOrders.address" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['total', '<s:text name="vOrders.total" />']
							,['consumerName', '<s:text name="vOrders.consumerName" />']
							,['ordersTime', '<s:text name="vOrders.ordersTime" />']
							,['arrTime', '<s:text name="vOrders.arrTime" />']
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
								t_sql = tbar.getComponent('expire').getValue();
								if (t_sql!=-1){	
									if(t_sql==0)
										sqlStr += " and ordersTime>'"+Ext.Date.format(new Date(),'Y-m-d')+"'";
									if(t_sql==1)
										sqlStr += " and ordersTime<='"+Ext.Date.format(new Date(),'Y-m-d')+"'";	
								}
								t_sql = tbar.getComponent('total').getValue();
								if (t_sql != "")
									sqlStr += " and total like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('consumerName').getValue();
								if (t_sql != "")
									sqlStr += " and consumerName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('tel').getValue();
								if (t_sql != "")
									sqlStr += " and tel like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('address').getValue();
								if (t_sql != "")
									sqlStr += " and address like '%"+ t_sql+ "%' ";	
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('ordersTime').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',ordersTime)=0";
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
						'->'
						/*<sec:authorize url="/serve/vOrders!cancel">
						,Ext.create('Ext.Button', {
							itemId : 'cancel',
							text : '取消订单',
							iconCls: 'check',
							tooltip : '取消订单',
							hidden:true,
							handler : gridCancel
						})		
						</sec:authorize>
					 	*/
						<sec:authorize url="/serve/vOrders!distribution">
						,Ext.create('Ext.Button', {
							itemId : 'distribution',
							text : '生产',
							iconCls: 'check',
							tooltip : '生产订单',
							hidden:true,
							disabled : true,
							handler : gridDistribution
						})		
						</sec:authorize>
						
						<sec:authorize url="/serve/vOrders!conduct">
						,Ext.create('Ext.Button', {
							itemId : 'conduct',
							text : '配送中',
							iconCls: 'check',
							tooltip : '配送中订单',
							hidden:true,
							disabled : true,
							handler : gridConduct
						})		
						</sec:authorize>
						
						<sec:authorize url="/serve/vOrders!accomplish">
						,Ext.create('Ext.Button', {
							itemId : 'accomplish',
							iconCls: 'check',
							text : '已完成',
							tooltip : '已完成完成订单',
							hidden:true,
							disabled : true,
							handler : gridAccomplish
						})
						</sec:authorize>
						/* <sec:authorize url="/restaurant/orders!add">
						,getAddButton(win,winTitle + '——新增','新增'),
						getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加')
						</sec:authorize>
						<sec:authorize url="/restaurant/orders!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改'),
						getBatchButton(batchWin,sm,'批量修改')
						</sec:authorize>*/
						<sec:authorize url="/serve/vOrders!del">
						,getDelButton(ds, sm, 'restaurant/orders!delete','删除')
						</sec:authorize>
						/*,getComSearchButton(searchWin,'复合查询') */
					]
				});
				bbar = getBbar(ds);
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						showWin(win, winTitle+'——查看',sm);
						var rec = (sm.getSelection())[0];
						var consumerId = rec.get('consumerId');
						var code = rec.get('code');
						tabs.setActiveTab(0);
						Ext.apply(vOrdersList_ds.proxy.extraParams,{whereSql :' and consumerId='+consumerId+' and code='+code});
	    			    vOrdersList_ds.load();
					}
				});
				 bdAction = Ext.create('Ext.Action', {
					iconCls: 'check',
					hidden : true,
					text: '生产',
					handler: gridDistribution
				});
				 conductAction = Ext.create('Ext.Action', {
						iconCls: 'check',
						hidden : true,
						text: '配送中',
						handler: gridConduct
					});
				 accomplishAction = Ext.create('Ext.Action', {
						iconCls: 'check',
						hidden : true,
						text: '已完成',
						handler: gridAccomplish
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
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);     
					 }
				});*/
				 delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'restaurant/orders!delete',function(){});
					}
				}); 
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction ,'-'
						<sec:authorize url="/serve/vOrders!distribution">,bdAction</sec:authorize>
						<sec:authorize url="/serve/vOrders!conduct">,conductAction</sec:authorize>
						<sec:authorize url="/serve/vOrders!accomplish">,accomplishAction</sec:authorize>
						/*
						<sec:authorize url="/restaurant/orders!add">,addAction,copyAddAction</sec:authorize>
						<sec:authorize url="/restaurant/orders!edit">,editAction</sec:authorize>*/
						<sec:authorize url="/serve/vOrders!del">,delAction</sec:authorize> 
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				//grid.down('#sc').show();
				grid.down('#tbar_btn_delete').show();
				grid.on('itemdblclick', function(grid,rec) {
					consumerId=rec.get('consumerId');
					var code = rec.get('code');
					showWinByRec(win,winTitle+'——查看',rec);
					tabs.setActiveTab(0);
					Ext.apply(vOrdersList_ds.proxy.extraParams,{whereSql :' and consumerId='+consumerId+' and code='+code});
    			    vOrdersList_ds.load();
					form.down('#btnCancel').hide();
					form.down('#btnDistribution').hide();
					form.down('#btnConduct').hide();
					form.down('#btnAccomplish').hide();
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
