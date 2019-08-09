<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	Ext.define('ErpType', {
	    extend: 'Ext.data.Model',
	    fields: [
	        {name: 'id'},
	        {name: 'name'}
	    ]
	});
	var cb_erpType_ds =new Ext.data.Store({
			autoLoad:true,//必须自动加载以保证根据ID选中初始值
			pageSize:9999,
			model:'ErpType',
			proxy : {
				type : 'ajax',
				actionMethods : {
					read : 'POST' // post方法解决中文参数乱码问题
				},
				url : 'resolve/erpType!managerExt',				
				extraParams : {
					baseSql : '',
					order : 'order by name'
				},
				reader : {
					type : 'json',
					totalProperty: 'sum',
					root : 'records'
				}
			}
		});	
</script>
