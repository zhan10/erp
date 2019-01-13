<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 50,hidden : true}
		,{text : '<s:text name="roomFacilities.facilities" />',dataIndex:'facilities',name:'facilities',align : 'center',width:300}
		,{text : '<s:text name="roomFacilities.pic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:300,
			renderer:function(v,m,record,ri,ci){  
			   var val= record.get('pic');  
			   return  val==''||val==null?'':'<a target="_blank" href="pics/workbench/'+val+'">'+val+'</a>';
		 } },		
		{text : '<s:text name="roomFacilities.pic" />',dataIndex:'pic',name:'pic',hidden:true},		
		{text : '<s:text name="roomFacilities.intro" />',dataIndex:'intro',align : 'center',name:'intro',flex:1}		
		
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'product/roomFacilities!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
