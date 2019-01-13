var spicyDegreeArray =[[-1,'辣味程度'],[1,'不辣'],[2,'微辣'],[3,'中辣'],[4,'辣'],[5,'特辣']] ;
var spicyDegreeDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: spicyDegreeArray, 
      autoLoad:true
 });