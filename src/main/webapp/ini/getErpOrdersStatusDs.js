var erpOrdersStatusArray =[[0,'已删除'],[1,'待设计'],[2,'设计中'],[3,'财务审核'],[4,'复尺中'],[5,'财务二审'],[6,'待分配'],[7,'待审核-工厂财务']] ;
var erpOrdersStatusDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: erpOrdersStatusArray, 
      autoLoad:true
 });