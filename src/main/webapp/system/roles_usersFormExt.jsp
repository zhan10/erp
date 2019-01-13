<%@ page contentType="text/html;charset=UTF-8"%>
<script>
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
		title:'本用户角色',
		id : 'roles_grid',
		store : roles_ds,
		multiSelect: true,
		margin : "5",
		columns : rolesFields,height: 400,
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
		title:'所有角色',
		id : 'select_roles_grid',
		store : select_roles_ds,
		multiSelect: true,
		margin : "5",
		columns : rolesFields,
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
				 select_roles_ds.remove(rec);
				roles_ds.insert(0,rec);	 
				}
         }
	});
	form = Ext.widget('form', {
		id : 'form',
		autoScroll : true,
		overflowX : 'scroll',
		overflowY : 'scroll',
		frame : true,
		layout : {
			type : 'vbox',
			align : 'stretch'
		},
		border : false,
		bodyPadding : 10,
		defaultType : 'textfield',
		fieldDefaults : {
			labelAlign : 'right',
			labelWidth : 80
		},
		defaults : {
			margins : '0 0 10 0'
		},
		items : [
			{itemId:'id',name:'id',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'code',itemId:'code',
						fieldLabel:'<s:text name="users.code"/>',readOnly:true
					},{
						flex:1,
						name:'name',itemId:'name',
						fieldLabel:'<s:text name="users.name"/>',readOnly:true
					}
					
				]
			},{
				xtype : 'container',
				layout : {type:'hbox', align: 'middle'},width:50,			
				items : [roles_grid,{itemId:'btnMove',xtype : 'container',//height:400,
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
				}]},select_roles_grid]}
		],
		buttons : [ {
			text : '保存',
			id : 'btnSave',
			handler : function() {				
				var gridJsonStr = "";
				for (var i = 0; i < roles_ds.getCount(); i++) {						
					gridJsonStr += "{id:"+roles_ds.getAt(i).data['id']+"}";
					if (i < roles_ds.getCount() - 1)
						gridJsonStr += ",";					
				}				
				if(!gridJsonStr=="")
					gridJsonStr="{rolesItem:["+gridJsonStr+"]}";							
				Ext.Msg.wait("请等候", "保存数据", "保存数据进行中...");				
				Ext.Ajax.request({
					url : 'system/roles!saveByUsers',
					timeout : 60000,
					params : {
						extJson : form.down('#id').value,
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
		}, {
				text : '关闭',
				id : 'btnClose',
				handler : function() {
					this.up('window').hide();
				}
			} ]
			});
</script>
