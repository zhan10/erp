<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="resourceDefine.jsp"%>	
	<%@ include file="resource_roles_panel.jsp"%>	
</head>
<body>
	<script language="javascript">
	var resourceId;//选中树节点id
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*', 'Ext.tree.*' ]);
		Ext.onReady(function() {
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
			var tree=Ext.create('Ext.tree.Panel',{
				height:'100%',
				margin : "5",
				rootVisible :false,
				flex:1,
				useArrows: true,
				store:new Ext.data.TreeStore({
					model: 'Node',
					proxy: {
	                    type: 'ajax',
	                    actionMethods : {
	        				read : 'POST' // post方法解决中文参数乱码问题
	        			},
	        			url : dsUrl ,
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
	                },autoLoad:false       		 	              
            	})
			});
			tree.on("itemclick",function(view,record,item,index,e){
				//alert(record.get('id'));
   				//alert(record.raw.name);
   				resourceId=record.get('id');
   				Ext.apply(roles_ds.proxy.extraParams,{whereSql : ' and id in (select a.roleId from RoleResource a where a.resourceId='+resourceId+')'});
     			roles_ds.load();
     			roles_grid.setTitle(record.raw.name+'->角色');
     			Ext.apply(select_roles_ds.proxy.extraParams,{whereSql : ' and id not in (select a.roleId from RoleResource a where a.resourceId='+resourceId+')'});
     			select_roles_ds.load();
			});
			var mainPanel=Ext.create('Ext.Panel',{
				title:'资源分配',
				margin : "5",layout : 'hbox',
				items:[tree,rolesPanel]
			});
			var viewport = Ext.create('Ext.Viewport', {
				layout : 'fit',
				items : mainPanel
			});	
		});
</script>
</body>
</html>
