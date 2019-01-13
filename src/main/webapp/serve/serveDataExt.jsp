<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',align : 'center',width : 50,hidden : true}
		,{text : '<s:text name="serve.state" />',dataIndex:'state',name:'state',align : 'center',width:100,
			renderer : function(val) {
			try {
				var ret = serveStateDs.findRecord('value', val).get('text');
				return ret
				} catch (e) {
			}
		}}
		,{text : '<s:text name="serve.serviceType" />',dataIndex:'serviceType',name:'serviceType',align : 'center',width:100,
			renderer : function(val) {
				try {
					var ret = serviceTypeDs.findRecord('value', val).get('text');
					return ret
					} catch (e) {
				}
			}}
		,{text : '<s:text name="serve.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="serve.phone" />',dataIndex:'phone',name:'phone',align : 'center',width:100}
		,{text : '<s:text name="serve.eMail" />',dataIndex:'eMail',name:'eMail',align : 'center',width:115}
		,{text : '<s:text name="serve.data" />',dataIndex:'data',name:'data',align : 'center',width:200,convert : function(val) {return val?val.replace('\T', ' '):'';}}
		,{text : '<s:text name="serve.handleUser" />',dataIndex : 'amender',name : 'amender',align : 'center',width : 100}
		,{text : '<s:text name="serve.demandDescription" />',dataIndex:'demandDescription',name:'demandDescription',align : 'center',width:200}
		,{text : '<s:text name="serve.memo" />',dataIndex:'memo',name:'memo',align : 'center',flex:1}
		,{text : '<s:text name="serve.result" />',dataIndex:'result',name:'result',align : 'center',flex:1}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	}/* ,{
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
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'serve/serve!delete');
		}
	}]
	} */];
	var mainColumns = columnOperators.concat(mainFields);
</script>
