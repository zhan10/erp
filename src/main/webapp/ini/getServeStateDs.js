var serveStateArray =[[-1,'订单状态'],[1,'待处理'],[2,'处理中'],[3,'已处理']] ;
var serveStateDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: serveStateArray, 
      autoLoad:true
 });