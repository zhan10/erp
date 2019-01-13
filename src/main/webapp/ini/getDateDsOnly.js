var dateArray =[[2,'元/平米/天'],[3,'元/平米/月']] ;
var dateDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: dateArray, 
      autoLoad:true
 });