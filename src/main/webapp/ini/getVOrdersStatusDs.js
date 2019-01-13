var vOrdersStatusArray =[[-1,'状态'],[0,'待支付'],[1,'已支付'],[2,'已生产'],[3,'配送中'],[4,'已取消'],[5,'已完成']] ;
var vOrdersStatusDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: vOrdersStatusArray, 
      autoLoad:true
 });