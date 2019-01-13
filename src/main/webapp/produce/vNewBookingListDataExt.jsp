<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true},
		{text : 'vNewBookingList.serviceName',dataIndex : 'serviceName',name : 'serviceName',width : 40,hidden : true},
		{text : 'vNewBookingList.serviceTel',dataIndex : 'serviceTel',name : 'serviceTel',width : 40,hidden : true}
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
		,{text : '<s:text name="vNewBookingList.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:100}
		,{text : '<s:text name="vNewBookingList.consumerName" />',dataIndex:'consumerName',name:'consumerName',align : 'center',width:70}
		,{text : '<s:text name="vNewBookingList.deposit" />',dataIndex:'deposit',name:'deposit',align : 'center',width:50}
		,{text : '<s:text name="vNewBookingList.quantity" />',dataIndex:'quantity',name:'quantity',align : 'center',width:50}
		,{text : '<s:text name="vNewBookingList.price" />',dataIndex:'price',name:'price',align : 'center',width:50}
		,{text : '<s:text name="vNewBookingList.total" />',dataIndex:'total',name:'total',align : 'center',width:50}
		,{text : '<s:text name="vNewBookingList.cityName" />',dataIndex:'cityName',name:'cityName',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vNewBookingList.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:100,hidden:true}
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
			width:100,
			convert : function(val,record){
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR);
				return Ext.Date.format(date,'Y-m-d H:i:s');
			}
		 }
		,{text : '<s:text name="vNewBookingList.tel" />',dataIndex:'tel',name:'tel',align : 'center',width:100}
		,{text : '<s:text name="vNewBookingList.email" />',dataIndex:'email',name:'email',align : 'center',width:100}
		,{text : '<s:text name="vNewBookingList.productType" />',dataIndex:'productType',name:'productType',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vNewBookingList.productId" />',dataIndex:'productId',name:'productId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vNewBookingList.consumerId" />',dataIndex:'consumerId',name:'consumerId',align : 'center',width:100,hidden:true}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	},{
		xtype:'actioncolumn',
		locked:true,
		width:60,
		items:[ {
			icon:'img/toolbar/edit.gif',
			tooltip:'修改',
			handler : function(grid, rowIndex, colIndex) {
				//sm.select(rowIndex);
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
				form.down('#status').setReadOnly(true);
				form.down('#code').setReadOnly(true);
				form.down('#productName').setReadOnly(true);
				form.down('#buildingName').setReadOnly(true);
				form.down('#consumerName').setReadOnly(true);
				form.down('#bookingTime').setReadOnly(true);
				form.down('#tel').setReadOnly(true);
				form.down('#email').setReadOnly(true);
				var type = form.down('#productType').getValue();
				form.down('#dateFrom1').setValue(form.down('#dateFrom').getValue());
				form.down('#dateTo1').setValue(form.down('#dateTo').getValue());
				if(type==3){
					form.down('#dateType1').hide();
					form.down('#dateType').show();
				}else{
					form.down('#dateType1').show();
					form.down('#dateType').hide();
				}
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'produce/newBooking!delete');
		}
	},{
		icon:'img/toolbar/post_go.gif',
		tooltip:'发送短信',
		handler : function(grid, rowIndex, colIndex) {
			//sm.select(rowIndex);
			var rec = grid.getStore().getAt(rowIndex);	
			sendWinByRec(smsWin, winTitle+'——发送短信', rec);
			var cityName = sendSmsForm.down('#cityName').getValue();
			var buildingName = sendSmsForm.down('#buildingName').getValue();
			var floorName = sendSmsForm.down('#floorName').getValue();
			var productName = sendSmsForm.down('#productName').getValue();
			var date = sendSmsForm.down('#dateFrom').getValue();
			var serviceTel = sendSmsForm.down('#serviceTel').getValue();
			var serviceName = sendSmsForm.down('#serviceName').getValue();
			
			var address = cityName+" "+buildingName+floorName+"F "+productName;
			
			//尊敬的客户，您已成功预定201X年xx月xx日武汉 绿地铭创23F xxxx，我们将静候尊驾莅临。如您计划临时有变，请提前告知 武汉平台VIP客服经理小汪，电话13986050903。
			var str = "尊敬的客户，您已成功预定"+address+"，开始日期为"+date+"，我们将静候尊驾莅临。如您计划临时有变，请提前告知 "+cityName+"平台VIP客服经理"+serviceName+"，电话"+serviceTel+"。";
			sendSmsForm.down('#smsContext').setValue(str);
			sendSmsForm.down('#address').setValue(address);
			sendSmsForm.down('#information').setValue(serviceName+"，电话"+serviceTel);
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
