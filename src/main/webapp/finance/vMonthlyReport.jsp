<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="../jspComm/extHeader.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*',
						'Ext.state.*' ]);
		Ext.onReady(function() {
					var monthlyReport = [];//存放月报表json数据
					var consumeArea = '';//存放消费区域json数据
					var paymentType = '';//存放支付类型json数据
					var reportDate = {};//存放参数
					//获取地址栏参数
					getparam();
					Ext.Ajax.request({
						url : "finance/vMonthlyReport!managerExt",
						method : 'post',
						success : getMonthlyReport
					});
					//获取月报表
					function getMonthlyReport(response) {
						var responseText = Ext.decode(response.responseText);
						var records = responseText.records;
						for (var i = 0; i < records.length; i++) {
							if (records[i].reportYear == reportDate.reportYear
									&& records[i].reportMonth == reportDate.reportMonth) {
								monthlyReport.push(records[i]);
							}
						}
						;
						Ext.Ajax.request({
							url : "finance/consumeArea!managerExt",
							method : 'post',
							success : getConsumeArea
						});
					}
					;
					//获取区域
					function getConsumeArea(response) {
						var responseText = Ext.decode(response.responseText);
						consumeArea = responseText.records;
						Ext.Ajax.request({
							url : "finance/paymentType!managerExt",
							method : 'post',
							success : getPaymentType
						});
					}
					;
					//获取支付方式
					function getPaymentType(response) {
						var responseText = Ext.decode(response.responseText);
						paymentType = responseText.records;
						var fields = [ 'consumeAreaName', 'paymentTypeName',
								't1', 't2', 't3', 't4', 't5', 't6', 't7', 't8',
								't9', 't10', 't11', 't12', 't13', 't14', 't15',
								't16', 't17', 't18', 't19', 't20', 't21',
								't22', 't23', 't24', 't25', 't26', 't27',
								't28', 't29', 't30', 't31', 'total' ];
						var columns = [ {
							header : "区域",
							dataIndex : "consumeAreaName",
							width : 130,
							align : 'center'
						}, {
							header : "支付方式",
							dataIndex : "paymentTypeName",
							width : 100,
							align : 'center'
						} ];
						for (var i = 2; i < fields.length - 1; i++) {
							columns.push({
								header : i - 1 + "",
								dataIndex : fields[i],
								width : 80,
								align : 'center'
							});

						}
						;
						columns.push({
							header : "合计",
							dataIndex : "total",
							width : 80,
							align : 'center'
						});
						//data1是最终结果集
						var data1 = [];
						//固定页面的行
						for (var i = 0; i < consumeArea.length; i++) {
							for (var j = 0; j < paymentType.length; j++) {
								data1.push({
									'consumeAreaName' : consumeArea[i].name,
									'paymentTypeName' : paymentType[j].name,
									'total' : 0
								});
							}
						}
						;
						//行合计
						for (var i = 0; i < paymentType.length; i++) {
							data1.push({
								'consumeAreaName' : '合计',
								'paymentTypeName' : paymentType[i].name,
								'total' : 0
							});
						}
						;
						for (var i = 0; i < monthlyReport.length; i++) {
							for (var j = 2; j < fields.length - 1; j++) {
								var row = getRow(
										monthlyReport[i].consumeAreaId,
										monthlyReport[i].paymentTypeId);
								data1[row][fields[j]] = monthlyReport[i][fields[j]];
								data1[row].total += monthlyReport[i][fields[j]];
								for (var n = consumeArea.length
										* paymentType.length; n < data1.length; n++) {
									if (data1[row].paymentTypeName == data1[n].paymentTypeName) {
										if (data1[n][fields[j]] == undefined) {
											data1[n][fields[j]] = monthlyReport[i][fields[j]];
											data1[n].total += monthlyReport[i][fields[j]];
										} else {
											data1[n][fields[j]] += monthlyReport[i][fields[j]];
											data1[n].total += monthlyReport[i][fields[j]];
										}
									}
								}
							}

						}
						;
						ds = ({
							data : data1,
							fields : fields
						});
						var grid = new Ext.grid.GridPanel({
							style : "text-align:center",
							title : "营业收入日报表",
							store : ds,
							columns : columns
						});
						var viewport = Ext.create('Ext.Viewport', {
							layout : 'fit',
							items : grid
						});
					}
					;
					//确定行数
					function getRow(consumeAreaId, paymentTypeId) {
						var areaRow = 0;
						var paymentTypeRow = 0;
						for (var i = 0; i < consumeArea.length; i++) {
							if (consumeAreaId == consumeArea[i].id) {
								areaRow = i;
							}
						}
						for (var i = 0; i < paymentType.length; i++) {
							if (paymentTypeId == paymentType[i].id) {
								paymentTypeRow = i;
							}
						}
						return (areaRow * paymentType.length + paymentTypeRow);
					}
					;
					//获取参数
					function getparam() {
						var query = location.search.substring(1);
						var values = query.split("&");
						for (var i = 0; i < values.length; i++) {
							var pos = values[i].indexOf('=');
							if (pos == -1)
								continue;
							var paramname = values[i].substring(0, pos);
							var value = values[i].substring(pos + 1);
							reportDate[paramname] = value;
						}
					}
					;
				});
	</script>
</body>
</html>
