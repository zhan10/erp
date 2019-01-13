<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vOrdersItem.customId" />',dataIndex:'customId',name:'customId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vOrdersItem.salesId" />',dataIndex:'salesId',name:'salesId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vOrdersItem.status" />',dataIndex:'status',name:'status',align : 'center',width:80,locked:true}			
		,{text : '<s:text name="vOrdersItem.ordersNum" />',dataIndex:'ordersNum',name:'ordersNum',align : 'center',width:100,locked:true,
			renderer:function(v,m,record,ri,ci){  
			   var aResult= record.get('ordersNum');  
			   var bResult=record.get('serialNum');  
			   return aResult +'-'+ bResult;  
			        } }

		,{text : '<s:text name="vOrdersItem.spec1" />',dataIndex:'spec1',name:'spec1',align : 'center',width:80,locked:true}
		,{text : '<s:text name="vOrdersItem.spec2" />',dataIndex:'spec2',name:'spec2',align : 'center',width:80,locked:true}
		,{text : '<s:text name="vOrdersItem.storeLimit" />',dataIndex:'storeLimit',name:'storeLimit',align : 'center',width:80,locked:true}
		,{text : '<s:text name="vOrdersItem.produceWeight" />',dataIndex:'produceWeight',name:'produceWeight',align : 'center',width:80,locked:true}
		,{text : '<s:text name="vOrdersItem.allotWeight" />',dataIndex:'allotWeight',name:'allotWeight',align : 'center',width:80,locked:true}
		,{text : '<s:text name="vOrdersItem.ordersId" />',dataIndex:'ordersId',name:'ordersId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vOrdersItem.salesName" />',dataIndex:'salesName',name:'salesName',align : 'center',width:100}
		,{text : '<s:text name="vOrdersItem.customCode" />',dataIndex:'customCode',name:'customCode',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.customName" />',dataIndex:'customName',name:'customName',align : 'center',width:200}
		,{text : '<s:text name="vOrdersItem.purpose" />',dataIndex:'purpose',name:'purpose',align : 'center',width:100}
		,{text : '<s:text name="vOrdersItem.alloyModel" />',dataIndex:'alloyModel',name:'alloyModel',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.alloyStatus" />',dataIndex:'alloyStatus',name:'alloyStatus',align : 'center',width:60}
		,{text : '<s:text name="vOrdersItem.leng" />',dataIndex:'leng',name:'leng',align : 'center',width:60}
		,{text : '<s:text name="vOrdersItem.thicknessTolerance" />',dataIndex:'thicknessTolerance',name:'thicknessTolerance',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.widthTolerance" />',dataIndex:'widthTolerance',name:'widthTolerance',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.lengthTolerance" />',dataIndex:'lengthTolerance',name:'lengthTolerance',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.innerDiameter" />',dataIndex:'innerDiameter',name:'innerDiameter',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.outerDiameter" />',dataIndex:'outerDiameter',name:'outerDiameter',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.jointNum" />',dataIndex:'jointNum',name:'jointNum',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.sideSpread" />',dataIndex:'sideSpread',name:'sideSpread',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.tensileStrength" />',dataIndex:'tensileStrength',name:'tensileStrength',align : 'center',width:100}
		,{text : '<s:text name="vOrdersItem.pinholeNum" />',dataIndex:'pinholeNum',name:'pinholeNum',align : 'center',width:100}
		,{text : '<s:text name="vOrdersItem.wettability" />',dataIndex:'wettability',name:'wettability',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.wholeSpread" />',dataIndex:'wholeSpread',name:'wholeSpread',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.extensibility" />',dataIndex:'extensibility',name:'extensibility',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.appearance" />',dataIndex:'appearance',name:'appearance',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.otherStandard" />',dataIndex:'otherStandard',name:'otherStandard',align : 'center',width:160}
		,{text : '<s:text name="vOrdersItem.specialReq" />',dataIndex:'specialReq',name:'specialReq',align : 'center',width:200}
		,{text : '<s:text name="vOrdersItem.packReq" />',dataIndex:'packReq',name:'packReq',align : 'center',width:80}
		,{text : '<s:text name="vOrdersItem.memo" />',dataIndex:'memo',name:'memo',align : 'center',width:100}
		,{text : '<s:text name="vOrdersItem.serialNum" />',dataIndex:'serialNum',name:'serialNum',align : 'center',width:10,hidden:true}
		
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
