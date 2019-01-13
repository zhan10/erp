var printFormatArray =[[-1,'打印格式'],['N','黑白'],['Y','彩色']] ;
var printFormatDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: printFormatArray, 
      autoLoad:true
 });