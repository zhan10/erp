<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	var cb_mateType_ds =new Ext.data.Store({
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
      		  }, {
		            name: 'grade',
		            mapping: function(raw) {
		               return raw[2];
           			 }
      		  }, {
		            name: 'parentid',
		            mapping: function(raw) {
		               return raw[3];
           			 }
      		  }],
			proxy : {
				type : 'ajax',
				actionMethods : {
					read : 'POST' // post方法解决中文参数乱码问题
				},
				url : 'mater/mateType!getMateTypeComboBox',				
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
