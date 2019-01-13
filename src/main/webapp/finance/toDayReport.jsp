<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>
		<%@ include file="../jspComm/extHeader.jsp"%>
	</head>
	<body>
		<script language="javascript">
Ext.QuickTips.init();
Ext.require( [ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*', 'Ext.state.*' ]);
Ext.onReady(function() {
	var dailyReport = '';//存放月报表json数据
	var consumeArea = '';//存放消费区域json数据
	var paymentType = '';//存放支付类型json数据
	Ext.Ajax.request( {
		url : "finance/toDayReport!getToDayReport",
		method : 'post',
		success : getDailyReport,
		params: {
	        date : new Date()
	    }
	});
	//获取日报表
	function getDailyReport(response) {
		var responseText = Ext.decode(response.responseText);
		dailyReport = responseText.records;
		Ext.Ajax.request( {
			url : "system/consumeArea!managerExt",
			method : 'post',
			success : getConsumeArea
		});
	}
	//获取消费区域
	function getConsumeArea(response) {
		var responseText = Ext.decode(response.responseText);
		consumeArea = responseText.records;
		Ext.Ajax.request( {
			url : "system/paymentType!managerExt",
			method : 'post',
			success : getPaymentType
		});
	}
	//获取支付类型
	function getPaymentType(response) {
		var responseText = Ext.decode(response.responseText);
		paymentType = responseText.records;
		var display = [ {
			header : "消费区域",
			dataIndex : "consumeAreaName",
			width : 130,
			align : 'center'
		}, {
			header : "支付方式",
			dataIndex : "paymentTypeName",
			width : 100,
			align : 'center'
		} ];
		var fields = [ 'consumeAreaName', 'paymentTypeName' ];
		for ( var i = 0; i < dailyReport.length; i++) {
			var s = false;
			for ( var j = 0; j < fields.length; j++) {
				if (dailyReport[i].consumerName == fields[j]) {
					s = true;
				};
			};
			if (s == false) {
				fields.push(dailyReport[i].consumerName, 'a' + dailyReport[i].consumerId,
						'total');
				display.push( {
					header : dailyReport[i].consumerName,
					dataIndex : 'a' + dailyReport[i].consumerId,
					width : 80,
					align : 'center'
				});
			};
		};
		display.push( {
			header : "合计",
			dataIndex : "total",
			width : 100,
			align : 'center'
		});

		//最终结果集
		var data = [];
		for ( var i = 0; i < consumeArea.length; i++) {
			for ( var j = 0; j < paymentType.length; j++) {
				data.push( {
					'consumeAreaName' : consumeArea[i].name,
					'paymentTypeName' : paymentType[j].name,
					'total' : 0
				});
			}
		};
		for ( var i = 0; i < paymentType.length; i++) {
			data.push( {
				'consumeAreaName' : '合计',
				'paymentTypeName' : paymentType[i].name,
				'total' : 0
			});
		}
		for ( var i = 0; i < dailyReport.length; i++) {
			var row = getRow(dailyReport[i].consumeAreaId, dailyReport[i].paymentTypeId);
			if(data[row]['a' + dailyReport[i].consumerId] == undefined){
				data[row]['a' + dailyReport[i].consumerId] = dailyReport[i].consumeAmount;
			}else{
				data[row]['a' + dailyReport[i].consumerId] += dailyReport[i].consumeAmount;
			}
			data[row].total += dailyReport[i].consumeAmount;
			for ( var j = data.length - paymentType.length; j < data.length; j++) {
				if (data[row].paymentTypeName == data[j].paymentTypeName) {
					if (data[j]['a' + dailyReport[i].consumerId] == undefined) {
						data[j]['a' + dailyReport[i].consumerId] = dailyReport[i].consumeAmount;
						data[j].total += dailyReport[i].consumeAmount;
					} else {
						data[j]['a' + dailyReport[i].consumerId] += dailyReport[i].consumeAmount;
						data[j].total += dailyReport[i].consumeAmount;
					};
				};
			};
		};
		var store = Ext.data.Store( {
			fields : fields,
			data : data
		});
		var grid = new Ext.grid.GridPanel( {
			style : "text-align:center",
			title : "入住（缴费）单位日报表",
			store : store,
			columns : display
		});
		Ext.create('Ext.Viewport', {
			layout : 'fit',
			items : grid
		});
	}
	//确定行数
	function getRow(consumeAreaId, paymentTypeId) {
		var areaRow = 0;
		var paymentTypeRow = 0;
		for ( var i = 0; i < consumeArea.length; i++) {
			if (consumeAreaId == consumeArea[i].id) {
				areaRow = i;
			};
		};
		for ( var i = 0; i < paymentType.length; i++) {
			if (paymentTypeId == paymentType[i].id) {
				paymentTypeRow = i;
			};
		};
		return (areaRow * paymentType.length + paymentTypeRow);
	};
});
</script>
	</body>
</html>
