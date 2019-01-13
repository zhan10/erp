var vBookingListStateArray =[[1,'待登记'],[5,'已入驻']] ;
var vBookingListStateDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: vBookingListStateArray, 
      autoLoad:true
 });