<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vCircle.cityName" />',dataIndex:'cityName',name:'cityName',align : 'center',width:100}
		,{text : '<s:text name="vCircle.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="vCircle.pic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
			   var val= record.get('pic');  
			   return  val==''||val==null?'':'<a target="_blank" href="pics/circle/'+val+'">'+val+'</a>';
		 } },		
		{text : '<s:text name="vCircle.pic" />',dataIndex:'pic',name:'pic',hidden:true}		
		,{text : '<s:text name="vCircle.intro" />',dataIndex:'intro',name:'intro',align : 'center',flex:1}
		,{text : '<s:text name="vCircle.cityId" />',dataIndex:'cityId',name:'cityId',align : 'center',width:100,hidden:true}
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
						form.down('#fileShow').setValue('<a target="_blank" href="pics/circle/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'product/circle!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
