<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vVisit.cityName" />',dataIndex:'cityName',name:'cityName',align : 'center',width:120,hidden:true}
		,{text : '<s:text name="vVisit.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:120}
		,{text : '<s:text name="vVisit.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:120}
		,{text : '<s:text name="vVisit.visitType" />',dataIndex:'visitType',name:'visitType',align : 'center',width:120}
		,{text : '<s:text name="vVisit.visitNumber" />',dataIndex:'visitNumber',name:'visitNumber',align : 'center',width:120}
		,{text : '<s:text name="vVisit.custom" />',dataIndex:'custom',name:'custom',align : 'center',width:120}
		,{text : '<s:text name="vVisit.phone" />',dataIndex:'phone',name:'phone',align : 'center',width:120}
		,{
			text : '<s:text name="vVisit.ordertime" />',
			dataIndex:'ordertime',
			name:'ordertime',
			align : 'center',
			//convert : convertDate
			convert : function(val){
				//var date = new Date(val);
				if(val == null){
					return val;
				}else{
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, 0);
				return Ext.Date.format(date,'Y-m-d H:i:s');
				}
			},
			flex:1
		  }
		,{text : '<s:text name="vVisit.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vVisit.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vVisit.cityId" />',dataIndex:'cityId',name:'cityId',align : 'center',width:100,hidden:true}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	},{
		xtype:'actioncolumn',
		locked:true,
		width:50,
		items:[ {
			icon:'img/toolbar/post_go.gif',
			tooltip:'发送短信',
			handler : function(grid, rowIndex, colIndex) {
				//sm.select(rowIndex);
				var rec = grid.getStore().getAt(rowIndex);	
				sendWinByRec(smsWin, winTitle+'——发送短信', rec);
				Ext.Ajax.request({
					url : 'visit/visitService!managerExt',
					timeout : 60000,
					method : 'post',
					async: false,
					success : function(response) {
						var responseText = response.responseText;
						var obj = eval( "(" + responseText + ")" );//这就话的功能就是让我们可以得到json内部对象数据、
						sendSmsForm.down('#serviceTel').setValue(obj.records[0].servicetel);
						sendSmsForm.down('#serviceName').setValue(obj.records[0].servicename);
					}
				});
				var date = sendSmsForm.down('#ordertime').getValue();
				var cityName = sendSmsForm.down('#cityName').getValue();
				var buildingName = sendSmsForm.down('#buildingName').getValue();
				var floorName = sendSmsForm.down('#floorName').getValue();
				var visitType = sendSmsForm.down('#visitType').getValue();
				var address = cityName+buildingName+floorName+"F"+visitType;
				
				var serviceTel = sendSmsForm.down('#serviceTel').getValue();
				var serviceName = sendSmsForm.down('#serviceName').getValue();
				//尊敬的客户，您已成功预约参观 ${address}，预约时间为：${date}，我们将静候尊驾莅临。如您行程临时有变，请提前告知 ${city}平台 ${information}。
				var str = "尊敬的客户，您已成功预约参观 "+address+"，预约时间为："+date+"，我们将静候尊驾莅临。如您行程临时有变，请提前告知 "+cityName+"平台 "+serviceName+",电话"+serviceTel+"。";
				sendSmsForm.down('#smsContext').setValue(str);
				sendSmsForm.down('#address').setValue(address);
				sendSmsForm.down('#information').setValue(serviceName+"，电话"+serviceTel);
			}
		}/* ,{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'visit/visit!delete');
		}
	} */]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
