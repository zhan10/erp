var reportYearArray = [
							['-1','年' ],['2015', '2015']
							,['2016', '2016'],['2017', '2017']
							,['2018', '2018'],['2019', '2019']
							,['2020', '2020'],['2021', '2021']
						];
var reportYearDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: reportYearArray, 
      autoLoad:true
 });