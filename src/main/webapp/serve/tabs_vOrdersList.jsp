<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="tab_vOrdersList.jsp"%>
<script>	
   tabs = Ext.widget('tabpanel', {
        flex:1,
        activeTab: 1,       
        items: [{
            title: '订单细项',
            layout:'fit',
            items:vOrdersList_grid,
            listeners: {
                activate: function(tab) {
                	Ext.apply(							
                			vOrdersList_ds.proxy.extraParams,{whereSql :' and consumerId='+consumerId+' and code='+code});
                	vOrdersList_ds.load();
                }
            }
        }]
    });
</script>
