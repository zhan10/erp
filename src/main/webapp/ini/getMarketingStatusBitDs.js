var marketingStatusBitArray =[[1,'有效'],[2,'无效']] ;
var marketingStatusBitDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: marketingStatusBitArray, 
      autoLoad:true
 });