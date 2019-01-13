<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vBuilding.cityName" />',dataIndex:'cityName',name:'cityName',align : 'center',width:100,hidden : true}
		,{text : '<s:text name="vBuilding.areaName" />',dataIndex:'areaName',name:'areaName',align : 'center',width:100,hidden : true}
		,{text : '<s:text name="vBuilding.circleName" />',dataIndex:'circleName',name:'circleName',align : 'center',width:100,hidden : true}
		,{text : '<s:text name="vBuilding.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="vBuilding.pic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
			   var val= record.get('pic');  
			   return  val==''||val==null?'':'<a target="_blank" href="pics/building/'+val+'">'+val+'</a>';
		 } },		
		{text : '<s:text name="vBuilding.pic" />',dataIndex:'pic',name:'pic',hidden:true}		
		,{text : '<s:text name="vBuilding.intro" />',dataIndex:'intro',name:'intro',align : 'center',flex:1}
		,{text : '<s:text name="vBuilding.traffic" />',dataIndex:'traffic',name:'traffic',align : 'center',flex:1,hidden:true}
		,{text : '<s:text name="vBuilding.cityId" />',dataIndex:'cityId',name:'cityId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBuilding.areaId" />',dataIndex:'areaId',name:'areaId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vBuilding.circleId" />',dataIndex:'circleId',name:'circleId',align : 'center',width:100,hidden:true}
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
						form.down('#fileShow').setValue('<a target="_blank" href="pics/building/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'product/building!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
