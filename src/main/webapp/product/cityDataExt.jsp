<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="city.name" />',dataIndex:'name',name:'name',align : 'center',flex:1,hidden:true}
		,{text : '<s:text name="city.intro" />',dataIndex:'intro',name:'intro',align : 'center',flex:1,hidden:true}
		,{text : '<s:text name="city.pic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
			   var val= record.get('pic');  
			   return  val==''||val==null?'':'<a target="_blank" href="pics/city/'+val+'">'+val+'</a>';
		 },hidden:true },
		
		{text : '<s:text name="city.pic" />',dataIndex:'pic',name:'pic',hidden:true}
	   ,{text : '<s:text name="city.serviceName" />',dataIndex:'serviceName',name:'serviceName',align : 'center',flex:1}
	   ,{text : '<s:text name="city.serviceTel" />',dataIndex:'serviceTel',name:'serviceTel',align : 'center',flex:1}
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
						form.down('#fileShow').setValue('<a target="_blank" href="pics/city/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow').setValue('');
					}
						form.down('#uploadFile').setVisible(true);	
						form.down('#delFileFlag').setVisible(true);	
						form.down('#fileShow').setVisible(true);
						form.down('#fileShow').hideLabel=true;
					 }
		}/* ,{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'product/city!delete');
		} 
	}*/]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
