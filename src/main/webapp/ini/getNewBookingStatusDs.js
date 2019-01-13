var bookingStatusArray =[[-1,'订单状态'],[0,'未支付'],[1,'已支付']] ;
var bookingStatusDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: bookingStatusArray, 
      autoLoad:true
 });