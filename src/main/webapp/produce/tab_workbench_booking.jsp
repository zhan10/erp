<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var workbench_Fields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vBookingWorkbench.balance" />',dataIndex:'balance',name:'balance',align : 'center',width:150,renderer : function(val) {            
           return val?'<span style="color:red">已结算</span>':'<span style="color:blue">未结算</font>';
        }}
		,{text : '<s:text name="vBookingWorkbench.code" />',dataIndex:'code',name:'code',align : 'center',width:150}
		,{text : '<s:text name="vBookingWorkbench.dateFrom" />',dataIndex:'dateFrom',name:'dateFrom',align : 'center',width:150,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="vBookingWorkbench.dateTo" />',dataIndex:'dateTo',name:'dateTo',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="vBookingWorkbench.cityName" />',dataIndex:'cityName',name:'cityName',align : 'center',width:100}
		,{text : '<s:text name="vBookingWorkbench.areaName" />',dataIndex:'areaName',name:'areaName',align : 'center',width:100}
		,{text : '<s:text name="vBookingWorkbench.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:100}
		,{text : '<s:text name="vBookingWorkbench.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:100}
		,{text : '<s:text name="vBookingWorkbench.workbenchName" />',dataIndex:'workbenchName',name:'workbenchName',align : 'center',width:100}
		,{text : '<s:text name="vBookingWorkbench.consumerName" />',dataIndex:'consumerName',name:'consumerName',align : 'center',width:100}
		,{text : '<s:text name="vBookingWorkbench.total" />',dataIndex:'total',name:'total',align : 'center',width:100}
		,{text : '<s:text name="vBookingWorkbench.price" />',dataIndex:'price',name:'price',align : 'center',width:100}
		,{text : '<s:text name="vBookingWorkbench.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBookingWorkbench.workbenchId" />',dataIndex:'workbenchId',name:'workbenchId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBookingWorkbench.consumerId" />',dataIndex:'consumerId',name:'consumerId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBookingWorkbench.bookingId" />',dataIndex:'bookingId',name:'bookingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBookingWorkbench.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBookingWorkbench.areaId" />',dataIndex:'areaId',name:'areaId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBookingWorkbench.cityId" />',dataIndex:'cityId',name:'cityId',align : 'center',width:100,hidden:true}
		];

	var workbench_ds = getDs1(workbench_Fields, 'produce/vBookingWorkbench!managerExt','','order by code',0);
	workbench_ds.pageSize=999;
	
	var workbench_tbar = Ext.create('Ext.toolbar.Toolbar',{
		padding : '5 0 5 10',
		items : [
				'分配定单','->',Ext.create('Ext.Button', {
					itemId:'addItems',
					text : '新增',
					tooltip : '添加新定单细项',
					align:'right',
					iconCls : 'add',
					handler : function() {		
						select_order_win.show();
							//addWin(items_win, winTitle + '——新增细项');
							//items_form.down('#ordersId').setValue(items_grid.up('form').down('#id').getValue());							
				}})			
			]
		});
	
	 var workbench_grid= Ext.create('Ext.grid.Panel', {
		id : 'workbench_grid',
		store : workbench_ds,
		margin : "5",
		//tbar : orders_tbar,		
		columns :  workbench_Fields,
		columnLines : true,
		flex:1,
		hidden:true
	});
	var workbench_form = Ext.widget('form', {
		itemId : 'workbench_form',
		autoScroll : true,
		overflowX : 'scroll',
		overflowY : 'scroll',
		frame : true,
		layout : {
			type : 'vbox',
			align : 'stretch'
		},
		border : false,
		bodyPadding : 10,
		defaultType : 'textfield',
		fieldDefaults : {
			labelAlign : 'right',
			labelWidth : 100
		},
		defaults : {
			margins : '0 0 10 0'
		},
		items : [
			{name:'id',hidden:true,itemId:'id'},{name:'ordersId',hidden:true,itemId:'ordersId'},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
					    xtype: 'fieldcontainer',
					     flex:1,					   
					    fieldLabel: '<s:text name="orders.ordersNum"/>',
					    combineErrors: true,
					    msgTarget : 'side',
					    layout: 'hbox',
					    defaults: {
					       hideLabel: true
					    },
					    items: [
					        {
					        	xtype: 'displayfield',name      : 'ordersNum'
					        },{xtype: 'displayfield', value: '-'},
					        {
					        	xtype: 'displayfield', name      : 'serialNum'
					        }
					    ]
					}
					,{
						flex:1,
						name:'purpose',
						fieldLabel:'<s:text name="vOrdersItem.purpose"/>'
					}
					
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'numberfield',
				items : [
					{
						flex:1,
						name:'spec1',
						fieldLabel:'<s:text name="vOrdersItem.spec1"/>'
					}
					,
					{
						flex:1,
						name:'spec2',
						fieldLabel:'<s:text name="vOrdersItem.spec2"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'numberfield',
				items : [
					{
						flex:1,
						name:'amount',
						fieldLabel:'<s:text name="vOrdersItem.amount"/>'
					}
					,
					{
						flex:1,
						name:'leng',
						fieldLabel:'<s:text name="vOrdersItem.leng"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'numberfield',
				items : [
					{
						flex:1,
						name:'orderWeight',
						fieldLabel:'<s:text name="vOrdersItem.orderWeight"/>'
					}
					,
					{
						flex:1,
						name:'produceWeight',
						fieldLabel:'<s:text name="vOrdersItem.produceWeight"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'alloyModel',
						fieldLabel:'<s:text name="vOrdersItem.alloyModel"/>'
					}
					,
					{
						flex:1,
						name:'alloyStatus',
						fieldLabel:'<s:text name="vOrdersItem.alloyStatus"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'thicknessTolerance',
						fieldLabel:'<s:text name="vOrdersItem.thicknessTolerance"/>'
					}
					,
					{
						flex:1,
						name:'widthTolerance',
						fieldLabel:'<s:text name="vOrdersItem.widthTolerance"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'lengthTolerance',
						fieldLabel:'<s:text name="vOrdersItem.lengthTolerance"/>'
					}
					,
					{
						flex:1,
						name:'jointNum',
						fieldLabel:'<s:text name="vOrdersItem.jointNum"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'innerDiameter',
						fieldLabel:'<s:text name="vOrdersItem.innerDiameter"/>'
					}
					,
					{
						flex:1,
						name:'outerDiameter',
						fieldLabel:'<s:text name="vOrdersItem.outerDiameter"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'sideSpread',
						fieldLabel:'<s:text name="vOrdersItem.sideSpread"/>'
					}
					,
					{
						flex:1,
						name:'wholeSpread',
						fieldLabel:'<s:text name="vOrdersItem.wholeSpread"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'tensileStrength',
						fieldLabel:'<s:text name="vOrdersItem.tensileStrength"/>'
					}
					,
					{
						flex:1,
						name:'pinholeNum',
						fieldLabel:'<s:text name="vOrdersItem.pinholeNum"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'wettability',
						fieldLabel:'<s:text name="vOrdersItem.wettability"/>'
					}
					,
					{
						flex:1,
						name:'extensibility',
						fieldLabel:'<s:text name="vOrdersItem.extensibility"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'appearance',
						fieldLabel:'<s:text name="vOrdersItem.appearance"/>'
					}
					,
					{
						flex:1,
						name:'packReq',
						fieldLabel:'<s:text name="vOrdersItem.packReq"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'otherStandard',
						fieldLabel:'<s:text name="vOrdersItem.otherStandard"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'specialReq',
						fieldLabel:'<s:text name="vOrdersItem.specialReq"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'memo',
						fieldLabel:'<s:text name="vOrdersItem.memo"/>'
					}
				]
			}
		],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				if (this.up('form').getForm().isValid()) {
					saveFormToDB(this.up('form'),
							'sales/ordersItem!save', items_grid);
				}
				
				/*
				if (items_form.getForm().isValid()) {
					if(items_form.down('#id').getValue()==''){						
						items_grid.getStore().insert(0,items_form.getValues());
					}else
						items_form.updateRecord();	
					items_win.hide();
				}*/
			}
		}, {
		text : '关闭',
			itemId : 'btnClose',
			handler : function() {
				this.up('window').hide();
			}
			} ]
			});
	
	var workbench_win;
	workbench_grid.on('itemdblclick', function(item_grid, rec) {
		//showWinByRec(workbench_win, winTitle+'——查看细项', rec);		
	});
	//workbench_win = getWindow('订单细项',500,600,500,600,workbench_form);
   
</script>
