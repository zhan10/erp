var serviceTypeArray = [
							['-1','服务类型' ],['1', '办公']
							,['2', '参观'],['3', '考察']
							,['4', '预览']
						];
var serviceTypeDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: serviceTypeArray, 
      autoLoad:true
 });