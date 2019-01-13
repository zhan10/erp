<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var users_grid;
	var select_users_grid;
	var users_Fields =[{
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
	var columns = [{
        text: 'id',        
        dataIndex: 'id',hidden:true
    }, {
        text: '工号', 
        width: 80, 
        sortable: true, align : 'center',
        dataIndex: 'code'
    }, {
        text: '用户名', 
        flex: 1, 
        sortable: true, align : 'center',
        dataIndex: 'name'
    }];    
	users_ds = getDs(users_Fields, 'system/users!getUsersNameCode','','order by code');
	users_ds.pageSize=9999;	
	users_grid= Ext.create('Ext.grid.Panel', {		
		title:'本角色用户',
		id : 'users_grid',
		store : users_ds,
		multiSelect: true,
		margin : "5",
		columns : columns,height: 400,
		columnLines : true,
		viewConfig: {
             plugins: {
                 ptype: 'gridviewdragdrop',
                 dragGroup: 'users_gridDDGroup',
                 dropGroup: 'select_users_gridDDGroup'
             }
        }
		,flex:1,selModel :Ext.create('Ext.selection.CheckboxModel'),
		 listeners: {
			 'itemdblclick':function(grid,rec) {
				 if(form.form.findField('id').value==undefined)
					 return;//只读状态无事件
				users_ds.remove(rec);
				select_users_ds.insert(0,rec);	 
				}
		 }
		
	});
	select_users_ds= getDs(users_Fields, 'system/users!getUsersNameCode','',' order by code');
	select_users_ds.pageSize=9999;	
	select_users_grid= Ext.create('Ext.grid.Panel', {
		title:'所有用户',
		id : 'select_users_grid',
		store : select_users_ds,
		multiSelect: true,
		margin : "5",
		columns : columns,
		columnLines : true,
		hidden:true,height: 400,
		 viewConfig: {
             plugins: {
                 ptype: 'gridviewdragdrop',
                 dragGroup: 'select_users_gridDDGroup',
                 dropGroup: 'users_gridDDGroup'
             }
         }
		,flex:1	,selModel :Ext.create('Ext.selection.CheckboxModel'),
		listeners: {
			 'itemdblclick':function(grid,rec) {				
				 select_users_ds.remove(rec);
				users_ds.insert(0,rec);	 
				}
         }
	});
	
</script>
