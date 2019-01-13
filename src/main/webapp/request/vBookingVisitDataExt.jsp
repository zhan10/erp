<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : '<s:text name="orderVisit.id" />',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{
			text : '<s:text name="orderVisit.state" />',
			dataIndex:'state',
			name:'state',
			align : 'center',
			width:100,
			renderer : function(val) {
				try {
					var ret = orderVisitDs.findRecord('value', val).get('text');
					return ret;
				} catch (e) {
				}	
			}
		 }
		,{text : '<s:text name="orderVisitConsumer.name" />',dataIndex:'consumerName',name:'consumerName',align : 'center',width:100}
		,{text : '<s:text name="orderVisitProduct.type" />',dataIndex:'productType',name:'productType',align : 'center',width:120}
		,{text : '<s:text name="orderVisit.city" />',dataIndex:'city',name:'city',align : 'center',width:120}
		,{text : '<s:text name="orderVisit.area" />',dataIndex:'area',name:'area',align : 'center',width:150}
		,{text : '<s:text name="orderVisitBuilding.name" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:150}
		,{text : '<s:text name="orderVisitFloor.name" />',dataIndex:'floorName',name:'floorName',align : 'center',width:200}
		,{text : '<s:text name="orderVisitProduct.name" />',dataIndex:'productName',name:'productName',align : 'center',width:120}
		,{
			text : '<s:text name="orderVisitCreate.time" />',
			dataIndex:'createTime',
			name:'createTime',
			align : 'center',
			width:120,
			convert : function(val){
				//var date = new Date(val);
				if(val == null){
					return val;
				}else{
					var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
					return Ext.Date.format(date,'Y-m-d H:i:s');
				}
				
			}
		 }
		,{
			text : '<s:text name="orderVisitAppoint.time" />',
			dataIndex:'appointTime',
			name:'appointTime',
			align : 'center',
			width:120,
			convert : function(val){
				//var date = new Date(val);
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
				return Ext.Date.format(date,'Y-m-d H:i:s');
			}
		 }
		,{
			text : '<s:text name="orderVisit.time" />',
			dataIndex:'visitTime',
			name:'visitTime',
			align : 'center',
			width:120,
			convert : function(val){
				//var date = new Date(val);
				if(val == null){
					return val;
				}else{
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
				return Ext.Date.format(date,'Y-m-d H:i:s');
				}
			}
		 }
		
		,{text : '<s:text name="orderVisit.remark" />',dataIndex:'remark',name:'remark',align : 'center',width:120}
		,{text : '<s:text name="orderVisit.opinion" />',dataIndex:'opinion',name:'opinion',align : 'center',width:120}
		,{text : '<s:text name="orderVisitProduct.id" />',dataIndex:'productId',name:'productId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="orderVisitConsumer.id" />',dataIndex:'consumerId',name:'consumerId',align : 'center',width:100,hidden:true}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	}/* ,{
		xtype:'actioncolumn',
		locked:true,
		width:50,
		items:[ {
			icon:'img/toolbar/edit.gif',
			tooltip:'修改',
			handler : function(grid, rowIndex, colIndex) {
				//sm.select(rowIndex);
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'order/vBookingVisit!delete');
		}
	}]
	} */];
	var mainColumns = columnOperators.concat(mainFields);
</script>
