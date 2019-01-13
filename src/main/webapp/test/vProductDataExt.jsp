<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : '<s:text name="vProduct.id" />',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vProduct.productName" />',dataIndex:'productName',name:'productName',align : 'center',width:100}
		,{text : '<s:text name="vProduct.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:100}
		,{text : '<s:text name="vProduct.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:100}
		,{text : '<s:text name="vProduct.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{
			text : '<s:text name="vProduct.genreName" />',
			name:'genreName',
			dataIndex:'genreName',
			align : 'center',
			width : 100,
			
		}		
		,{text : '<s:text name="vProduct.galleryful" />',dataIndex:'galleryful',width : 100,align : 'center',name:'galleryful'}		
		,{text : '<s:text name="vProduct.price" />',dataIndex:'price',width : 100,align : 'center',name:'price'}
		,{
			text : '<s:text name="vProduct.priceUnit" />',
			dataIndex:'priceUnit',
			width : 100,
			align : 'center',
			name:'priceUnit',
			renderer : function(val) {
				try {
					var ret = productDs.findRecord('value', val).get('text');
					return ret;
				} catch (e) {
				}
			}
			}	
		,{text : '<s:text name="vProduct.minTime" />',dataIndex:'minTime',width : 100,align : 'center',name:'minTime'}
		,{
			text : '<s:text name="vProduct.unit" />',
			dataIndex:'unit',
			width : 100,
			align : 'center',
			name:'unit',
			renderer : function(val) {
				try {
					var ret = productDs.findRecord('value', val).get('text');
					return ret;					
				} catch (e) {
				}
			}
			}
		,{text : '<s:text name="vProduct.deposit" />',dataIndex:'deposit',width : 100,align : 'center',name:'deposit'}
		,{
			text : '<s:text name="vProduct.equipment" />',
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
		,{text : '<s:text name="vProduct.pic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
			   var val= record.get('pic');  
			   return  val==''||val==null?'':'<a target="_blank" href="pics/workbench/'+val+'">'+val+'</a>';
		 } }		
		,{text : '<s:text name="vProduct.pic" />',dataIndex:'pic',name:'pic',hidden:true}	
		,{text : '<s:text name="vProduct.intro" />',dataIndex:'intro',name:'intro',align : 'center',flex:1}
		,{text : '<s:text name="vProduct.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vProduct.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vProduct.cityId" />',dataIndex:'cityId',name:'cityId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vProduct.areaId" />',dataIndex:'areaId',name:'areaId',align : 'center',width:100,hidden:true}
		,{
			text : '<s:text name="vProduct.genreId" />',
			dataIndex:'genreId',
			name:'genreId',
			align : 'center',
			width:100,
			hidden:true
		},{
			text : '<s:text name="vProduct.productId" />',
			dataIndex:'productId',
			name:'productId',
			align : 'center',
			width:100,
			hidden:true
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
				if(rec.get('pic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/workbench/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'system/products!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
