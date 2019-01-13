<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [ {
		dataIndex : 'id',
		name : 'id',
		width : 40,
		hidden : true
	}, {
		text : '<s:text name="users.name" />',
		dataIndex : 'name',
		name : 'name',
		width : 120,
		align : 'center'/* ,
		locked : true */
	}, {
		text : '<s:text name="users.code" />',
		dataIndex : 'code',
		name : 'code',
		width : 120,
		align : 'center'/* ,
		locked : true */
	},{
		text : '<s:text name="users.password" />',
		name : 'password',
		inputType: 'password',
		align:'center',
		hidden:true
	}, {
		text : '<s:text name="users.birth" />',
		dataIndex : 'birth',
		name : 'birth',
		width : 120,
		align : 'center',
		convert : convertDate
	}, {
		text : '<s:text name="users.sex" />',
		dataIndex : 'sex',
		type : 'boolean',
		name : 'sex',
		flex:1,
		align : 'center',
		convert : function(v, record) {//boolean类型中的false传给radio会有问题，转换为0\1
			if(v==true)
				return 1;
			if(v==false)
				return 0;
		},		
		renderer : function(v) {
			if (v==1)
				return "男";
			if(v==0)
			return "女";
		} 
	},
	/* {
		text : '<s:text name="users.dept" />',
		dataIndex : 'dept',
		name : 'dept',
		width : 120,
		align : 'center'
	}
	, */{
		text : '<s:text name="users.enable" />',
		dataIndex : 'enable',
		name : 'enable',
		flex:1,
		align : 'center',convert : function(v, record) {//boolean类型中的false传给radio会有问题，转换为0\1
			if(v==true)
				return 1;
			if(v==false)
				return 0;
		},
		renderer : function(v) {
			if(v==1)
				return "允许";
			if(v==0)return "禁止";
		}
	}, {
		text : '<s:text name="users.status" />',
		dataIndex : 'status',
		name : 'status',
		flex:1,
		align : 'center',
		renderer : function(v) {
			if (v == 0)
				return "在职ddd";
			if (v == 1)
				return "在职";
			if (v == 2)
				return "离职";
			if (v == 3)
				return "病休";
		}
	} ];
	var columnOperators = [ {
		xtype : 'rownumberer',
		width : 40
	}, {
		xtype : 'actioncolumn',
		locked : true,
		width : 50,
		items : [ {
			icon : 'img/toolbar/edit.gif',
			tooltip : '修改',
			handler : function(grid,rowIndex,colIndex) {
				//sm.select(rowIndex);	
				var rec = grid.getStore().getAt(rowIndex);				
				editWinByRec(win,winTitle+'——修改', rec);
			}
			
		}, {
			icon : 'img/toolbar/delete.gif',
			tooltip : '删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'system/users!delete');				
			}
		} ]
	} ];
	var mainColumns = columnOperators.concat(mainFields);
</script>
