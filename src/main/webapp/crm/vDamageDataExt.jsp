<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vDamage.status" />',dataIndex:'status',name:'status',align : 'center',width:100,renderer : function(val) {
			try {
				var ret = bookingStatusDs.findRecord('value', val).get('text');
				if (val == 8)
					return '<span style="color:red">已结算</span>';
				return ret;
			} catch (e) {
			}
		}}
		,{text : '<s:text name="vDamage.consumerName" />',dataIndex:'consumerName',name:'consumerName',align : 'center',width:100}
		,{text : '<s:text name="vDamage.payTime" />',dataIndex:'payTime',name:'payTime',align : 'center',width:100,xtype: 'datecolumn', convert : function(val){
			var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
			return Ext.Date.format(date,'Y-m-d');
		}}
		,{text : '<s:text name="vDamage.code" />',dataIndex:'code',name:'code',align : 'center',width:150}
		,{text : '<s:text name="vDamage.digest" />',dataIndex:'digest',name:'digest',align : 'center',width:200}
		,{text : '<s:text name="vDamage.payment" />',dataIndex:'payment',name:'payment',align : 'center',width:100}
		,{text : '<s:text name="vDamage.memo" />',dataIndex:'memo',name:'memo',align : 'center',flex:1}
		,{text : '<s:text name="vDamage.bookingId" />',dataIndex:'bookingId',name:'bookingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vDamage.consumerId" />',dataIndex:'consumerId',name:'consumerId',align : 'center',width:100,hidden:true}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'crm/damage!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
