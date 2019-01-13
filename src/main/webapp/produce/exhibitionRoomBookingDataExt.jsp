<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="exhibitionRoomBooking.exhibitionRoomId" />',dataIndex:'exhibitionRoomId',name:'exhibitionRoomId',align : 'center',width:100}
		,{text : '<s:text name="exhibitionRoomBooking.bookingId" />',dataIndex:'bookingId',name:'bookingId',align : 'center',width:100}
		,{text : '<s:text name="exhibitionRoomBooking.dateFrom" />',dataIndex:'dateFrom',name:'dateFrom',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="exhibitionRoomBooking.dateTo" />',dataIndex:'dateTo',name:'dateTo',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="exhibitionRoomBooking.price" />',dataIndex:'price',name:'price',align : 'center',width:100}
		,{text : '<s:text name="exhibitionRoomBooking.total" />',dataIndex:'total',name:'total',align : 'center',width:100}
		,{text : '<s:text name="exhibitionRoomBooking.consumerId" />',dataIndex:'consumerId',name:'consumerId',align : 'center',width:100}
		,{text : '<s:text name="exhibitionRoomBooking.balance" />',dataIndex:'balance',name:'balance',align : 'center',width:100}
		,{text : '<s:text name="exhibitionRoomBooking.balanceTime" />',dataIndex:'balanceTime',name:'balanceTime',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="exhibitionRoomBooking.balancePrice" />',dataIndex:'balancePrice',name:'balancePrice',align : 'center',width:100}
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
				//sm.select(rowIndex);
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'produce/hibitionRoomBooking!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
