<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vInStorePlan.status" />',dataIndex:'tatus',name:'tatus',align : 'center',width:100}
		,{text : '<s:text name="vInStorePlan.code" />',dataIndex:'code',name:'code',align : 'center',width:100}
		,{text : '<s:text name="vInStorePlan.deliverDept" />',dataIndex:'deliverDept',name:'deliverDept',align : 'center',width:100}
		,{text : '<s:text name="vInStorePlan.caseNum" />',dataIndex:'caseNum',name:'caseNum',align : 'center',width:100}
		,{text : '<s:text name="vInStorePlan.sumWeight" />',dataIndex:'sumWeight',name:'sumWeight',align : 'center',width:100}
		,{text : '<s:text name="vInStorePlan.inputerName" />',dataIndex:'inputerName',name:'inputerName',align : 'center',width:100}
		,{text : '<s:text name="vInStorePlan.inputDate" />',dataIndex:'inputDate',name:'inputDate',align : 'center',width:100}
		,{text : '<s:text name="vInStorePlan.checkerName" />',dataIndex:'checkerName',name:'checkerName',align : 'center',width:100}
		,{text : '<s:text name="vInStorePlan.checkDate" />',dataIndex:'checkDate',name:'checkDate',align : 'center',width:100}
		,{text : '<s:text name="vInStorePlan.checker" />',dataIndex:'checker',name:'checker',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vInStorePlan.inputer" />',dataIndex:'inputer',name:'inputer',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vInStorePlan.memo" />',dataIndex:'memo',name:'storeKeeper',align : 'center',flex:1}
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
				isEdit = true;
				sm.select(rowIndex);	
				var rec = ds.getAt(rowIndex);	
				editWinByRec(win, form, rec);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				sm.select(rowIndex);
				delFromDB(ds, sm,'store/inStorePlan!delete',function() {});
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
