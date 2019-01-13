<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : '<s:text name="genre.id" />',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="genre.productTypeName" />',dataIndex : 'productTypeName',name : 'productTypeName',align : 'center',width : 250}
		,{text : '<s:text name="genre.name" />',dataIndex:'name',name:'name',align : 'center',width:250}
		,{text : '<s:text name="genre.price" />',dataIndex:'price',name:'price',align : 'center',width:120}
		,{
			text : '<s:text name="genre.priceUnit" />',
			dataIndex:'priceUnit',
			width : 100,
			align : 'center',
			name:'priceUnit',
			renderer : function(val) {
				try {
					var ret = productDs.findRecord('value', val).get('text');
					return ret;
				} catch (e) {
				}
			}
			}
		,{text : '<s:text name="genre.intro" />',dataIndex:'intro',name:'intro',align : 'center',flex:1}
		,{text : '<s:text name="genre.productTypeId" />',dataIndex : 'productTypeId',name : 'productTypeId',width : 40,hidden : true}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'system/genre!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
