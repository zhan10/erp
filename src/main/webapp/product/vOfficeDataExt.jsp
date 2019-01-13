<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vOffice.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:100}
		,{text : '<s:text name="vOffice.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:100}
		,{text : '<s:text name="vOffice.officeType" />',align : 'center',dataIndex:'officeType',width : 100,name:'officeType'}
		,{text : '<s:text name="vOffice.name" />',dataIndex:'name',name:'name',align : 'center',width:100},
		/*,{text : '<s:text name="vOffice.orientation" />',dataIndex:'orientation',name:'orientation',align : 'center',width:100}
		,{text : '<s:text name="vOffice.area" />',dataIndex:'area',name:'area',align : 'center',width:100}*/	
		/* ,{text : '<s:text name="vOffice.persons" />',dataIndex:'persons',name:'persons',align : 'center',width:100}
		,{
				text : '<s:text name="vOffice.equipment" />',
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
			}, */
		{text : '<s:text name="vOffice.pic" />',dataIndex:'pic',name:'pic',hidden:true},
		{text : '<s:text name="vWorkbench.bigPic" />',dataIndex:'bigPic',name:'bigPic',hidden:true},
		{text : '<s:text name="vWorkbench.leftPic" />',dataIndex:'leftPic',name:'leftPic',hidden:true},
		{text : '<s:text name="vWorkbench.midPic" />',dataIndex:'midPic',name:'midPic',hidden:true},
		{text : '<s:text name="vWorkbench.rightPic" />',dataIndex:'rightPic',name:'rightPic',hidden:true},
		{text : '<s:text name="vWorkbench.planePic" />',dataIndex:'planePic',name:'planePic',hidden:true},
		{text : '<s:text name="vOffice.proportion" />',align : 'center',dataIndex:'proportion',width : 100,name:'proportion',hidden:true},
		{text : '<s:text name="vOffice.priceAll" />',align : 'center',dataIndex:'priceAll',width : 100,name:'priceAll',hidden:true}
		/*,{text : '<s:text name="vOffice.orientation" />',dataIndex:'orientation',name:'orientation',align : 'center',width:100}
		,{text : '<s:text name="vOffice.area" />',dataIndex:'area',name:'area',align : 'center',width:100}*/
		,{text : '<s:text name="vWorkbench.orientation" />',dataIndex:'orientation',name:'orientation',align : 'center',width:100}
		,{text : '<s:text name="officeType.price" />',dataIndex:'price',width : 100,align : 'center',name:'price'}	
		,{
			text : '<s:text name="officeType.unit" />',
			dataIndex:'unit',
			name:'unit',
			align : 'center',
			width:100,
			renderer:function(val){
				if(val==3)
					return "月";
				if(val==2)
					return "天";
			}
		}
		,{text : '<s:text name="vOffice.acreage" />',dataIndex:'acreage',width : 100,align : 'center',name:'acreage'}
		,{text : '<s:text name="officeType.priceAll" />',dataIndex:'AllPrice',width : 100,align : 'center',name:'AllPrice',convert:function(val,record){
			var price = record.data.price;
			var acreage=record.data.acreage;
			val=price*acreage;
			return val;
		}}
		,{text : '<s:text name="workbenchType.deposit" />',dataIndex:'deposit',name:'deposit',align : 'center',width:100}
		,{text : '<s:text name="officeType.proportion" />',dataIndex:'proportion',width : 100,align : 'center',name:'proportion',hidden:true}
		,{text : '<s:text name="officeType.priceAll" />',dataIndex:'priceAll',width : 100,align : 'center',name:'priceAll',hidden:true}
		,{text : '<s:text name="vOffice.persons" />',dataIndex:'persons',name:'persons',align : 'center',width:100}
		,{
			text : '<s:text name="vOffice.equipment" />',
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
		}
		,{text : '<s:text name="vWorkbench.bigPic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('bigPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/office/'+val+'">'+val+'</a>';
		} }
		,{text : '<s:text name="vWorkbench.leftPic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('leftPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/office/'+val+'">'+val+'</a>';
		} }
		,{text : '<s:text name="vWorkbench.midPic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('midPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/office/'+val+'">'+val+'</a>';
		} }
		,{text : '<s:text name="vWorkbench.rightPic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('rightPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/office/'+val+'">'+val+'</a>';
		} }
		,{text : '<s:text name="vWorkbench.planePic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('planePic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/office/'+val+'">'+val+'</a>';
		} }
		,{text : '<s:text name="vOffice.pic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,hidden:true,
			renderer:function(v,m,record,ri,ci){  
			   var val= record.get('pic');  
			   return  val==''||val==null?'':'<a target="_blank" href="pics/office/'+val+'">'+val+'</a>';
		 } }
		,{text : '<s:text name="vOffice.intro" />',dataIndex:'intro',name:'intro',align : 'center',flex:1}
		,{text : '<s:text name="vOffice.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vOffice.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vOffice.cityId" />',dataIndex:'cityId',name:'cityId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vOffice.areaId" />',dataIndex:'areaId',name:'areaId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vOffice.typeId" />',dataIndex:'typeId',name:'typeId',align : 'center',width:100,hidden:true}
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
						form.down('#fileShow').setValue('<a target="_blank" href="pics/office/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');
				}else{
						form.down('#fileShow').setValue('');
				}
				form.down('#uploadFile').setVisible(true);	
				form.down('#delFileFlag').setVisible(true);	
				form.down('#fileShow').setVisible(true);
				form.down('#fileShow').hideLabel=true;
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'product/office!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
