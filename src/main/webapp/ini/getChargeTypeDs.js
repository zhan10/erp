var chargeTypeArray =[[1,'时间'],[2,'数量']] ;
var chargeTypeDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: chargeTypeArray, 
      autoLoad:true
 });