<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="mateType.matetypeid" />',dataIndex : 'matetypeid',name : 'matetypeid',width : 100,flex:1}
		,{text : '<s:text name="mateType.matertypename" />',dataIndex:'matertypename',name:'matertypename',align : 'center',width:100,flex:1}
		,{text : '<s:text name="mateType.description" />',dataIndex:'description',name:'description',align : 'center',width:100,flex:1}
		,{
			text : '<s:text name="mateType.isend" />',
			dataIndex:'isend',
			name:'isend',
			align : 'center',
			flex:1,
			renderer : function(val) {
				if(val){
					return "是"
				}else{
					return "否"
				}
			}
		 }
		,{text : '<s:text name="mateType.grade" />',dataIndex:'grade',name:'grade',align : 'center',width:100,flex:1}
		,{
			text : '<s:text name="mateType.parentid" />',
			dataIndex:'parentid',
			name:'parentid',
			align : 'center',
			width:100,
			flex:1,
			renderer : function(val) {
				return cb_mateType_ds.findRecord('id', val).get('name');
			}
		}
		
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
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'mater/mateType!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
