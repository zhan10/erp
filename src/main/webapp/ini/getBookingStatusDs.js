var bookingStatusArray =[[-1,'订单状态'],[0,'待支付'],[1,'已支付'],[2,'已取消'],[3,'已审批'],[4,'已退回'],[5,'执行中'],[6,'待审批'],[8,'已结算']] ;
var bookingStatusDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: bookingStatusArray, 
      autoLoad:true
 });