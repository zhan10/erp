<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	//定义列  
	var columns = [ 
		{text : 'id',dataIndex : 'id',width : 40,hidden : true},
		{text : 'matetypeid',dataIndex : 'matetypeid',width : 40,hidden : true},
		{text : '<s:text name="vInventory.materid" />',dataIndex : 'materid',align : 'center',flex:1},
		{text : '<s:text name="vInventory.matername" />',dataIndex : 'matername',align : 'center',flex:1},
		{text : '材料类别',dataIndex : 'matetypename',align : 'center',flex:1},
		{text : '<s:text name="vInventory.quantities" />',dataIndex : 'quantities',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '单位',dataIndex : 'unit',align : 'center',flex:1},
		{text : '备注',dataIndex : 'remarks',align : 'center',editor:{allowBlank:true},flex:1},
	  ];  
	//定义数据  
	var data =[];  
	//转换原始数据为EXT可以显示的数据  
	store = new Ext.data.ArrayStore({  
	    data:data,  
	    fields:[  
	       {name:'id'}, //mapping:0 这样的可以指定列显示的位置，0代表第1列，可以随意设置列显示的位置  
	       {name:'materid'},  
	       {name:'matername'},
	       {name:'matetypeid'},
	       {name:'matetypename'},
	       {name:'quantities'},
	       {name:'unit'},
	       {name:'remarks'}
	    ]  
	});  
	//加载数据  
	store.load();
	inventory_sm = Ext.create('Ext.selection.CheckboxModel', {
		listeners : {
			selectionchange : function(sm, selections) {
			}
		}
	});

	//创建表格  
	vInventory_grid = new Ext.grid.GridPanel({  
		flex : 1, 
	    store:store,  
	    columns:columns, //显示列  
	    stripeRows:true, //斑马线效果  
	    selType: 'cellmodel', 
	    plugins:[  
             Ext.create('Ext.grid.plugin.CellEditing',{  
                 clicksToEdit:1 //设置单击几次单元格编辑  
             })  
	    ],
	    selModel : inventory_sm,
		viewConfig : {
			enableTextSelection : true
		},
	    tbar:['-',{  
		        text:'增加材料',  
		        handler:function(){  
		        	batchWin.show();
		        }  
	        },'-',{  
	            text:'删除',  
	            handler:function(){  
	                Ext.Msg.confirm('系统提示','确定要删除？',function(btn){  
	                    if(btn=='yes'){
	                        var record = inventory_sm.getSelection();  
	                        for(var index in record) { 
	                        	store.remove(record[index]);  
	                        }
	                    }  
	                });  
	            }  
	    }]
	}); 
	
   
</script>
