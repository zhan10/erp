<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="recipe.recipeType" />',dataIndex:'recipeType',name:'recipeType',align : 'center',width:100}
		,{text : '<s:text name="recipe.keyword" />',dataIndex:'keyword',name:'keyword',align : 'center',width:100}
		,{text : '<s:text name="recipe.spicy" />',dataIndex:'spicy',name:'spicy',align : 'center',width:100}
		,{text : '<s:text name="recipe.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="recipe.price" />',dataIndex:'price',name:'price',align : 'center',width:100}
		,{text : '<s:text name="recipe.pic" />',dataIndex:'pic',name:'pic',align : 'center',width:100}
		,{text : '<s:text name="recipe.memo" />',dataIndex:'memo',name:'memo',align : 'center',width:100}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'restaurant/cipe!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
