<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [ {
		text : 'id',
		dataIndex : 'id',
		name : 'id',
		width : 40,
		hidden : true
	}, {
		text : '<s:text name="roles.name" />',
		dataIndex : 'name',
		name : 'name',
		width : 300,
		align : 'center'
	}, {
		text : '<s:text name="roles.info" />',
		dataIndex : 'info',
		name : 'info',
		flex : 1,
		align : 'center'
	} ];
	var columnOperators = [
			{
				xtype : 'rownumberer',
				width : 40
}, {
				xtype : 'actioncolumn',
				locked : true,
				width : 50,
				items : [ {
							icon : 'img/toolbar/edit.gif',
							tooltip : '修改',
							handler : function(grid, rowIndex, colIndex) {
								var rec = grid.getStore().getAt(rowIndex);
								editWinByRec(win, winTitle + '——修改', rec);
								Ext
										.apply(
												users_ds.proxy.extraParams,
												{
													whereSql : ' and id in (select a.userId from UserRole a where a.roleId='
															+ rec.get('id')
															+ ')'
												});
								users_ds.load();
								Ext
										.apply(
												select_users_ds.proxy.extraParams,
												{
													whereSql : ' and id not in (select a.userId from UserRole a where a.roleId='
															+ rec.get('id')
															+ ')'
												});
								select_users_ds.load();
								select_users_grid.show();
								form.down('#btnMove').show();
}
}, {
							icon : 'img/toolbar/delete.gif',
							tooltip : '删除',
							handler : function(grid, rowIndex, colIndex) {
								sm.select(rowIndex);
								delFromDB(ds, sm, 'system/roles!delete',
										function() {
										});
							}
						} ]
			} ];
	var mainColumns = columnOperators.concat(mainFields);
</script>
