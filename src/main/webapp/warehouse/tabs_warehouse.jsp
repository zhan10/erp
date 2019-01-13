<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="tabs_warehouse_site.jsp"%>
<script>	
   tabs = Ext.widget('tabpanel', {
        flex:1,     
        items: [{
        	title: '库位',
            items:warehouseSite_grid,
            layout:'fit',
        }]
    });
</script>
