<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vWorkbench.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:100}
		,{text : '<s:text name="vWorkbench.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:100}
		,{text : '<s:text name="vWorkbench.workbenchType" />',dataIndex:'workbenchType',align : 'center',width : 100,name:'workbenchType'}
		,{text : '<s:text name="vWorkbench.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="workbenchType.acreage" />',dataIndex:'acreage',width : 100,align : 'center',name:'acreage'}		
		,{text : '<s:text name="workbenchType.price" />',dataIndex:'price',width : 100,align : 'center',name:'price'}		
		,{
			text : '<s:text name="officeType.unit" />',
			dataIndex:'unit',
			name:'unit',
			align : 'center',
			width:100,
			renderer:function(val){
				if(val==2)
					return "元/平米/天";
				else{
					return "元/平米/月";
				}
			}
		}
		,{text : '<s:text name="workbenchType.deposit" />',dataIndex:'deposit',name:'deposit',align : 'center',width:100}
		//,{text : '<s:text name="vWorkbench.orientation" />',dataIndex:'orientation',name:'orientation',align : 'center',width:100}
		//,{text : '<s:text name="vWorkbench.area" />',dataIndex:'area',name:'area',align : 'center',width:100}
		,{text : '<s:text name="vWorkbench.bigPic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('bigPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/workbench/'+val+'">'+val+'</a>';
		} }
		/* ,{text : '<s:text name="vWorkbench.leftPic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('leftPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/workbench/'+val+'">'+val+'</a>';
		} }
		,{text : '<s:text name="vWorkbench.midPic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('midPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/workbench/'+val+'">'+val+'</a>';
		} }
		,{text : '<s:text name="vWorkbench.rightPic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('rightPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/workbench/'+val+'">'+val+'</a>';
		} }*/
		,{text : '<s:text name="vWorkbench.planePic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('planePic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/workbench/'+val+'">'+val+'</a>';
		} }
		/* ,{text : '<s:text name="vWorkbench.pic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
			   var val= record.get('pic');  
			   return  val==''||val==null?'':'<a target="_blank" href="pics/workbench/'+val+'">'+val+'</a>';
		 } }, */
		 ,{
				text : '<s:text name="vWorkbench.equipment" />',
				dataIndex:'equipment',
				width : 100,
				align : 'center',
				name:'equipment',
				renderer:function(val){
					try {
						var array = val.split(',');
						var str="";
						var ret="";
						for(var i=0;i<array.length;i++){
							var a=parseInt(array[i]);
							str =cb_roomFacilities_ds.findRecord('id',a).get('facilities');
							if(i!=array.length-1){
								ret+=(str+",");
							}else{
								ret+=(str);
							}	
						}	
						return ret;
					} catch (e) {
					}
				} 
			},
		{text : '<s:text name="vWorkbench.pic" />',dataIndex:'pic',name:'pic',hidden:true},	
		{text : '<s:text name="vWorkbench.bigPic" />',dataIndex:'bigPic',name:'bigPic',hidden:true},
		{text : '<s:text name="vWorkbench.leftPic" />',dataIndex:'leftPic',name:'leftPic',hidden:true},
		{text : '<s:text name="vWorkbench.midPic" />',dataIndex:'midPic',name:'midPic',hidden:true},
		{text : '<s:text name="vWorkbench.rightPic" />',dataIndex:'rightPic',name:'rightPic',hidden:true},
		{text : '<s:text name="vWorkbench.planePic" />',dataIndex:'planePic',name:'planePic',hidden:true}
		,{text : '<s:text name="vWorkbench.intro" />',dataIndex:'intro',name:'intro',align : 'center',flex:1}
		,{text : '<s:text name="vWorkbench.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vWorkbench.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vWorkbench.cityId" />',dataIndex:'cityId',name:'cityId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vWorkbench.areaId" />',dataIndex:'areaId',name:'areaId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vWorkbench.typeId" />',dataIndex:'typeId',name:'typeId',align : 'center',width:100,hidden:true}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	},{
		xtype:'actioncolumn',
		locked:true,
		width:50,
		items:[ {
			icon:'img/toolbar/edit.gif',
			tooltip:'修改',
			handler : function(grid, rowIndex, colIndex) {
				//sm.select(rowIndex);
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
				setEquipment();
				if(rec.get('pic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/workbench/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');
				}else{
						form.down('#fileShow').setValue('');
				}
				form.down('#uploadFile').setVisible(true);
				/*
				form.down('#uploadFile1').setVisible(true);
				form.down('#uploadFile2').setVisible(true);
				form.down('#uploadFile3').setVisible(true);
				form.down('#uploadFile4').setVisible(true);
				form.down('#uploadFile5').setVisible(true);
				form.down('#delFileFlag').setVisible(true);	
				form.down('#fileShow').setVisible(true);
				*/
				form.down('#fileShow').hideLabel=true;
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'product/workbench!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
