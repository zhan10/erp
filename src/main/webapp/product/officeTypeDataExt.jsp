<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="officeType.name" />',dataIndex:'name',name:'name',align : 'center',width:200}
		,{text : '<s:text name="officeType.price" />',dataIndex:'price',name:'price',align : 'center',width:300}
		,{text : '<s:text name="officeType.deposit" />',dataIndex:'deposit',name:'deposit',align : 'center',width:300}
		,{
			text : '<s:text name="officeType.unit" />',
			dataIndex : 'unit',
		    name : 'unit',
		    align : 'center',
		    width : 100,
		    renderer : function(val) {
			try {
				var ret = dateDs.findRecord('value', val).get('text');
				return ret
				} catch (e) {
			}
		  }
		 }
		/* ,{text : '<s:text name="officeType.proportion" />',dataIndex:'proportion',name:'proportion',align : 'center',width:100}
		,{text : '<s:text name="officeType.priceAll" />',dataIndex:'priceAll',name:'priceAll',align : 'center',width:100} */
		,{text : '<s:text name="officeType.intro" />',dataIndex:'intro',name:'intro',align : 'center',flex:1}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'product/officeType!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
