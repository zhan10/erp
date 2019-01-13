<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	/*var  recipeColumns =[
	 {text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
	 ,{text : '<s:text name="vOrdersList.recipeName" />',dataIndex:'recipeName',name:'recipeName',align : 'center',width:100}
	 ,{text : '<s:text name="vOrdersList.numbers" />',dataIndex:'numbers',name:'numbers',align : 'center',width:100}
	 ,{text : '<s:text name="vOrdersList.total" />',dataIndex:'total',name:'total',align : 'center',width:100}
	 ,{text : '<s:text name="vOrdersList.price" />',dataIndex:'price',name:'price',align : 'center',width:100}
	 ,{text : '<s:text name="vOrdersList.status" />',dataIndex:'status',name:'status',align : 'center',width:100,
	 renderer : function(val){
	 var ret = vOrdersStatusDs.findRecord('value', val).get('text');
	 return ret;
	 }}
	 ,{text : '<s:text name="vOrdersList.memo" />',dataIndex:'memo',name:'memo',align : 'center',width:100}
	 ];
	 var recipeDs = getDs(recipeColumns, 'serve/vOrdersList!managerExt', baseSql,order);
	 recipeDs.load();
	 var recipeGrid = getGrid('recipeGrid','订单详情',recipeDs,recipeColumns, null,null,null);
*/
	form = Ext.widget('form', {
		itemId : 'form',
		autoScroll : true,
		overflowX : 'scroll',
		overflowY : 'scroll',
		frame : true,
		/* show:function(){
		alert(11);}, */
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
		items : [ {
			itemId : 'id',
			name : 'id',
			hidden : true
		}, {
			name : 'buildingId',
			hidden : true
		}, {
			name : 'bookingId',
			hidden : true
		},{
			name : 'consumerId',
			hidden : true
		},{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				xtype : 'combo',
				displayField : 'text',
				valueField : 'value',
				allowBlank : false,
				store : vOrdersStatusDs,
				name : 'status',
				fieldLabel : '<s:text name="vOrders.status"/>'
			}, {
				flex : 1,
				allowBlank : false,
				name : 'total',
				fieldLabel : '<s:text name="vOrders.total"/>'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				allowBlank : false,
				name : 'consumerName',
				fieldLabel : '<s:text name="vOrders.consumerName"/>'
			}, {
				flex : 1,
				name : 'tel',
				fieldLabel : '<s:text name="vOrders.tel"/>'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				allowBlank : false,
				name : 'cityName',
				fieldLabel : '<s:text name="vOrders.cityName"/>'
			}, {
				flex : 1,
				allowBlank : false,
				name : 'name',
				fieldLabel : '<s:text name="vOrders.name"/>'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				allowBlank : false,
				name : 'ordersTime',
				fieldLabel : '<s:text name="vOrders.ordersTime"/>',
			}, {
				flex : 1,
				allowBlank : false,
				name : 'arrTime',
				fieldLabel : '<s:text name="vOrders.arrTime"/>',
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				allowBlank : false,
				name : 'address',
				fieldLabel : '<s:text name="vOrders.address"/>'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				name : 'memo',
				fieldLabel : '<s:text name="vOrders.memo"/>'
			} ]
		},tabs//recipeGrid
		],
		buttons : [ {
			text : '已取消',
			itemId : 'btnCancel',
			hidden : true,
			handler : formCancel
		}, {
			text : '已生产',
			itemId : 'btnDistribution',
			hidden : true,
			handler : formDistribution
		}, , {
			text : '配送中',
			itemId : 'btnConduct',
			hidden : true,
			handler : formConduct
		}, {
			text : '已完成',
			itemId : 'btnAccomplish',
			hidden : true,
			handler : formAccomplish
		}, {
			text : '关闭',
			itemId : 'btnClose',
			handler : function() {
				this.up('window').hide();
			}
		} ]
	});
</script>
