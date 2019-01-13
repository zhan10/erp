<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="tab_health.jsp"%>
<script>	
   tabs = Ext.widget('tabpanel', {
        flex:1,
        activeTab: 1,       
        items: [{
            title: '历史详情',
            layout:'fit',
            items:health_grid,
            listeners: {
                activate: function(tab) {
                	Ext.apply(							
                			health_ds.proxy.extraParams,{whereSql :' and userId='+userId});
                	health_ds.load();
                }
            }
        }]
    });
</script>
