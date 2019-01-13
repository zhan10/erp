<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vNewOffice.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:100}
		,{text : '<s:text name="vNewOffice.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:100}
		,{text : '<s:text name="vNewOffice.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="vNewOffice.numbering" />',dataIndex:'numbering',name:'numbering',align : 'center',width:100}
		,{text : '<s:text name="vNewOffice.workbenchNumber" />',dataIndex:'workbenchNumber',name:'workbenchNumber',align : 'center',width:100}
		,{text : '<s:text name="vNewOffice.price" />',dataIndex:'price',name:'price',align : 'center',width:100}
		,{text : '<s:text name="vNewOffice.deposit" />',dataIndex:'deposit',name:'deposit',align : 'center',width:100}
		,{text : '<s:text name="vNewOffice.payRatio" />',dataIndex:'payRatio',name:'payRatio',align : 'center',width:100}
		,{
			text : '<s:text name="vNewOffice.planePic" />',
			dataIndex:'planePic',
			name:'planePic',
			align : 'center',
			width:100,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('planePic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/newOffice/'+val+'">'+val+'</a>';
			}
		 }
		,{
			text : '<s:text name="vNewOffice.coverPic" />',
			dataIndex:'coverPic',
			name:'coverPic',
			align : 'center',
			width:100,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('coverPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/newOffice/'+val+'">'+val+'</a>';
			}
		 }
		,{text : '<s:text name="vNewOffice.intro" />',dataIndex:'intro',name:'intro',align : 'center',width:100}
		,{text : '<s:text name="vNewOffice.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vNewOffice.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
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
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'products/newOffice!delete');
		}
	},{
		icon:'img/toolbar/search.gif',
		tooltip:'订单详情',
		handler : function(grid, rowIndex, colIndex) {
			//sm.select(rowIndex);
			var rec = grid.getStore().getAt(rowIndex);	
			bookingWin.show();
			bookingWin.setTitle("办公室订单");
			Ext.apply(office_ds.proxy.extraParams,{whereSql :' and product_type=2 and product_id='+rec.get('id')});
			office_ds.load();
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
