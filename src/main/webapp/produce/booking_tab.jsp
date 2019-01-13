<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="tab_workbench_booking.jsp"%>
<script>	
   tabs = Ext.widget('tabpanel', {
        flex:1,
        activeTab: 1,       
        items: [{
            title: '工位订单',
            layout:'fit',
            items:orders_grid,
            listeners: {
                activate: function(tab) {
                	Ext.apply(							
                		orders_ds.proxy.extraParams,{whereSql :' and techCardId='+cardId});
                	orders_ds.load();
                }
            }
        },{
        	 title: '办公室订单',
             items:roughRoll_grid,
            layout:'fit',
             listeners: {
                 activate: function(tab) {
                	 Ext.apply(							
                     		roll_ds.proxy.extraParams,{whereSql :' and rollType=1 and techCardId='+cardId});
                     	roll_ds.load();
                 }
             }
        }]
    });
</script>
