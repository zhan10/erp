<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var vOrdersList_Fields = [ {
		text : 'id',
		dataIndex : 'id',
		name : 'id',
		width : 40,
		hidden : true
	}, {
		text : '<s:text name="vOrdersList.consumerId" />',
		dataIndex : 'consumerId',
		name : 'consumerId',
		align : 'center',
		width : 40,
		hidden : true
	}, {
		text : '<s:text name="vOrdersList.status" />',
		dataIndex : 'status',
		name : 'status',
		align : 'center',
		width : 100,
		renderer : function(val) {
			var ret = vOrdersStatusDs.findRecord('value', val).get('text');
			return ret;
		}
	}, {
		text : '<s:text name="vOrdersList.recipeName" />',
		dataIndex : 'recipeName',
		name : 'recipeName',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vOrdersList.price" />',
		dataIndex : 'price',
		name : 'price',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vOrdersList.numbers" />',
		dataIndex : 'numbers',
		name : 'numbers',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vOrdersList.total" />',
		dataIndex : 'total',
		name : 'total',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vOrdersList.consumerName" />',
		dataIndex : 'consumerName',
		name : 'consumerName',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vOrdersList.address" />',
		dataIndex : 'address',
		name : 'address',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="vOrdersList.ordersTime" />',
		dataIndex : 'ordersTime',
		name : 'ordersTime',
		align : 'center',
		width : 100,
		convert : function(val) {
			//var date = new Date(val);
			if (val == null) {
				return val;
			} else {
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
				return Ext.Date.format(date, 'Y-m-d H:i:s');
			}
		}
	} ];
	var vOrdersList_ds = getDs(vOrdersList_Fields,
			'serve/vOrdersList!managerExt', '', 'order by consumerId');
	vOrdersList_ds.pageSize = 999;

	var vOrdersList_grid = Ext.create('Ext.grid.Panel', {
		id : 'vOrdersList_grid',
		store : vOrdersList_ds,
		margin : "5",
		//tbar : orders_tbar,		
		columns : vOrdersList_Fields,
		columnLines : true,
		flex : 1
	});
</script>
