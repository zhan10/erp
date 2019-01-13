<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="../jspComm/extHeader.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			//data1是最终结果集
			var data = "";
			var fields = [ 'consumeAreaName', 'paymentTypeName','t1' ];
			var columns = [
				{header : "区域",dataIndex : "consumeAreaName",width : 130,align : 'center'}, 
			    {header : "支付方式",dataIndex : "paymentTypeName",width : 100,align : 'center'},
			    {header : "支付方式",dataIndex : "t1",width : 100,align : 'center'}
			];
			Ext.Ajax.request({
				url : "finance/theMonthReport!getTheMonthReport",
				method : 'post',
				async: false,  //ASYNC 是否异步( TRUE 异步 , FALSE 同步)
				params: {
			        date : new Date()
			    },
			    success : function(){
					data=[{consumeAreaName:"123",paymentTypeName:"ss",t1:"1"}];
				}
			});	
			
			var grid = new Ext.grid.GridPanel({
				style : "text-align:center",
				title : "营业收入日报表",
				store :{
					data : data,
					fields : fields
				},
				columns : columns
			});
			var viewport = Ext.create('Ext.Viewport', {
				layout : 'fit',
				items : grid
			});
		});
	</script>
</body>
</html>
