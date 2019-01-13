<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vMeetingRoom.cityName" />',dataIndex:'cityName',name:'cityName',align : 'center',width:100,hidden : true}
		,{text : '<s:text name="vMeetingRoom.areaName" />',dataIndex:'areaName',name:'areaName',align : 'center',width:100,hidden : true}
		,{text : '<s:text name="vMeetingRoom.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:100}
		,{text : '<s:text name="vMeetingRoom.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:100}
		,{text : '<s:text name="vMeetingRoom.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="vMeetingRoom.galleryful" />',dataIndex:'galleryful',name:'galleryful',align : 'center',width:100}
		,{text : '<s:text name="vMeetingRoom.orientation" />',dataIndex:'orientation',name:'orientation',align : 'center',width:100}
		,{text : '<s:text name="vMeetingRoom.area" />',dataIndex:'area',name:'area',align : 'center',width:100}
		,{text : '<s:text name="vMeetingRoom.bigPic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('bigPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/meetingroom/'+val+'">'+val+'</a>';
		} }
		,{text : '<s:text name="vMeetingRoom.leftPic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('leftPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/meetingroom/'+val+'">'+val+'</a>';
		} }
		,{text : '<s:text name="vMeetingRoom.midPic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('midPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/meetingroom/'+val+'">'+val+'</a>';
		} }
		,{text : '<s:text name="vMeetingRoom.rightPic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('rightPic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/meetingroom/'+val+'">'+val+'</a>';
		} }
		,{text : '<s:text name="vMeetingRoom.planePic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
				   var val= record.get('planePic');  
				   return  val==''||val==null?'':'<a target="_blank" href="pics/meetingroom/'+val+'">'+val+'</a>';
		} }
		,{text : '<s:text name="vMeetingRoom.pic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
			   var val= record.get('pic');  
			   return  val==''||val==null?'':'<a target="_blank" href="pics/meetingroom/'+val+'">'+val+'</a>';
		 }}
		,{text : '<s:text name="vMeetingRoom.price" />',dataIndex:'price',name:'price',align : 'center',width:100}
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
		,{text : '<s:text name="vMeetingRoom.deposit" />',dataIndex:'deposit',name:'deposit',align : 'center',width:100}
		,{
			text : '<s:text name="vMeetingRoom.equipment" />',
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
		,{text : '<s:text name="vMeetingRoom.deposit" />',dataIndex:'deposit',name:'deposit',hidden:true}
		,{text : '<s:text name="vMeetingRoom.pic" />',dataIndex:'pic',name:'pic',hidden:true}
		,{text : '<s:text name="vMeetingRoom.bigPic" />',dataIndex:'bigPic',name:'bigPic',hidden:true}
		,{text : '<s:text name="vMeetingRoom.leftPic" />',dataIndex:'leftPic',name:'leftPic',hidden:true}
		,{text : '<s:text name="vMeetingRoom.midPic" />',dataIndex:'midPic',name:'midPic',hidden:true}
		,{text : '<s:text name="vMeetingRoom.rightPic" />',dataIndex:'rightPic',name:'rightPic',hidden:true}
		,{text : '<s:text name="vMeetingRoom.planePic" />',dataIndex:'planePic',name:'planePic',hidden:true}
		,{text : '<s:text name="vMeetingRoom.orientation" />',dataIndex:'orientation',name:'orientation',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vMeetingRoom.area" />',dataIndex:'area',name:'area',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vMeetingRoom.intro" />',dataIndex:'intro',name:'intro',align : 'center',flex:1,
			renderer:function(v,m,record,ri,ci){  
				   return  "双击查看";
		 }}
		,{text : '<s:text name="vMeetingRoom.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vMeetingRoom.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vMeetingRoom.areaId" />',dataIndex:'areaId',name:'areaId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vMeetingRoom.cityId" />',dataIndex:'cityId',name:'cityId',align : 'center',width:100,hidden:true}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'product/meetingRoom!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
