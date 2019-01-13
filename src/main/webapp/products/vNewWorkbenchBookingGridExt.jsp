<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var workbench_Fields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{
			text : '<s:text name="vNewBookingList.status" />',
			dataIndex:'status',
			name:'status',
			align : 'center',
			width:70,
			renderer : function(val) {
				if (val == 1){
					return '<span style="color:red">已支付</span>';
				}else{
					return '<span style="color:blue">未支付</span>';
				}	
			}
		 }
		,{text : '<s:text name="vNewBookingList.code" />',dataIndex:'code',name:'code',align : 'center',width:100}
		,{text : '<s:text name="vNewBookingList.productName" />',dataIndex:'productName',name:'productName',align : 'center',width:100}
		,{text : '<s:text name="vNewBookingList.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:70}
		,{text : '<s:text name="vNewBookingList.consumerName" />',dataIndex:'consumerName',name:'consumerName',align : 'center',width:70}
		,{text : '<s:text name="vNewBookingList.tel" />',dataIndex:'tel',name:'tel',align : 'center',width:100}
		,{text : '<s:text name="vNewBookingList.quantity" />',dataIndex:'quantity',name:'quantity',align : 'center',width:50}
		,{
			text : '<s:text name="vNewBookingList.dateFrom" />',
			dataIndex:'dateFrom',
			name:'dateFrom',
			align : 'center',
			width:100,
			convert : function(val,record){
				var date = new Date(val);
				if(record.data.productType==3){
					return Ext.Date.format(date,'Y-m-d H:i:s');
				}else{
					return Ext.Date.format(date,'Y-m-d');
				}
			}
		 }
		,{
			text : '<s:text name="vNewBookingList.dateTo" />',
			dataIndex:'dateTo',
			name:'dateTo',
			align : 'center',
			width:100,
			convert : function(val,record){
				var date = new Date(val);
				if(record.data.productType==3){
					return Ext.Date.format(date,'Y-m-d H:i:s');
				}else{
					return Ext.Date.format(date,'Y-m-d');
				}
			}
		 }
		,{
			text : '<s:text name="vNewBookingList.bookingTime" />',
			dataIndex:'bookingTime',
			name:'bookingTime',
			align : 'center',
			width:140,
			convert : function(val,record){
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR);
				return Ext.Date.format(date,'Y-m-d H:i:s');
			}
		 }
		];

	var workbench_ds = getDs(workbench_Fields, 'produce/vNewBookingList!getProductBooking','','order by id');
	workbench_ds.pageSize=999;
	
    workbench_grid= Ext.create('Ext.grid.Panel', {
		id : 'workbench_grid',
		store : workbench_ds,
		margin : "5",	
		columns :  workbench_Fields,
		columnLines : true,
		flex:1
	});
</script>
