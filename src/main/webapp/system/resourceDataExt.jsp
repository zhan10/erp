<%@ page contentType="text/html;charset=UTF-8"%>
<script>
var mainFields = [
{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true	}
,{
text : '<s:text name="resource.name" />',
dataIndex : 'name',
name : 'name',
width : 120,
align : 'center'
},{
text : '<s:text name="resource.url" />',
dataIndex : 'url',
name : 'url',
width : 120,
align : 'center'
},{
text : '<s:text name="resource.type" />',
dataIndex : 'type',
name : 'type',
width : 120,
align : 'center'
},{
text : '<s:text name="resource.info" />',
dataIndex : 'info',
name : 'info',
width : 120,
align : 'center'
},{
text : '<s:text name="resource.enable" />',
dataIndex : 'enable',
name : 'enable',
width : 120,
align : 'center'
},{
text : '<s:text name="resource.layer" />',
dataIndex : 'layer',
name : 'layer',
width : 120,
align : 'center'
},{
text : '<s:text name="resource.parentId" />',
dataIndex : 'parentId',
name : 'parentId',
width : 120,
align : 'center'
}];
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
handler : function(grid, rowIndex, colIndex) {
isEdit = true;
sm.select(rowIndex);	
var rec = ds.getAt(rowIndex);	
editWinByRec(win, form, rec);
}
}, {
icon : 'img/toolbar/delete.gif', 
tooltip : '删除',
handler : function(grid, rowIndex, colIndex) {
sm.select(rowIndex);
delFromDB(ds, sm,'system/resource!delete',function() {});
}
} ]
} ];
var mainColumns = columnOperators.concat(mainFields);
</script>
