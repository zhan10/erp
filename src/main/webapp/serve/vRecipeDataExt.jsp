<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [ {
		text : 'id',
		dataIndex : 'id',
		name : 'id',
		width : 40,
		hidden : true
	}, 
	{
		text : '<s:text name="vRecipe.cityName" />',
		dataIndex : 'cityName',
		name : 'cityName',
		align : 'center',
		width : 150
	}, {
		text : '<s:text name="vRecipe.buildingName" />',
		dataIndex : 'buildingName',
		name : 'buildingName',
		align : 'center',
		width : 150
	},{
		text : '<s:text name="vRecipe.typeName" />',
		dataIndex : 'typeName',
		name : 'typeName',
		align : 'center',
		width : 150
	}, {
		text : '<s:text name="vRecipe.spicy" />',
		dataIndex : 'spicy',
		name : 'spicy',
		align : 'center',
		width : 150,
		renderer : function(val) {
			try {
				return spicyDegreeDs.findRecord('value', val).get('text');
			} catch (e) {
				//alert(e);
			}
		}
	}, {
		text : '<s:text name="vRecipe.name" />',
		dataIndex : 'name',
		name : 'name',
		align : 'center',
		width : 150
	}, {
		text : '<s:text name="vRecipe.price" />',
		dataIndex : 'price',
		name : 'price',
		align : 'center',
		width : 150
	}, {
		text : '<s:text name="vRecipe.keyword" />',
		dataIndex : 'keyword',
		name : 'keyword',
		align : 'center',
		width : 150
	},{text : '<s:text name="vRecipe.pic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
			   var val= record.get('pic');  
			   return  val==''||val==null?'':'<a target="_blank" href="pics/recipe/'+val+'">'+val+'</a>';
		 } },		
		{text : '<s:text name="vRecipe.pic" />',dataIndex:'pic',name:'pic',hidden:true}		
	, {
		text : '<s:text name="vRecipe.memo" />',
		dataIndex : 'memo',
		name : 'memo',
		align : 'center',
		flex : 1
	}, {
		text : '<s:text name="vRecipe.recipeType" />',
		dataIndex : 'recipeType',
		name : 'recipeType',
		align : 'center',
		width : 100,
		hidden : true
	} ,
	{
		text : '<s:text name="vRecipe.buildingId" />',
		dataIndex : 'buildingId',
		name : 'buildingId',
		align : 'center',
		width : 100,
		hidden : true
	}  ,{
		text : '<s:text name="vRecipe.cityId" />',
		dataIndex : 'cityId',
		name : 'cityId',
		align : 'center',
		width : 100,
		hidden : true
	} ];
	var columnOperators = [
			{
				xtype : 'rownumberer',
				width : 40
			},
			{
				xtype : 'actioncolumn',
				locked : true,
				width : 50,
				items : [
						{
							icon : 'img/toolbar/edit.gif',
							tooltip : '修改',
							handler : function(grid, rowIndex, colIndex) {
								var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
				if(rec.get('pic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/recipe/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');
				}else{
						form.down('#fileShow').setValue('');
				}
				form.down('#uploadFile').setVisible(true);	
				form.down('#delFileFlag').setVisible(true);	
				form.down('#fileShow').setVisible(true);
				form.down('#fileShow').hideLabel=true;								
							}
						},
						{
							iconCls : 'delete',
							tooltip : '删除',
							handler : function(grid, rowIndex, colIndex) {
								grid.getSelectionModel().select(rowIndex);
								delFromDB(grid.getStore(), grid
										.getSelectionModel(),
										'restaurant/recipe!delete');
							}
						} ]
			} ];
	var mainColumns = columnOperators.concat(mainFields);
</script>
