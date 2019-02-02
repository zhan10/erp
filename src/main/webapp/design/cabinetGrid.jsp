<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var cabinet_Fields = [
		{text : 'id',dataIndex : 'id',name:'id',width : 40,hidden : true},
		{text : 'orders_id',dataIndex : 'ordersId',name:'ordersId',width : 40,hidden : true},
		{text : '<s:text name="erpCabinet.room" />',dataIndex : 'room',name:'room',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '<s:text name="erpCabinet.name" />',dataIndex : 'name',name:'name',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '<s:text name="erpCabinet.mainMater" />',dataIndex : 'mainMater',name:'mainMater',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '<s:text name="erpCabinet.decompose" />',dataIndex : 'decompose',name:'decompose',align : 'center',editor:{allowBlank:true},flex:1},
	];
	cabinet_ds = getDs(cabinet_Fields, 'comm/erpCabinet!managerExt', '',' order by id desc');
	cabinet_ds.pageSize=999;
	cabinet_sm = Ext.create('Ext.selection.CheckboxModel', {
		listeners : {
			selectionchange : function(sm, selections) {
				cabinet_grid.down('#cabinet_del').setDisabled(selections.length == 0);
			}
		}
	});

	//创建表格  
	cabinet_grid = new Ext.grid.GridPanel({  
		flex : 1, 
	    store:cabinet_ds,  
	    columns:cabinet_Fields, //显示列  
	    stripeRows:true, //斑马线效果  
	    selType: 'cellmodel', 
	    plugins:[  
             Ext.create('Ext.grid.plugin.CellEditing',{  
                 clicksToEdit:1 //设置单击几次单元格编辑  
             })  
	    ],
	    selModel : cabinet_sm,
		viewConfig : {
			enableTextSelection : true
		},
	    tbar:[{  
	    		itemId:'cabinet_add',
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
		        	cabinet_ds.insert(0,data);
		        }  
	        },'-',
	        {  
	            text:'删除',  
	            disabled : true,
	            itemId:'cabinet_del',
	            handler:function(){  
	                Ext.Msg.confirm('系统提示','确定要删除？',function(btn){  
	                    if(btn=='yes'){
	                        var record = cabinet_sm.getSelection();  
	                        for(var index in record) { 
	                        	cabinet_ds.remove(record[index]);  
	                        }
	                    }  
	                });  
	            } 
	        }
	    ]
	}); 
</script>
