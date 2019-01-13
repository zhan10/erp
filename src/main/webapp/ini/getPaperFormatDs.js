var paperFormatArray =[[-1,'纸张格式'],['A3','A3'],['A4','A4'],['B4','B4'],['B5','B5'],['Letter','信封']] ;
var paperFormatDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: paperFormatArray, 
      autoLoad:true
 });