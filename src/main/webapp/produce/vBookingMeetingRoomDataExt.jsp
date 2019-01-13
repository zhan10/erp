<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vBookingMeetingRoom.balance" />',dataIndex:'balance',name:'balance',align : 'center',width:100,renderer : function(val) {            
           return val?'<span style="color:red">已结算</span>':'<span style="color:blue">未结算</font>';
        }}
		,{text : '<s:text name="vBookingMeetingRoom.code" />',dataIndex:'code',name:'code',align : 'center',width:150}
		,{text : '<s:text name="vBookingMeetingRoom.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:100}
		,{text : '<s:text name="vBookingMeetingRoom.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:100}
		,{text : '<s:text name="vBookingMeetingRoom.meetingRoomName" />',dataIndex:'meetingRoomName',name:'meetingRoomName',align : 'center',width:100}
		,{text : '<s:text name="vBookingMeetingRoom.dateFrom" />',dataIndex:'dateFrom',name:'dateFrom',align : 'center',width:150,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="vBookingMeetingRoom.dateTo" />',dataIndex:'dateTo',name:'dateTo',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="vBookingMeetingRoom.total" />',dataIndex:'total',name:'total',align : 'center',width:100}
		,{text : '<s:text name="vBookingMeetingRoom.price" />',dataIndex:'price',name:'price',align : 'center',width:100}
		,{text : '<s:text name="vBookingMeetingRoom.consumerName" />',dataIndex:'consumerName',name:'consumerName',align : 'center',width:100}
		,{text : '<s:text name="vBookingMeetingRoom.balanceTime" />',dataIndex:'balanceTime',name:'balanceTime',align : 'center',width:150, convert : function(val){
		return val==null?'':val.replace('\T',' ');}}
		,{text : '<s:text name="vBookingMeetingRoom.balancePrice" />',dataIndex:'balancePrice',name:'balancePrice',align : 'center',width:100}
	,{text : '<s:text name="vBookingMeetingRoom.cityName" />',dataIndex:'cityName',name:'cityName',align : 'center',width:100}
		,{text : '<s:text name="vBookingMeetingRoom.areaName" />',dataIndex:'areaName',name:'areaName',align : 'center',width:100}
		,{text : '<s:text name="vBookingMeetingRoom.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBookingMeetingRoom.meetingRoomId" />',dataIndex:'meetingRoomId',name:'meetingRoomId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBookingMeetingRoom.consumerId" />',dataIndex:'consumerId',name:'consumerId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBookingMeetingRoom.bookingId" />',dataIndex:'bookingId',name:'bookingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBookingMeetingRoom.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBookingMeetingRoom.areaId" />',dataIndex:'areaId',name:'areaId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBookingMeetingRoom.cityId" />',dataIndex:'cityId',name:'cityId',align : 'center',width:100,hidden:true}
	,{text : '<s:text name="vBookingMeetingRoom.consumerFund" />',dataIndex:'consumerFund',name:'consumerFund',align : 'center',width:100,hidden:true}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	} ,{
		xtype:'actioncolumn',
		locked:true,
		width:50,
		items:[ {
			icon:'img/toolbar/edit.gif',
			tooltip:'修改',
			handler : function(grid, rowIndex, colIndex) {
				//sm.select(rowIndex);
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'produce/meetingRoomBooking!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
