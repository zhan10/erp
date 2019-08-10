<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	var cb_mater_ds =new Ext.data.Store({
			autoLoad:true,//必须自动加载以保证根据ID选中初始值
			pageSize:9999,
			fields: [{
            	name: 'id',
           		mapping: function(raw) {
                      return raw[0];
           		 }
        		}, {
		            name: 'name',
		            mapping: function(raw) {
		               return raw[1];
           			 }
      		  },{
      			  name:'atct',
	            	mapping: function(raw) {
		               return raw[2];
           			 }
      		  }],
			proxy : {
				type : 'ajax',
				actionMethods : {
					read : 'POST' // post方法解决中文参数乱码问题
				},
				url : 'mater/mater!getMaterComboBox',				
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
