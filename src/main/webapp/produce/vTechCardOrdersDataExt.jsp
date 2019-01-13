<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vTechCardOrders.ordersItemId" />',dataIndex:'ordersItemId',name:'ordersItemId',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.techCardId" />',dataIndex:'techCardId',name:'techCardId',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.allotWeight" />',dataIndex:'allotWeight',name:'allotWeight',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.ordersNum" />',dataIndex:'ordersNum',name:'ordersNum',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.storeLimit" />',dataIndex:'storeLimit',name:'storeLimit',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="vTechCardOrders.ordersId" />',dataIndex:'ordersId',name:'ordersId',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.serialNum" />',dataIndex:'serialNum',name:'serialNum',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.spec1" />',dataIndex:'spec1',name:'spec1',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.spec2" />',dataIndex:'spec2',name:'spec2',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.alloyModel" />',dataIndex:'alloyModel',name:'alloyModel',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.alloyStatus" />',dataIndex:'alloyStatus',name:'alloyStatus',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.thicknessTolerance" />',dataIndex:'thicknessTolerance',name:'thicknessTolerance',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.widthTolerance" />',dataIndex:'widthTolerance',name:'widthTolerance',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.outerDiameter" />',dataIndex:'outerDiameter',name:'outerDiameter',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.innerDiameter" />',dataIndex:'innerDiameter',name:'innerDiameter',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.jointNum" />',dataIndex:'jointNum',name:'jointNum',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.pinholeNum" />',dataIndex:'pinholeNum',name:'pinholeNum',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.wettability" />',dataIndex:'wettability',name:'wettability',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.tensileStrength" />',dataIndex:'tensileStrength',name:'tensileStrength',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.extensibility" />',dataIndex:'extensibility',name:'extensibility',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.sideSpread" />',dataIndex:'sideSpread',name:'sideSpread',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.wholeSpread" />',dataIndex:'wholeSpread',name:'wholeSpread',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.leng" />',dataIndex:'leng',name:'leng',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.lengthTolerance" />',dataIndex:'lengthTolerance',name:'lengthTolerance',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.appearance" />',dataIndex:'appearance',name:'appearance',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.otherStandard" />',dataIndex:'otherStandard',name:'otherStandard',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.specialReq" />',dataIndex:'specialReq',name:'specialReq',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.purpose" />',dataIndex:'purpose',name:'purpose',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.amount" />',dataIndex:'amount',name:'amount',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.packReq" />',dataIndex:'packReq',name:'packReq',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.memo" />',dataIndex:'memo',name:'memo',align : 'center',width:100}
		,{text : '<s:text name="vTechCardOrders.produceWeight" />',dataIndex:'produceWeight',name:'produceWeight',align : 'center',width:100}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'produce/techCardOrders!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
