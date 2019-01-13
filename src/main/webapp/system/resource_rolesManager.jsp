<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="resource_rolesDefine.jsp"%>	
</head>
<body>
	<script language="javascript">
	var roleId;//选中角色id
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*', 'Ext.tree.*' ]);
		Ext.onReady(function() {
			//节点
			Ext.define('Node', {
			    extend: 'Ext.data.Model',
			    fields: [
			        {name: 'id',  type: 'long'},
			        {name:'name',type:'string'},			        
			        {name: 'text',   type: 'string', convert: function(v, record){
			        	return record.get('name');
			        }}
			       
			    ]
			});
			//书的Ds
			var tree_ds=new Ext.data.TreeStore({
				autoLoad:false,
				model: 'Node',
				proxy: {
                    type: 'ajax',
                    actionMethods : {
        				read : 'POST' // post方法解决中文参数乱码问题
        			},
        			url : '' ,        			
        			extraParams : {
        				baseSql : baseSql,
        				order : order
        			},
	                reader: {
	                	type:'json',
                        root: 'records'
                    }    			
                },
                root: {	                    
                    id: 0,
                    expanded: true
                }       		 	              
        	})
			//书面板 			
			var tree=Ext.create('Ext.tree.Panel',{
				height:'100%',
				margin : "5",
				rootVisible :false,
				flex:2,
				useArrows: true,
				store:tree_ds,
				buttons: [
					  { xtype: 'button', text: '修改',itemId : 'btnEdit',
							handler : function() {									
									this.hide();	
									tree.down('#btnSave').show();									
								}
							},{ xtype: 'button', text: '保存' ,itemId:'btnSave',hidden:true,
									handler : function() {
										var records = tree.getView().getChecked();
										names = [];	                   
								        Ext.Array.each(records, function(rec){
								            names.push(rec.get('id'));
								        });
								      	//alert(names.join(','));
								       	//Ext.Msg.wait("请等候", "保存数据", "保存数据进行中...");
								    	Ext.Ajax.request({
								    		url : 'system/resource!saveByRoles',
								    		timeout : 60000,
								    		params : {
								    			extJson : names.join(','),
								    			others : roleId
								    		},
								    		method : 'post',
								    		success : function(response) {
								    			var responseText = response.responseText;
								    			if (responseText.indexOf('topit_ext_id!') != 0) {
								    				Ext.Msg.alert('错误', (response.responseText));
								    			} else {
								    				Ext.Msg.alert('恭喜', "数据保存成功!");
								    			}
								    		},

								    		failure : function(response) {
								    			Ext.Msg.alert('错误', (response.responseText));
								    		}
								    	});								       
									}
							}]
			});		
			
			var roles_grid;			
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
			roles_ds.load();
			roles_grid= Ext.create('Ext.grid.Panel', {	
				flex:1,
				height:'100%',
				title:'角色列表',
				id : 'roles_grid',
				store : roles_ds,
				margin : "5",
				columns : rolesFields,
				columnLines : true,
				listeners: {
						'itemclick':function(grid,rec) {
							roleId=rec.data['id'];
							Ext.apply(tree_ds.proxy.extraParams,{rolesId :roleId});
							Ext.apply(tree_ds.proxy,{url:dsUrl});						
							tree_ds.load();
						}
				 }
				
			});
			
			
			var mainPanel=Ext.create('Ext.Panel',{
				title:'角色 － 资源分配',
				margin : "5",layout : 'hbox',
				items:[roles_grid,tree]
			});
			var viewport = Ext.create('Ext.Viewport', {
				layout : 'fit',
				items : mainPanel
			});	
		});
</script>
</body>
</html>
