<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{
			text : '<s:text name="vOrders.status" />',
			dataIndex:'status',
			name:'status',
			align : 'center',
			width:100,
			renderer : function(val){
				var ret = vOrdersStatusDs.findRecord('value', val).get('text');
				return ret;
			}
		 }
		,{text : '<s:text name="vOrders.total" />',dataIndex:'total',name:'total',align : 'center',width:100}
		,{text : '<s:text name="vOrders.consumerName" />',dataIndex:'consumerName',name:'consumerName',align : 'center',width:120}
		,{text : '<s:text name="vOrders.tel" />',dataIndex:'tel',name:'tel',align : 'center',width:120}
		,{text : '<s:text name="vOrders.cityName" />',dataIndex:'cityName',name:'cityName',align : 'center',width:120}
		,{text : '<s:text name="vOrders.name" />',dataIndex:'name',name:'name',align : 'center',width:120}
		,{text : '<s:text name="vOrders.ordersTime" />',
			dataIndex:'ordersTime',
			name:'ordersTime',
			align : 'center',
			width:150 ,
			convert : function(val){
			//var date = new Date(val);
				if(val == null){
					return val;
				}else{
					var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -12);
					return Ext.Date.format(date,'Y-m-d H:s:m');
				}	
			} 
		}
		,{text : '<s:text name="vOrders.arrTime" />',
			dataIndex:'arrTime',
			name:'arrTime',
			align : 'center',
			width:150
		}
		,{text : '<s:text name="vOrders.address" />',dataIndex:'address',name:'address',align : 'center',width:200}
		,{text : '<s:text name="vOrders.code" />',dataIndex:'code',name:'code',align : 'center',width:200,hidden:true}
		,{text : '<s:text name="vOrders.memo" />',dataIndex:'memo',name:'memo',align : 'center',flex:1}
		,{text : '<s:text name="vOrders.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vOrders.bookingId" />',dataIndex:'bookingId',name:'bookingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vOrders.consumerId" />',dataIndex:'consumerId',name:'consumerId',align : 'center',width:100,hidden:true}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	}/*,{
		xtype:'actioncolumn',
		locked:true,
		width:50,
		items:[  {
			icon:'img/toolbar/edit.gif',
			tooltip:'修改',
			handler : function(grid, rowIndex, colIndex) {
				//sm.select(rowIndex);
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
			}
		}, {
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'restaurant/orders!delete');
		}
	}]
	}*/];
	var mainColumns = columnOperators.concat(mainFields);
</script>
