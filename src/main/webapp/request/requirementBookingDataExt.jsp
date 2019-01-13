<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="orderRequestCreate.status" />',dataIndex:'status',name:'status',align : 'center',width:100,
			renderer : function(val) {
				try {
					var ret = requirementBookingStatusDs.findRecord('value', val).get('text');
					return ret
					} catch (e) {
				}
			}}
		,{text : '<s:text name="orderRequestConsumer.name" />',dataIndex:'consumerName',name:'consumerName',align : 'center',width:150}	
		,{text : '<s:text name="orderRequest.tel" />',dataIndex:'tel',name:'tel',align : 'center',width:150}	
		,{text : '<s:text name="orderRequest.content" />',dataIndex:'content',name:'content',align : 'center',width:150}	
		,{
			text : '<s:text name="orderRequestCreate.time" />',
			dataIndex:'createTime',
			name:'createTime',
			align : 'center',
			width:150,
			convert : convertDate
		 }
		,{text : '<s:text name="orderRequest.remark" />',dataIndex:'remark',name:'remark',align : 'center',flex:1,}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'requirement/requirementBooking!delete');
		}
	}]
	} */];
	var mainColumns = columnOperators.concat(mainFields);
</script>
