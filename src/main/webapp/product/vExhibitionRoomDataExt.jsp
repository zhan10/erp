<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vExhibitionRoom.cityName" />',dataIndex:'cityName',name:'cityName',align : 'center',width:100,hidden : true}
		,{text : '<s:text name="vExhibitionRoom.areaName" />',dataIndex:'areaName',name:'areaName',align : 'center',width:100,hidden : true}
		,{text : '<s:text name="vExhibitionRoom.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:100}
		,{text : '<s:text name="vExhibitionRoom.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:100}
		,{text : '<s:text name="vExhibitionRoom.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="vExhibitionRoom.galleryful" />',dataIndex:'galleryful',name:'galleryful',align : 'center',width:100}
		,{text : '<s:text name="vExhibitionRoom.price" />',dataIndex:'price',name:'price',align : 'center',width:100}
		,{
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
		}
		,{
			text : '<s:text name="vExhibitionRoom.equipment" />',
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
		,{text : '<s:text name="vExhibitionRoom.pic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
			   var val= record.get('pic');  
			   return  val==''||val==null?'':'<a target="_blank" href="pics/exhibitionRoom/'+val+'">'+val+'</a>';
		 }}
		 ,{text : '<s:text name="vExhibitionRoom.pic" />',dataIndex:'pic',name:'pic',hidden:true}
		,{text : '<s:text name="vExhibitionRoom.intro" />',dataIndex:'intro',name:'intro',align : 'center',flex:1}
		,{text : '<s:text name="vExhibitionRoom.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vExhibitionRoom.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vExhibitionRoom.areaId" />',dataIndex:'areaId',name:'areaId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vExhibitionRoom.cityId" />',dataIndex:'cityId',name:'cityId',align : 'center',width:100,hidden:true}
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
				form.down('#price').setReadOnly(true);
				form.down('#unit').setReadOnly(true);
				setEquipment();
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'product/exhibitionRoom!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
