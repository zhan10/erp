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
				text : '<s:text name="vRefundRecord.status" />',
				dataIndex : 'status',
				name : 'status',
				align : 'center',
				width: 150,
				renderer : function(val) {
					try {
						var ret = bookingStatusDs.findRecord('value', val).get('text');
						if (val == 8)
							return '<span style="color:red">已结算</span>';
						return ret;
					} catch (e) {
					}
				}
			},
			{
				text : '<s:text name="vRefundRecord.code" />',
				dataIndex : 'code',
				name : 'code',
				align : 'center',
				width : 150
			}, {
				text : '<s:text name="vRefundRecord.consumerName" />',
				dataIndex : 'consumerName',
				name : 'consumerName',
				align : 'center',
				width : 150
			}, {
				text : '<s:text name="vRefundRecord.refundTime" />',
				dataIndex : 'refundTime',
				name : 'refundTime',
				align : 'center',
				width : 200,
				convert : function(val){
					//var date = new Date(val);
					var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
					return Ext.Date.format(date,'Y-m-d H:i:s');
				}
			}, {
				text : '<s:text name="vRefundRecord.amount" />',
				dataIndex : 'amount',
				name : 'amount',
				align : 'center',
				width : 100
			}, {
				text : '<s:text name="vRefundRecord.tel" />',
				dataIndex : 'tel',
				name : 'tel',
				align : 'center',
				width : 100
			}, {
				text : '<s:text name="vRefundRecord.memo" />',
				dataIndex : 'memo',
				name : 'memo',
				align : 'center',
				flex : 1
			}, {
				text : '<s:text name="vRefundRecord.consumerId" />',
				dataIndex : 'consumerId',
				name : 'consumerId',
				align : 'center',
				width : 100,
				hidden : true
			}, {
				text : '<s:text name="vRefundRecord.bookingId" />',
				dataIndex : 'bookingId',
				name : 'bookingId',
				align : 'center',
				width : 100,
				hidden : true
			}, {
				text : '<s:text name="vRefundRecord.relatedId" />',
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
