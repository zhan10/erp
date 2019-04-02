<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="mater.materid" />',dataIndex : 'materid',name : 'materid',align : 'center',width : 100,flex:1}
		,{
			text : '<s:text name="mater.matetypeid" />',
			dataIndex:'matetypeid',
			name:'matetypeid',
			align : 'center',
			width:100,
			flex:1,
			hidden : true/* ,
			renderer : function(val) {
				//return cb_mateType_ds.findRecord('id', val).get('name');
			} */
		 }
		,{text : '<s:text name="mater.matername" />',dataIndex:'matername',name:'matername',align : 'center',width:300}
		,{text : '<s:text name="mater.stand" />',dataIndex:'stand',name:'stand',align : 'center',width:100,flex:1}
		,{text : '<s:text name="mater.unit" />',dataIndex:'unit',name:'unit',align : 'center',width:100,flex:1}
		,{
			text : '<s:text name="mater.ckid" />',
			dataIndex:'ckid',
			name:'ckid',
			align : 'center',
			width:100,
			flex:1,
			renderer : function(val) {
				return cb_warehouse_ds.findRecord('id', val).get('name');
			}
		 }
		,{
			text : '<s:text name="mater.warelocaid" />',
			dataIndex:'warelocaid',
			name:'warelocaid',
			align : 'center',
			width:100,
			flex:1,
			renderer : function(val) {
				return cb_warehouseSite_ds.findRecord('id', val).get('name');
			}
		 }
		,{text : '<s:text name="mater.mwidth" />',dataIndex:'mwidth',name:'mwidth',align : 'center',width:100,flex:1,hidden : true}
		,{text : '<s:text name="mater.mheighth" />',dataIndex:'mheighth',name:'mheighth',align : 'center',width:100,flex:1,hidden : true}
		,{text : '<s:text name="mater.mdeepth" />',dataIndex:'mdeepth',name:'mdeepth',align : 'center',width:100,flex:1,hidden : true}
		,{text : '<s:text name="mater.highct" />',dataIndex:'highct',name:'highct',align : 'center',width:100,flex:1,hidden : true}
		,{text : '<s:text name="mater.lowct" />',dataIndex:'lowct',name:'lowct',align : 'center',width:100,flex:1,hidden : true}
		,{text : '<s:text name="mater.safect" />',dataIndex:'safect',name:'safect',align : 'center',width:100,flex:1,hidden : true}
		,{text : '<s:text name="mater.atct" />',dataIndex:'atct',name:'atct',align : 'center',width:100,flex:1,hidden : true}
		,{text : '<s:text name="mater.lastmodmaker" />',dataIndex:'lastmodmaker',name:'lastmodmaker',align : 'center',width:100,flex:1}
		,{
			text : '<s:text name="mater.lastmoddate" />',
			dataIndex:'lastmoddate',
			name:'lastmoddate',
			align : 'center',
			width:150,
			convert : function(val){
				if(val == null){
					return val;
				}else{
					var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
					return Ext.Date.format(date,'Y-m-d H:i:s');
				}
			}
		 }
		,{text : '<s:text name="mater.description" />',dataIndex:'description',name:'description',align : 'center',width:100,flex:1,hidden : true}
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
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
				var time=Ext.Date.format(new Date(),'Y-m-d H:i:s');
				form.down('#lastmoddate').setValue(time);
				form.down('#lastmodmaker').setValue(userName);
				form.down('#lastmoddate').setReadOnly(true);
				form.down('#lastmodmaker').setReadOnly(true);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'mater/mater!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
