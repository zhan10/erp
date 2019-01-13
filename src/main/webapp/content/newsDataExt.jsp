<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : '<s:text name="news.id" />',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="news.newsTitle" />',dataIndex:'title',name:'title',align : 'center',width:150}	
		,{text : '<s:text name="news.site" />',dataIndex:'site',name:'site',align : 'center',width:150}	
		,{
			text : '<s:text name="news.activityTime" />',
			dataIndex:'activityTime',
			name:'activityTime',
			align : 'center',
			width:150,
			convert : function(val){
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
				return Ext.Date.format(date,'Y-m-d H:i:s');
			}
		}
		,{text : '<s:text name="news.content" />',dataIndex:'content',name:'content',align : 'center',flex:1,}
		,{
			text : '<s:text name="news.describe" />',
			dataIndex:'describe',
			name:'describe',
			align : 'center',
			width:150,
			renderer:function(val){
				return "双击查看";
			}
		 }
		,{text : '<s:text name="news.pic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
				renderer:function(v,m,record,ri,ci){  
					   var val= record.get('pic');  
					   return  val==''||val==null?'':'<a target="_blank" href="pics/news/'+val+'">'+val+'</a>';
				 } }
		,{text : '<s:text name="news.pic" />',dataIndex:'pic',name:'pic',align : 'center',flex:1,hidden:true}
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
					form.down('#fileShow').setValue('<a target="_blank" href="pics/news/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');
				}else{
					form.down('#fileShow').setValue('');
				}
					form.down('#uploadFile').setVisible(true);	
					form.down('#delFileFlag').setVisible(true);	
					form.down('#fileShow').setVisible(true);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'news/news!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
