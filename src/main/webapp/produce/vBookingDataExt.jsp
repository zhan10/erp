<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [ {
		text : 'id',
		dataIndex : 'id',
		name : 'id',
		width : 40,
		hidden : true
	}
	,{
    	text : '<s:text name="vBooking.img" />',
    	dataIndex:'img',
    	id:'imgs',
    	name:'img',
    	align : 'center',
    	hidden : true,
    	width:100,
    	convert:function(val,record){
    		var codes=record.data.code;
    		var contractCodes=record.data.contractCode;
    		//alert(contractCodes);
      		return '<a href="http://anhui.s-plus.cn/order/readPDF?guid='+contractCodes+'&id='+codes+'" target="_blank"><img style="vertical-align:middle; height:18px; width:18px;" src="img/toolbar/open.png"/></a>';	
    	}
    }
	, {
		text : '<s:text name="vBooking.status" />',
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
		}
	}, {
		text : '<s:text name="vBooking.code" />',
		dataIndex : 'code',
		name : 'code',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vBooking.buildingName" />',
		dataIndex : 'buildingName',
		name : 'buildingName',
		align : 'center',
		width : 200
	}, {
		text : '<s:text name="vBooking.consumerName" />',
		dataIndex : 'consumerName',
		name : 'consumerName',
		align : 'center',
		width : 100
	},{
		text : '<s:text name="vBooking.originalCost" />',
		dataIndex : 'originalCost',
		name : 'originalCost',
		align : 'center',
		width : 100
	},{
		text : '<s:text name="vBooking.deposit" />',
		dataIndex : 'deposit',
		name : 'deposit',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vBooking.total" />',
		dataIndex : 'total',
		name : 'total',
		align : 'center',
		width : 80
	}, {
		text : '<s:text name="vBooking.amender" />',
		dataIndex : 'amender',
		name : 'amender',
		align : 'center',
		width : 100
	},{
		text : '<s:text name="vBooking.amendTime" />',
		dataIndex : 'amendTime',
		name : 'amendTime',
		align : 'center',
		width : 100,
		convert : function(val){
			//var date = new Date(val);
			if(val == null){
				return val;
			}else{
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
				return Ext.Date.format(date,'Y-m-d H:i:s');
			}
		}
	},  {
		text : '<s:text name="vBooking.persons" />',
		dataIndex : 'persons',
		name : 'persons',
		align : 'center',
		width : 60
	}, {
		text : '<s:text name="vBooking.bookingTime" />',
		dataIndex : 'bookingTime',
		name : 'bookingTime',
		align : 'center',
		width : 150,
		convert : function(val) {
			return val?val.replace('\T', ' '):'';
		}
	}, {
		text : '<s:text name="vBooking.cityName" />',
		dataIndex : 'cityName',
		name : 'cityName',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vBooking.areaName" />',
		dataIndex : 'areaName',
		name : 'areaName',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="booking.balanceTime" />',
		dataIndex : 'balanceTime',
		name : 'balanceTime',
		align : 'center',
		width : 150,
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
		text : '<s:text name="booking.balancePrice" />',
		dataIndex : 'balancePrice',
		name : 'balancePrice',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vBooking.tel" />',
		dataIndex : 'tel',
		name : 'tel',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vBooking.email" />',
		dataIndex : 'email',
		name : 'email',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vBooking.consumerId" />',
		dataIndex : 'consumerId',
		name : 'consumerId',
		align : 'center',
		width : 100,
		hidden : true
	}, {
		text : '<s:text name="vBooking.areaId" />',
		dataIndex : 'areaId',
		name : 'areaId',
		align : 'center',
		width : 100,
		hidden : true
	}, {
		text : '<s:text name="vBooking.buildingId" />',
		dataIndex : 'buildingId',
		name : 'buildingId',
		align : 'center',
		width : 100,
		hidden : true
	}, {
		text : '<s:text name="vBooking.contractCode" />',
		dataIndex : 'contractCode',
		name : 'contractCode',
		align : 'center',
		width : 100,
		hidden : true
	},  {
		text : '<s:text name="vBooking.amenderId" />',
		dataIndex : 'amenderId',
		name : 'amenderId',
		align : 'center',
		width : 100,
		hidden : true
	} ];
	var columnOperators = [
			{
				xtype : 'rownumberer',
				width : 40
			}/* ,
			{
				xtype : 'actioncolumn',
				locked : true,
				width : 50,
				items : [
						{
							icon : 'img/toolbar/edit.gif',
							tooltip : '修改',
							handler : function(grid, rowIndex, colIndex) {
								//sm.select(rowIndex);
								var rec = grid.getStore().getAt(rowIndex);
								editWinByRec(win, winTitle + '——修改', rec);
							}
						},
						{
							iconCls : 'delete',
							tooltip : '删除',
							handler : function(grid, rowIndex, colIndex) {
								grid.getSelectionModel().select(rowIndex);
								delFromDB(grid.getStore(), grid
										.getSelectionModel(),
										'produce/booking!delete');
							}
						} ]
			} */ ];
	var mainColumns = columnOperators.concat(mainFields);
</script>
