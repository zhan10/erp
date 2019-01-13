<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="tab_workbench_booking.jsp"%>
<%@ include file="tab_office_booking.jsp"%>
<%@ include file="tab_meeting_room_booking.jsp"%>
<%@ include file="tab_exhibition_room_booking.jsp"%>
<%@ include file="tab_tel_room_booking.jsp"%>
<%@ include file="tab_vip_room_booking.jsp"%>
<script>	
   tabs = Ext.widget('tabpanel', {
        flex:1,
        //activeTab: 1,       
        items: [{
            title: '工位',
            layout:'fit',
            items:workbench_grid,
            listeners: {
                activate: function(tab) {
                	Ext.apply(							
                		workbench_ds.proxy.extraParams,{whereSql :' and bookingId=+bookingId'});
                	//workbench_ds.load();        
                }
            }
        },{
        	 title: '办公室',
             items:office_grid,
            layout:'fit',
             listeners: {
                 activate: function(tab) {
                	 Ext.apply(							
                     		office_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
                     	//office_ds.load();
                 }
             }
        },{
        	 title: '会议室',
             items:meetingRoom_grid,
            layout:'fit',
             listeners: {
                 activate: function(tab) {
                	 Ext.apply(							
                     		meetingRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
                     	//meetingRoom_ds.load();
                 }
             }
        },{
        	 title: '展厅',
             items:exhibitionRoom_grid,
            layout:'fit',
             listeners: {
                 activate: function(tab) {
                	 Ext.apply(							
                     		exhibitionRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
                     	//exhibitionRoom_ds.load();
                 }
             }
        },{
        	 title: '网真会议室',
             items:telRoom_grid,
            layout:'fit',
             listeners: {
                 activate: function(tab) {
                	 Ext.apply(							
                     		telRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
                     	//telRoom_ds.load();
                 }
             }
        },{
        	 title: 'VIP接待室',
             items:vipRoom_grid,
            layout:'fit',
             listeners: {
                 activate: function(tab) {
                	 Ext.apply(							
                     		vipRoom_ds.proxy.extraParams,{whereSql :' and bookingId='+bookingId});
                     	//vipRoom_ds.load();
                 }
             }
        }]
    });
</script>
