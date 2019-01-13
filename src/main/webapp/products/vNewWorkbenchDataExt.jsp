<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : 'type',dataIndex : 'type',name : 'type',width : 40,hidden : true}
		,{text : '<s:text name="vNewWorkbench.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vNewWorkbench.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:100}
		,{text : '<s:text name="vNewWorkbench.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vNewWorkbench.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:100}
		,{text : '<s:text name="vNewWorkbench.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="vNewWorkbench.quantity" />',dataIndex:'quantity',name:'quantity',align : 'center',width:100}
		,{text : '<s:text name="vNewWorkbench.price" />',dataIndex:'price',name:'price',align : 'center',width:100}
		,{text : '<s:text name="vNewWorkbench.deposit" />',dataIndex:'deposit',name:'deposit',align : 'center',width:100}
		,{text : '<s:text name="vNewWorkbench.payRatio" />',dataIndex:'payRatio',name:'payRatio',align : 'center',width:100}
		,{
			text : '<s:text name="vNewWorkbench.planePic" />',
			dataIndex:'planePic',
			name:'planePic',
			align : 'center',
			width:100,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('planePic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/newWorkbench/'+val+'">'+val+'</a>';
			}
		 }
		,{
			text : '<s:text name="vNewWorkbench.coverPic" />',
			dataIndex:'coverPic',
			name:'coverPic',
			align : 'center',
			width:100,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('coverPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/newWorkbench/'+val+'">'+val+'</a>';
			}
		 }
		,{text : '<s:text name="vNewWorkbench.intro" />',dataIndex:'intro',name:'intro',align : 'center',width:100,flex:1}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	},{
		xtype:'actioncolumn',
		locked:true,
		width:60,
		items:[ {
			icon:'img/toolbar/edit.gif',
			tooltip:'修改',
			handler : function(grid, rowIndex, colIndex) {
				//sm.select(rowIndex);
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
				Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
				cb_floors_ds.loadPage(1);
				if(rec.get('planePic')!=''&&rec.get('planePic')!=null){
					form.down('#fileShow1').setValue('<a target="_blank" href="pics/newWorkbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');//.setVisible(true);
				}else{
					form.down('#fileShow1').setValue('');
				}
				if(rec.get('coverPic')!=''&&rec.get('coverPic')!=null){
					form.down('#fileShow2').setValue('<a target="_blank" href="pics/newWorkbench/'+rec.get('coverPic')+'">'+rec.get('coverPic')+'</a>');//.setVisible(true);
				}else{
					form.down('#fileShow2').setValue('');
				}
				form.down('#uploadFile1').setVisible(true);
				form.down('#uploadFile2').setVisible(true);
				form.down('#delFileFlag1').setVisible(true);
				form.down('#delFileFlag0').setVisible(true);
				form.down('#fileShow1').setVisible(true);
				form.down('#fileShow2').setVisible(true);
				form.down('#editId').setValue(rec.get('floorName'));
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'products/newWorkbench!delete');
		}
	},{
		icon:'img/toolbar/search.gif',
		tooltip:'订单详情',
		handler : function(grid, rowIndex, colIndex) {
			//sm.select(rowIndex);
			var rec = grid.getStore().getAt(rowIndex);	
			bookingWin.show();
			bookingWin.setTitle("工位订单");
			Ext.apply(workbench_ds.proxy.extraParams,{whereSql :' and product_type=1 and product_id='+rec.get('id')});
			workbench_ds.load();
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);

</script>
