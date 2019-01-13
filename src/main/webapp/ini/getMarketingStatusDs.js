var marketingStatusArray =[[1,'待开始'],[2,'进行中'],[3,'暂停中'],[4,'已过期']] ;
var marketingStatusDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: marketingStatusArray, 
      autoLoad:true
 });