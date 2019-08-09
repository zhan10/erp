<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var metals_Fields = [
		{text : 'id',dataIndex : 'id',name:'id',width : 40,hidden : true},
		{text : 'orders_id',dataIndex : 'ordersId',name:'ordersId',width : 40,hidden : true},
		{text : '名称',dataIndex : 'name',name:'name',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '型号',dataIndex : 'model',name:'model',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '数量',dataIndex : 'number',name:'number',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '单位',dataIndex : 'unit',name:'unit',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '物料编码',dataIndex : 'materid',name:'materid',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '备注',dataIndex : 'remark',name:'remark',align : 'center',editor:{allowBlank:true},flex:1},
	];
	metals_ds = getDs(metals_Fields, 'resolve/erpMetals!managerExt', '',' order by id');
	metals_ds.pageSize=999;
	metals_sm = Ext.create('Ext.selection.CheckboxModel', {
		listeners : {
			selectionchange : function(sm, selections) {
				metals_grid.down('#metals_del').setDisabled(selections.length == 0);
			}
		}
	});
	//metals_ds.loadPage(1);  
	//创建表格  
	metals_grid = new Ext.grid.GridPanel({  
		flex : 1, 
	    store:metals_ds,  
	    columns:metals_Fields, //显示列  
	    stripeRows:true, //斑马线效果  
	    selType: 'cellmodel', 
	    plugins:[  
             Ext.create('Ext.grid.plugin.CellEditing',{  
                 clicksToEdit:1 //设置单击几次单元格编辑  
             })  
	    ],
	    selModel : metals_sm,
		viewConfig : {
			enableTextSelection : true
		},
	    tbar:[/*{  
	    		itemId:'metals_add',
		        text:'增加一行',  
		        handler:function(){
		        	var data = {
		        		"id":"",
		        		"orders_id":"",
		        		"room":"",
		        		"name":"",
		        		"mainMater":"",
		        		"decompose":""
		        	}
		        	metals_ds.insert(0,data);
		        }  
	        },'-',
	        {  
	            text:'删除',  
	            disabled : true,
	            itemId:'metals_del',
	            handler:function(){  
	                Ext.Msg.confirm('系统提示','确定要删除？',function(btn){  
	                    if(btn=='yes'){
	                        var record = metals_sm.getSelection();  
	                        for(var index in record) { 
	                        	metals_ds.remove(record[index]);  
	                        }
	                    }  
	                });  
	            } 
	        }*/
	    ]
	}); 
</script>
