<%@ page contentType="text/html;charset=UTF-8"%>
<script>
mainFields =[ {
	name: 'id',
		mapping: function(raw) {
          return raw[0];
		 }
	}, {
        name: 'name',
        mapping: function(raw) {
           return raw[1];
			 }
	  }, {
            name: 'code',
            mapping: function(raw) {
               return raw[2];
   			 }
		  }];
mainColumns = [{
	xtype : 'rownumberer',
	width : 40
}, {
	xtype : 'actioncolumn',
	locked : true,
	width : 50,
	items : [{
		icon : 'img/toolbar/edit.gif',
		tooltip : '修改',
		handler : function(grid, rowIndex, colIndex) {
			var rec = grid.getStore().getAt(rowIndex);				
			editWinByRec(win,winTitle+'——修改', rec);
			form.down('#code').setReadOnly(true);form.down('#name').setReadOnly(true);
			Ext.apply(roles_ds.proxy.extraParams,{whereSql : ' and id in (select a.roleId from UserRole a where a.userId='+rec.get('id')+')'});
 			roles_ds.load();
 			Ext.apply(select_roles_ds.proxy.extraParams,{whereSql : ' and id not in (select a.roleId from UserRole a where a.userId='+rec.get('id')+')'});
 			select_roles_ds.load();
			select_roles_grid.show();form.down('#btnMove').show();
		}
	}]
},{
    text: 'id',        
    dataIndex: 'id',hidden:true
}, {
    text: '工号', 
    width: 200, 
    sortable: true, align : 'center',
    dataIndex: 'code'
}, {
    text: '用户名', 
    flex: 1, 
    sortable: true, align : 'center',
    dataIndex: 'name'
}];    	  
	
	
	
</script>
