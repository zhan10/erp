var marketingTypeArray =[[1,'打折'],[2,'立减']] ;
var marketingTypeDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: marketingTypeArray, 
      autoLoad:true
 });