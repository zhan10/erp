<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vHealth.checkedTime" />',dataIndex:'checkedTime',name:'checkedTime',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="vHealth.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{
			text : '<s:text name="vHealth.sex" />',
			dataIndex:'sex',
			name:'sex',
			align : 'center',
			width:100,
			renderer : function(v) {
				if (v==true)
					return "男";
				if(v==false)
				return "女";
			}
		 }
		,{text : '<s:text name="vHealth.birth" />',dataIndex:'birth',name:'birth',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="vHealth.certificate" />',dataIndex:'certificate',name:'certificate',align : 'center',width:100}
		,{text : '<s:text name="vHealth.certificateCode" />',dataIndex:'certificateCode',name:'certificateCode',align : 'center',width:100}
		,{text : '<s:text name="vHealth.tel" />',dataIndex:'tel',name:'tel',align : 'center',width:100}
		,{text : '<s:text name="vHealth.email" />',dataIndex:'email',name:'email',align : 'center',width:100}
		,{text : '<s:text name="vHealth.address" />',dataIndex:'address',name:'address',align : 'center',width:100}
		,{text : '<s:text name="vHealth.cardType" />',dataIndex:'cardType',name:'cardType',align : 'center',width:100}
		,{text : '<s:text name="vHealth.cardCode" />',dataIndex:'cardCode',name:'cardCode',align : 'center',width:100}
		,{text : '<s:text name="vHealth.height" />',dataIndex:'height',name:'height',align : 'center',width:100}
		,{text : '<s:text name="vHealth.weight" />',dataIndex:'weight',name:'weight',align : 'center',width:100}
		,{text : '<s:text name="vHealth.pulse" />',dataIndex:'pulse',name:'pulse',align : 'center',width:100}
		,{text : '<s:text name="vHealth.diastolicPressure" />',dataIndex:'diastolicPressure',name:'diastolicPressure',align : 'center',width:100}
		,{text : '<s:text name="vHealth.systolicPressure" />',dataIndex:'systolicPressure',name:'systolicPressure',align : 'center',width:100}
		,{text : '<s:text name="vHealth.bodyFatRatio" />',dataIndex:'bodyFatRatio',name:'bodyFatRatio',align : 'center',width:100}
		,{text : '<s:text name="vHealth.oxygenSaturation" />',dataIndex:'oxygenSaturation',name:'oxygenSaturation',align : 'center',width:100}
		,{text : '<s:text name="vHealth.userId" />',dataIndex:'userId',name:'userId',align : 'center',width:100,hidden:true}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'crm/health!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
