var chargeTypesArray =[[-1,'计费类型'],['N','张'],['Y','页']] ;
var chargeTypesDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: chargeTypesArray, 
      autoLoad:true
 });