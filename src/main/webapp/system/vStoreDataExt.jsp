<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vStore.name" />',dataIndex:'name',name:'name',align : 'center',width:200}
		,{text : '<s:text name="vStore.userName" />',dataIndex:'userName',name:'userName',align : 'center',width:120}
		,{text : '<s:text name="vStore.manager" />',dataIndex:'manager',name:'manager',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vStore.position" />',dataIndex:'position',name:'position',align : 'center',width:300}
		,{text : '<s:text name="vStore.memo" />',dataIndex:'memo',name:'memo',align : 'center',flex:1}
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
				delFromDB(ds, sm,'system/vStore!delete',function() {});
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
