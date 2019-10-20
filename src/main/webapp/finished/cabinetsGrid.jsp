<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var cabinets_Fields = [
		{text : 'id',dataIndex : 'id',name:'id',width : 40,hidden : true},
		{text : 'orders_id',dataIndex : 'ordersId',name:'ordersId',width : 40,hidden : true},
		{text : 'type_id',dataIndex : 'typeId',name:'typeId',width : 40,hidden : true},
		{text : '序号',dataIndex : 'numbering',name:'numbering',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '名称',dataIndex : 'name',name:'name',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '长',dataIndex : 'width',name:'width',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '宽',dataIndex : 'height',name:'height',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '厚',dataIndex : 'deepth',name:'deepth',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '数量',dataIndex : 'number',name:'number',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '颜色',dataIndex : 'color',name:'color',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '面积',dataIndex : 'acreage',name:'acreage',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '封边要求',dataIndex : 'require',name:'require',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '门开方向',dataIndex : 'doorDirection',name:'doorDirection',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '门型',dataIndex : 'doorForm',name:'doorForm',align : 'center',editor:{allowBlank:true},flex:1},
		{text : '说明',dataIndex : 'explain',name:'explain',align : 'center',editor:{allowBlank:true},flex:1},
	];
	cabinets_ds = getDs(cabinets_Fields, 'resolve/erpCabinets!managerExt', '',' order by id');
	cabinets_ds.pageSize=999;
	cabinets_sm = Ext.create('Ext.selection.CheckboxModel', {
		listeners : {
			selectionchange : function(sm, selections) {
				cabinets_grid.down('#cabinets_del').setDisabled(selections.length == 0);
			}
		}
	});
	//cabinets_ds.loadPage(1);  
	//创建表格  
	cabinets_grid = new Ext.grid.GridPanel({  
		flex : 1, 
	    store:cabinets_ds,  
	    columns:cabinets_Fields, //显示列  
	    stripeRows:true, //斑马线效果  
	    selType: 'cellmodel', 
	    plugins:[  
             Ext.create('Ext.grid.plugin.CellEditing',{  
                 clicksToEdit:1 //设置单击几次单元格编辑  
             })  
	    ],
	    selModel : cabinets_sm,
		viewConfig : {
			enableTextSelection : true
		},
	    tbar:[/*{  
	    		itemId:'cabinets_add',
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
		        	cabinets_ds.insert(0,data);
		        }  
	        },'-',
	        {  
	            text:'删除',  
	            disabled : true,
	            itemId:'cabinets_del',
	            handler:function(){  
	                Ext.Msg.confirm('系统提示','确定要删除？',function(btn){  
	                    if(btn=='yes'){
	                        var record = cabinets_sm.getSelection();  
	                        for(var index in record) { 
	                        	cabinets_ds.remove(record[index]);  
	                        }
	                    }  
	                });  
	            } 
	        }*/
	    ]
	}); 
</script>
