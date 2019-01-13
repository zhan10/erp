var dateArray =[[1,'小时'],[2,'天'],[3,'月']] ;
var dateDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: dateArray, 
      autoLoad:true
 });