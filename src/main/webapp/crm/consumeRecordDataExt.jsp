<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="consumeRecord.consumeType" />',dataIndex:'consumeType',name:'consumeType',align : 'center',width:100}
		,{text : '<s:text name="consumeRecord.consumeFrom" />',dataIndex:'consumeFrom',name:'consumeFrom',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="consumeRecord.consumeTo" />',dataIndex:'consumeTo',name:'consumeTo',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="consumeRecord.consumerId" />',dataIndex:'consumerId',name:'consumerId',align : 'center',width:100}
		,{text : '<s:text name="consumeRecord.bookingId" />',dataIndex:'bookingId',name:'bookingId',align : 'center',width:100}
		,{text : '<s:text name="consumeRecord.relatedId" />',dataIndex:'relatedId',name:'relatedId',align : 'center',width:100}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	},{
		xtype:'actioncolumn',
		locked:true,
		width:50,
		items:[ {
			icon:'img/toolbar/edit.gif',
			tooltip:'修改',
			handler : function(grid, rowIndex, colIndex) {
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'crm/nsumeRecord!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
