var requirementBookingStatusArray = [
							[1, '未处理']
							,[2, '处理完成']
						];
var requirementBookingStatusDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: requirementBookingStatusArray, 
      autoLoad:true
 });