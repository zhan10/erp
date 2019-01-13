<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
			{
				text : 'id',
				dataIndex : 'id',
				name : 'id',
				width : 40,
				hidden : true
			},{
				text : '<s:text name="marketing.priority" />',
				dataIndex : 'priority',
				name : 'priority',
				align : 'center',
				width : 100
			},
			{
				text : '<s:text name="marketing.statusBit" />',
				dataIndex : 'statusBit',
				name : 'statusBit',
				align : 'center',
				width : 100,
				hidden : true,
				renderer : function(val) {
					try {
						var ret = marketingStatusBitDs.findRecord('value', val)
								.get('text');
						return ret;
					} catch (e) {
					}
				}
			},
			{
				text : '<s:text name="marketing.status" />',
				dataIndex : 'status',
				name : 'status',
				align : 'center',
				width : 100,
				renderer : function(val) {
					try {
						var ret = marketingStatusDs.findRecord('value', val)
								.get('text');
						return ret;
					} catch (e) {
					}
				}
			},
			{
				text : '<s:text name="marketing.name" />',
				dataIndex : 'name',
				name : 'name',
				align : 'center',
				width : 200
			},
			{
				text : '<s:text name="marketing.creater" />',
				dataIndex : 'creater',
				name : 'creater',
				align : 'center',
				width : 200
			},
			{
				text : '<s:text name="marketing.openTime" />',
				dataIndex : 'openTime',
				name : 'openTime',
				align : 'center',
				width : 200,
				convert : function(val) {
					//var date = new Date(val);
					if (val == null) {
						return val;
					} else {
						var date = Ext.Date.add(new Date(val), Ext.Date.HOUR,
								-8);
						return Ext.Date.format(date, 'Y-m-d H:i:s');
					}
				}
			},
			{
				text : '<s:text name="marketing.startTime" />',
				dataIndex : 'startTime',
				name : 'startTime',
				align : 'center',
				width : 200,
				convert : function(val) {
					//var date = new Date(val);
					if (val == null) {
						return val;
					} else {
						var date = Ext.Date.add(new Date(val), Ext.Date.HOUR,
								-8);
						return Ext.Date.format(date, 'Y-m-d H:i:s');
					}
				}
			},
			{
				text : '<s:text name="marketing.endTime" />',
				dataIndex : 'endTime',
				name : 'endTime',
				align : 'center',
				width : 200,
				convert : function(val) {
					//var date = new Date(val);
					if (val == null) {
						return val;
					} else {
						var date = Ext.Date.add(new Date(val), Ext.Date.HOUR,
								-8);
						return Ext.Date.format(date, 'Y-m-d H:i:s');
					}
				}
			},
			{
				text : '<s:text name="marketing.type" />',
				dataIndex : 'type',
				name : 'type',
				align : 'center',
				width : 200,
				renderer : function(val) {
					try {
						var ret = marketingTypeDs.findRecord('value', val).get(
								'text');
						return ret;
					} catch (e) {
					}
				}
			},
			{
				text : '<s:text name="marketing.coupon" />',
				dataIndex : 'coupon',
				name : 'coupon',
				align : 'center',
				width : 200
			},
			{
				text : '<s:text name="marketing.memo" />',
				dataIndex : 'memo',
				name : 'memo',
				align : 'center',
				width : 200
			},
			{
				text : '<s:text name="marketing.conditionSetting" />',
				dataIndex : 'conditionSetting',
				name : 'conditionSetting',
				align : 'center',
				hidden : true,
				width : 200
			},
			{
				text : '<s:text name="marketing.pic" />',
				dataIndex : 'fileShow',
				name : 'fileShow',
				align : 'center',
				width : 200,
				renderer : function(v, m, record, ri, ci) {
					var val = record.get('pic');
					return val == '' || val == null ? ''
							: '<a target="_blank" href="pics/marketing/'+val+'">'
									+ val + '</a>';
				}
			}, {
				text : '<s:text name="marketing.pic" />',
				dataIndex : 'pic',
				name : 'pic',
				align : 'center',
				width : 200,
				hidden : true
			} ];
	var columnOperators = [ {
		xtype : 'rownumberer',
		width : 40
	} /* ,{
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
					delFromDB(grid.getStore(), grid.getSelectionModel(),'produce/marketing!delete');
			}
		}]
		} */];
	var mainColumns = columnOperators.concat(mainFields);
</script>
