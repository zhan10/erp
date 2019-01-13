<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var health_Fields = [ {
		text : 'id',
		dataIndex : 'id',
		name : 'id',
		width : 40,
		hidden : true
	}, {
		text : '<s:text name="health.userId" />',
		dataIndex : 'userId',
		name : 'userId',
		align : 'center',
		width : 100,
		hidden : true
	}, {
		text : '<s:text name="health.checkedTime" />',
		dataIndex : 'checkedTime',
		name : 'checkedTime',
		renderer : function(_registerDate) {
			return _registerDate.replace("T", " ");
		},
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="health.height" />',
		dataIndex : 'height',
		name : 'height',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="health.weight" />',
		dataIndex : 'weight',
		name : 'weight',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="health.diastolicPressure" />',
		dataIndex : 'diastolicPressure',
		name : 'diastolicPressure',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="health.systolicPressure" />',
		dataIndex : 'systolicPressure',
		name : 'systolicPressure',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="health.bodyFatRatio" />',
		dataIndex : 'bodyFatRatio',
		name : 'bodyFatRatio',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="health.oxygenSaturation" />',
		dataIndex : 'oxygenSaturation',
		name : 'oxygenSaturation',
		align : 'center',
		width : 100
	}, {
		text : '<s:text name="health.pulse" />',
		dataIndex : 'pulse',
		name : 'pulse',
		align : 'center',
		width : 100
	} ];
	var health_ds = getDs(health_Fields, 'crm/health!managerExt', '',
			'order by userId');
	health_ds.pageSize = 999;

	var health_grid = Ext.create('Ext.grid.Panel', {
		id : 'health_grid',
		store : health_ds,
		margin : "5",
		//tbar : orders_tbar,		
		columns : health_Fields,
		columnLines : true,
		flex : 1
	});
</script>
