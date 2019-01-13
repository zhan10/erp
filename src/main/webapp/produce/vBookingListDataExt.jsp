<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [ {
		text : 'id',
		dataIndex : 'id',
		name : 'id',
		align : 'center',
		width : 50,
		hidden : true
	},{
		text : '<s:text name="vBookingList.state" />',
		dataIndex : 'state',
		name : 'state',
		align : 'center',
		width : 100,
		renderer : function(val) {
			try {
				var ret = vBookingListStateDs.findRecord('value', val).get('text');
				return ret
				} catch (e) {
			}
		}
	},{
	text : '<s:text name="vBookingList.status" />',
		dataIndex : 'status',
		name : 'status',
		align : 'center',
		width : 100,
		renderer : function(val) {
			try {
				var ret = bookingStatusDs.findRecord('value', val).get('text');
				if (val == 8)
					return '<span style="color:red">已结算</span>';
				return ret;
			} catch (e) {
			}
		},
		hidden : true
	},{
		text : '<s:text name="vBookingList.code" />',
		dataIndex : 'code',
		name : 'code',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vBookingList.name" />',
		dataIndex : 'name',
		name : 'name',
		align : 'center',
		width : 100
	},{
		text : '<s:text name="vBookingList.consumerName" />',
		dataIndex : 'consumerName',
		name : 'consumerName',
		align : 'center',
		width:100
	},{
		text : '<s:text name="vBookingList.total" />',
		dataIndex : 'total',
		name : 'total',
		align : 'center',
		width:100
	}, {
		text : '<s:text name="vBookingList.bookingTime" />',
		dataIndex : 'bookingTime',
		name : 'bookingTime',
		align : 'center',
		width:150,
		convert : function(val){
			var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
			return Ext.Date.format(date,'Y-m-d H:i:s');
		}
	},{
		text : '<s:text name="vBookingList.dateFrom" />',
		dataIndex : 'dateFrom',
		name : 'dateFrom',
		align : 'center',
		width : 150,
		convert : function(val){
			var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
			return Ext.Date.format(date,'Y-m-d H:i:s');
		}
	}, {
		text : '<s:text name="vBookingList.dateTo" />',
		dataIndex : 'dateTo',
		name : 'dateTo',
		align : 'center',
		width : 150,
		convert : function(val){
			var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
			return Ext.Date.format(date,'Y-m-d H:i:s');
		}
	}, {
		text : '<s:text name="vBookingList.productType" />',
		dataIndex : 'productType',
		name : 'productType',
		align : 'center',
		width : 200,
		hidden:true
	}, {
		text : '<s:text name="vBookingList.certificateCode" />',
		dataIndex : 'certificateCode',
		name : 'certificateCode',
		align : 'center',
		width : 200
	}, {
		text : '<s:text name="vBookingList.buildingName" />',
		dataIndex : 'buildingName',
		name : 'buildingName',
		align : 'center',
		width:100,
		hidden : true
	}, {
		text : '<s:text name="vBookingList.cityName" />',
		dataIndex : 'cityName',
		name : 'cityName',
		align : 'center',
		width:100,
		hidden : true
	},{
		text : '<s:text name="vBookingList.areaName" />',
		dataIndex : 'areaName',
		name : 'areaName',
		align : 'center',
		width:100,
		hidden : true
	},{
		text : '<s:text name="vBookingList.floorName" />',
		dataIndex : 'floorName',
		name : 'floorName',
		align : 'center',
		width:100,
		hidden : true
	},{
		text : '<s:text name="vBookingList.buildingId" />',
		dataIndex : 'buildingId',
		name : 'buildingId',
		align : 'center',
		width:100,
		hidden : true
	},{
		text : '<s:text name="vBookingList.consumerId" />',
		dataIndex : 'consumerId',
		name : 'consumerId',
		align : 'center',
		width:100,
		hidden : true
	},{
		text : '<s:text name="vBookingList.areaId" />',
		dataIndex : 'areaId',
		name : 'areaId',
		align : 'center',
		width:100,
		hidden : true
	},{
		text : '<s:text name="vBookingList.cityId" />',
		dataIndex : 'cityId',
		name : 'cityId',
		align : 'center',
		width:100,
		hidden : true
	},{
		text : '<s:text name="vBookingList.bookingId" />',
		dataIndex : 'bookingId',
		name : 'bookingId',
		align : 'center',
		width:100,
		hidden : true
	},{
		text : '<s:text name="vBookingList.badge" />',
		dataIndex : 'badge',
		name : 'badge',
		align : 'center',
		width:100
	}];
	var columnOperators = [ {
		xtype : 'rownumberer',
		width : 40
	} /*,{
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
			}]
		}*/];
	var mainColumns = columnOperators.concat(mainFields);
</script>
