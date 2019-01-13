<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var rolesPanel;
	var roles_grid;
	var select_roles_grid;	
	var rolesFields = [ {
		text : 'id',
		dataIndex : 'id',
		name : 'id',
		width : 40,
		hidden : true
	}, {
		text : '<s:text name="roles.name" />',
		dataIndex : 'name',
		name : 'name',
		width : 200,
		align : 'center'
	}, {
		text : '<s:text name="roles.info" />',
		dataIndex : 'info',
		name : 'info',
		flex : 1,
		align : 'center'
	}];	
	roles_ds = getDs(rolesFields, 'system/roles!managerExt','','order by name');
	roles_ds.pageSize=9999;	
	roles_grid= Ext.create('Ext.grid.Panel', {	
		height:'100%',
		title:'本资源角色',
		id : 'roles_grid',
		store : roles_ds,
		multiSelect: true,
		margin : "5",
		columns : rolesFields,
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
				roles_ds.remove(rec);
				select_roles_ds.insert(0,rec);	 
				}
		 }
		
	});
	select_roles_ds= getDs(rolesFields, 'system/roles!managerExt','',' order by name');
	select_roles_ds.pageSize=9999;	
	select_roles_grid= Ext.create('Ext.grid.Panel', {
		title:'所有角色',height:'100%',hidden:true,
		id : 'select_roles_grid',
		store : select_roles_ds,
		multiSelect: true,
		margin : "5",
		columns : rolesFields,
		columnLines : true,
		//hidden:true,height: 400,
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
				 select_roles_ds.remove(rec);
				roles_ds.insert(0,rec);	 
				}
         }
	});
	
	rolesPanel=Ext.create('Ext.Panel',{
		flex:2,height:'100%',
		layout : 'hbox',border:false,
		items : [
					roles_grid,{itemId:'btnMove',hidden:true,xtype : 'container',height:'100%',
							layout : {type:'vbox', pack:'center',
		                        align:'center'},items:[{xtype:'button',
						    iconCls: 'moveRight',	tooltip : '去除角色',
						   // margin:'200,5,0,5',
						    handler: function() {
						    	var recs=roles_grid.getSelectionModel().getSelection();
						    	roles_ds.remove(recs);
								select_roles_ds.insert(0,recs);
						    }
						},{xtype:'button',
						    iconCls: 'moveLeft',	tooltip : '添加角色',
						    handler: function() {
						    	var recs=select_roles_grid.getSelectionModel().getSelection();
						    	select_roles_ds.remove(recs);
						    	roles_ds.insert(0,recs);
						    }
						}]},select_roles_grid]	
			,buttons: [
				       { xtype: 'button', text: '修改',itemId : 'btnEdit',
							handler : function() {
								select_roles_grid.show();
								rolesPanel.down('#btnMove').show();	
								rolesPanel.down('#btnSave').show();
								rolesPanel.down('#btnEdit').hide();
							}
						},{ xtype: 'button', text: '保存' ,itemId:'btnSave',hidden:true,
							handler : function() {				
								var gridJsonStr = "";
								for (var i = 0; i < roles_ds.getCount(); i++) {						
									gridJsonStr += "{id:"+roles_ds.getAt(i).data['id']+"}";
									if (i < roles_ds.getCount() - 1)
										gridJsonStr += ",";					
								}				
								if(!gridJsonStr=="")
									gridJsonStr="{rolesItem:["+gridJsonStr+"]}";
									//alert(gridJsonStr);
									//alert(resourceId);
								Ext.Msg.wait("请等候", "保存数据", "保存数据进行中...");				
								Ext.Ajax.request({
									url : 'system/resource!saveRoles',
									timeout : 60000,
									params : {
										extJson : resourceId,
										others :gridJsonStr
									},
									method : 'post',
									success : function(response) {
										var responseText = response.responseText;
										if (responseText.indexOf('topit_ext_id!') != 0) {
											Ext.Msg.alert('错误', (response.responseText));
										} else {
											Ext.Msg.alert('恭喜', "数据保存成功!", function() {								
												form.up('window').hide();
											});
										}
									},
									failure : function(response) {
										Ext.Msg.alert('错误', (response.responseText));
									}
								});
							}		
						}
			]
	})
	
</script>
