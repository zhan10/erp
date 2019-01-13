var orderVisitArray =[[0,'已预约'],[1,'已确定'],[2,'参观中'],[3,'已过期'],[4,'已完成']] ;
var orderVisitDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: orderVisitArray, 
      autoLoad:true
 });