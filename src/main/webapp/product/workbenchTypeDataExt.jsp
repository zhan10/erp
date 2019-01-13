<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{
	    	text : '<s:text name="officeType.img" />',
	    	dataIndex:'img',
	    	name:'img',
	    	align : 'center',
	    	width:100,
	    	convert:function(val,record){
	    		var iddd=record.data.id
	    		//alert(iddd);
	      		return '<a href="http://localhost:8080/gl/product/room.html?type_id='+iddd+'" target="_blank"><img style="vertical-align:middle; height:18px; width:18px;" src="img/toolbar/room.png"/></a>';	
	    	}
	    }
		,{text : '<s:text name="vWorkbench.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:100}
		,{text : '<s:text name="vWorkbench.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:100}
		,{text : '<s:text name="workbenchType.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="workbenchType.deposit" />',dataIndex:'deposit',name:'deposit',align : 'center',width:100}
		,{text : '<s:text name="workbenchType.count" />',dataIndex:'count',name:'count',align : 'center',width:100}
		,{text : '<s:text name="workbenchType.acreage" />',dataIndex:'acreage',name:'acreage',align : 'center',width:100}
		,{text : '<s:text name="workbenchType.price" />',dataIndex:'price',name:'price',align : 'center',width:100}
		/* ,{
			text : '<s:text name="officeType.unit" />',
			dataIndex : 'unit',
		    name : 'unit',
		    align : 'center',
		    width : 100,
		    renderer : function(val) {
			try {
				var ret = dateDs.findRecord('value', val).get('text');
				return ret
				} catch (e) {
			}
		  }
		 } */
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
		}
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
		,{text : '<s:text name="vWorkbench.bigPic" />',dataIndex:'bigPic',name:'bigPic',hidden:true}
		,{text : '<s:text name="vWorkbench.leftPic" />',dataIndex:'leftPic',name:'leftPic',hidden:true}
		,{text : '<s:text name="vWorkbench.midPic" />',dataIndex:'midPic',name:'midPic',hidden:true}
		,{text : '<s:text name="vWorkbench.rightPic" />',dataIndex:'rightPic',name:'rightPic',hidden:true}
		,{text : '<s:text name="vWorkbench.planePic" />',dataIndex:'planePic',name:'planePic',hidden:true}
		,{text : '<s:text name="vWorkbench.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vWorkbench.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
		,{
			text : '<s:text name="workbenchType.intro" />',
			dataIndex:'intro',
			name:'intro',
			align : 'center',
			flex:1,/* 
			convert: function(val){
				//debugger;
				var img = val.replace(/src="([^"]*)"/g,function(match, capture) {
					return "src=\""+capture+"\"";
				});
		    	return img;
			}, */
			renderer:function(){
				return  "双击查看";
			}
		 }
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
				if(rec.get('planePic')!=''){
				form.down('#fileShow').setValue('<a target="_blank" href="pics/workbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');//.setVisible(true);
			}else{
				form.down('#fileShow').setValue('');
			};
			if(rec.get('bigPic')!=''){
				form.down('#fileShow1').setValue('<a target="_blank" href="pics/workbench/'+rec.get('bigPic')+'">'+rec.get('bigPic')+'</a>');//.setVisible(true);
			}else{
				form.down('#fileShow1').setValue('');
			};
			if(rec.get('leftPic')!=''){
				form.down('#fileShow2').setValue('<a target="_blank" href="pics/workbench/'+rec.get('leftPic')+'">'+rec.get('leftPic')+'</a>');//.setVisible(true);
			}else{
				form.down('#fileShow2').setValue('');
			};
			if(rec.get('midPic')!=''){
				form.down('#fileShow3').setValue('<a target="_blank" href="pics/workbench/'+rec.get('midPic')+'">'+rec.get('midPic')+'</a>');//.setVisible(true);
			}else{
				form.down('#fileShow3').setValue('');
			};
			if(rec.get('rightPic')!=''){
				form.down('#fileShow4').setValue('<a target="_blank" href="pics/workbench/'+rec.get('rightPic')+'">'+rec.get('rightPic')+'</a>');//.setVisible(true);
			}else{
				form.down('#fileShow4').setValue('');
			};
			if(rec.get('planePic')!=''){
				form.down('#fileShow5').setValue('<a target="_blank" href="pics/workbench/'+rec.get('planePic')+'">'+rec.get('planePic')+'</a>');//.setVisible(true);
			}else{
				form.down('#fileShow5').setValue('');
			};
			form.down('#uploadFile').setVisible(true);
			form.down('#uploadFile1').setVisible(true);
			form.down('#uploadFile2').setVisible(true);
			form.down('#uploadFile3').setVisible(true);
			form.down('#uploadFile4').setVisible(true);
			form.down('#uploadFile5').setVisible(true);
			form.down('#delFileFlag0').setVisible(true);	
			form.down('#delFileFlag1').setVisible(true);
			form.down('#delFileFlag2').setVisible(true);
			form.down('#delFileFlag3').setVisible(true);
			form.down('#delFileFlag4').setVisible(true);
			form.down('#delFileFlag5').setVisible(true);
			form.down('#fileShow').setVisible(true);
			form.down('#fileShow1').setVisible(true);
			form.down('#fileShow2').setVisible(true);
			form.down('#fileShow3').setVisible(true);
			form.down('#fileShow4').setVisible(true);
			form.down('#fileShow5').setVisible(true);
			form.down('#fileShow').hideLabel=true;
			form.down('#fileShow1').hideLabel=true;
			form.down('#fileShow2').hideLabel=true;
			form.down('#fileShow3').hideLabel=true;
			form.down('#fileShow4').hideLabel=true;
			form.down('#fileShow5').hideLabel=true;
			form.down('#buildingId').setReadOnly(true);
			form.down('#floorId').setReadOnly(true);
			form.down('#count').setReadOnly(true);
			form.down('#price').setReadOnly(true);
			form.down('#unit').setReadOnly(true);
			Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
			cb_floors_ds.loadPage(1);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'product/workbenchType!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
