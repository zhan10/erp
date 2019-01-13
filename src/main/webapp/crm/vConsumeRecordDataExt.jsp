<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
			{
				text : 'id',
				dataIndex : 'id',
				name : 'id',
				width : 40,
				hidden : true
			},
			{
				text : '<s:text name="vConsumeRecord.balance" />',
				dataIndex : 'balance',
				name : 'balance',
				hidden:true,
				align : 'center',
				width : 100,
				renderer : function(val) {
					return val ? '<span style="color:red">已结算</span>'
							: '<span style="color:blue">未结算</font>';
				}
			},
			{
				text : '<s:text name="vConsumeRecord.consumerName" />',
				dataIndex : 'consumerName',
				name : 'consumerName',
				align : 'center',
				width : 200
			},
			{
				text : '<s:text name="consumeArea.name" />',
				dataIndex : 'consumeAreaName',
				name : 'consumeAreaName',
				align : 'center',
				width : 200
			},
			{
				text : '<s:text name="vConsumeRecord.consumeType" />',
				dataIndex : 'consumeName',
				name : 'consumeName',	
				align : 'center',
				width : 200
			},
			/*
			{
				text : '<s:text name="vConsumeRecord.consumeType" />',
				dataIndex : 'consumeName',
				name : 'consumeName',
				align : 'center',
				width : 200,
				renderer : function(val) {
					try {
						return cb_cities_ds.findRecord('id', val).get(
								'name');
					} catch (e) {
						//alert(e);
					}
				}
			},
			*/
			{
				text : '<s:text name="vConsumeRecord.consumeAmount" />',
				dataIndex : 'consumeAmount',
				name : 'consumeAmount',
				align : 'center',
				width : 200
			},  {
				text : '<s:text name="vConsumeRecord.paymentName" />',
				dataIndex : 'paymentName',
				name : 'paymentName',
				align : 'center',
				width : 200
			},  {
				text : '<s:text name="vConsumeRecord.usersName" />',
				dataIndex : 'usersName',
				name : 'usersName',
				align : 'center',
				width : 200
			}, {
				text : '<s:text name="vConsumeRecord.bookingCode" />',
				dataIndex : 'bookingCode',
				name : 'bookingCode',
				align : 'center',
				width : 100
			}, {
				text : '<s:text name="vConsumeRecord.consumeFrom" />',
				dataIndex : 'consumeFrom',
				name : 'consumeFrom',
				align : 'center',
				width : 200,
				convert : function(val){
					//var date = new Date(val);
					if(val == null){
						return val;
					}else{
					var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
					return Ext.Date.format(date,'Y-m-d H:i:s');
					}
				}
				/* convert : function(val){
					var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
					return Ext.Date.format(date,'Y-m-d H:i:s');
				} */
			}, {
				text : '<s:text name="vConsumeRecord.consumeTo" />',
				dataIndex : 'consumeTo',
				name : 'consumeTo',
				align : 'center',
				width:200,
				//convert : convertDate
				convert : function(val){
					//var date = new Date(val);
					if(val == null){
						return val;
					}else{
					var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
					return Ext.Date.format(date,'Y-m-d H:i:s');
					}
				}
			}, {
				text : '<s:text name="vConsumeRecord.number" />',
				dataIndex : 'number',
				name : 'number',
				align : 'center',
				width : 100
			}, {
				text : '<s:text name="vConsumeRecord.consumerId" />',
				dataIndex : 'consumerId',
				name : 'consumerId',
				align : 'center',
				width : 100,
				hidden : true
			}, {
				text : '<s:text name="vConsumeRecord.bookingId" />',
				dataIndex : 'bookingId',
				name : 'bookingId',
				align : 'center',
				width : 100,
				hidden : true
			}, {
				text : '<s:text name="vConsumeRecord.relatedId" />',
				dataIndex : 'relatedId',
				name : 'relatedId',
				align : 'center',
				width : 100,
				hidden : true
			}, {
				text : '<s:text name="vConsumeRecord.consumeTypeId" />',
				dataIndex : 'consumeTypeId',
				name : 'consumeTypeId',
				align : 'center',
				width : 100,
				hidden : true
			}, {
				text : '<s:text name="vConsumeRecord.paymentTypeId" />',
				dataIndex : 'paymentTypeId',
				name : 'paymentTypeId',
				align : 'center',
				width : 100,
				hidden : true
			} , {
				text : '<s:text name="consumeArea.id" />',
				dataIndex : 'consumeAreaId',
				name : 'consumeAreaId',
				align : 'center',
				width : 100,
				hidden : true
			}, {
				text : '<s:text name="vConsumeRecord.price" />',
				dataIndex : 'price',
				name : 'price',
				align : 'center',
				width : 100,
				hidden : true
			}];
	var columnOperators = [ {
		xtype : 'rownumberer',
		width : 40
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'crm/consumeRecord!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
