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
			{text : '<s:text name="vRechargeRecord.status" />',dataIndex:'status',name:'status',align : 'center',width:100,renderer : function(val) {
				try {
					var ret = bookingStatusDs.findRecord('value', val).get('text');
					if (val == 88)
						return '<span style="color:red">已结算</span>';
					return ret;
				} catch (e) {
				}
			}
			}, {
				text : '<s:text name="vRechargeRecord.code" />',
				dataIndex : 'code',
				name : 'code',
				align : 'center',
				width : 150
			}, {
				text : '<s:text name="vRechargeRecord.consumerName" />',
				dataIndex : 'consumerName',
				name : 'consumerName',
				align : 'center',
				width : 150
			}, {
				text : '<s:text name="vRechargeRecord.rechargeTime" />',
				dataIndex : 'rechargeTime',
				name : 'rechargeTime',
				align : 'center',
				width : 200,
				convert : function(val){
					//var date = new Date(val);
					var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
					return Ext.Date.format(date,'Y-m-d H:i:s');
				}
			}, {
				text : '<s:text name="vRechargeRecord.amount" />',
				dataIndex : 'amount',
				name : 'amount',
				align : 'center',
				width : 100
			}, {
				text : '<s:text name="vRechargeRecord.tel" />',
				dataIndex : 'tel',
				name : 'tel',
				align : 'center',
				width : 100
			}, {
				text : '<s:text name="vRechargeRecord.memo" />',
				dataIndex : 'memo',
				name : 'memo',
				align : 'center',
				flex : 1
			}, {
				text : '<s:text name="vRechargeRecord.consumerId" />',
				dataIndex : 'consumerId',
				name : 'consumerId',
				align : 'center',
				width : 100,
				hidden : true
			}, {
				text : '<s:text name="vRechargeRecord.bookingId" />',
				dataIndex : 'bookingId',
				name : 'bookingId',
				align : 'center',
				width : 100,
				hidden : true
			}, {
				text : '<s:text name="vRechargeRecord.relatedId" />',
				dataIndex : 'relatedId',
				name : 'relatedId',
				align : 'center',
				width : 100,
				hidden : true
			} ];
	var columnOperators = [ {
		xtype : 'rownumberer',
		width : 40
	} ];
	var mainColumns = columnOperators.concat(mainFields);
</script>
