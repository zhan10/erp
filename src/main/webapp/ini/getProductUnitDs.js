var productArray =[[0,'时'],[1,'天'],[2,'周'],[3,'月'],[4,'季度'],[5,'年']] ;
var productDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: productArray, 
      autoLoad:true
 });