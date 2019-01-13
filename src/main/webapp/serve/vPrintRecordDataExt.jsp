<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{
			text : '<s:text name="vPrintRecord.printTime" />',
			dataIndex:'printTime',
			name:'printTime',
			align : 'center',
			flex:150,
			convert : function(val){
				//var date = new Date(val);
				if(val == null){
					return val;
				}else{
					var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
					return Ext.Date.format(date,'Y-m-d H:i:s');
				}
			}
		 }
		,{text : '<s:text name="vPrintRecord.consumerId" />',dataIndex:'consumerId',name:'consumerId',align : 'center',flex:100,hidden:true}
		,{text : '<s:text name="vPrintRecord.consumerName" />',dataIndex:'consumerName',name:'consumerName',align : 'center',flex:100}
		,{text : '<s:text name="vPrintRecord.cardNumber" />',dataIndex:'cardNumber',name:'cardNumber',align : 'center',flex:100}
		,{text : '<s:text name="vPrintRecord.printerModel" />',dataIndex:'printerModel',name:'printerModel',align : 'center',flex:100}
		,{text : '<s:text name="vPrintRecord.printerMac" />',dataIndex:'printerMac',name:'printerMac',align : 'center',flex:120}
		,{text : '<s:text name="vPrintRecord.printerIp" />',dataIndex:'printerIp',name:'printerIp',align : 'center',flex:100}
		,{text : '<s:text name="vPrintRecord.printFormat" />',dataIndex:'printFormat',name:'printFormat',align : 'center',flex:100,
			renderer : function(val) {
				try {
					var ret = printFormatDs.findRecord('value', val).get('text');
					return ret;
					} catch (e) {
				}
			}}
		,{text : '<s:text name="vPrintRecord.paperFormat" />',dataIndex:'paperFormat',name:'paperFormat',align : 'center',flex:100,
			renderer : function(val) {
				try {
					var ret = paperFormatDs.findRecord('value', val).get('text');
					return ret
					} catch (e) {
				}
			}}
		,{text : '<s:text name="vPrintRecord.paperCount" />',dataIndex:'paperCount',name:'paperCount',align : 'center',flex:100}
		,{
			text : '<s:text name="vPrintRecord.syncTime" />',
			dataIndex:'syncTime',
			name:'syncTime',
			align : 'center',
			flex:100,
			hidden:true,
			convert : function(val){
				//var date = new Date(val);
				if(val == null){
					return val;
				}else{
					var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
					return Ext.Date.format(date,'Y-m-d H:i:s');
				}
			}
		 }
		,{text : '<s:text name="vPrintRecord.chargeUnit" />',dataIndex:'chargeUnit',name:'chargeUnit',align : 'center',flex:100,hidden:true}
		,{text : '<s:text name="vPrintRecord.price" />',dataIndex:'price',name:'price',align : 'center',flex:100}
		,{
			text : '<s:text name="vPrintRecord.total" />',
			dataIndex:'total',
			name:'total',
			align : 'center',
			flex:100,
			convert:function(val,record){
				var paperCount = record.data.paperCount;
				var price = record.data.price;
				return price*paperCount;
			}
		  }
		];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	}/* ,{
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'serve/vPrintRecord!delete');
		}
	}]
	} */];
	var mainColumns = columnOperators.concat(mainFields);
</script>
