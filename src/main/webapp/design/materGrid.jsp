<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mater_Fields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : 'atct',dataIndex : 'atct',name : 'atct',width : 40,hidden : true}
		,{text : '<s:text name="mater.materid" />',dataIndex : 'materid',name : 'materid',align : 'center',flex:1}
		,{text : '<s:text name="mater.matername" />',dataIndex:'matername',name:'matername',align : 'center',flex:1}
		,{text : '<s:text name="mater.matetypeid" />',dataIndex:'matetypeid',name:'matetypeid',align : 'center',flex:1,hidden:true}
		,{text : '<s:text name="mater.unit" />',dataIndex:'unit',name:'unit',align : 'center',width:100,flex:1}
	];
	
	var mater_ds = getDs(mater_Fields, 'mater/mater!managerExt', '',' order by materid desc');
	mater_ds.pageSize=999;
	//mater_ds.load();
	
	mater_sm = Ext.create('Ext.selection.CheckboxModel', {
		listeners : {
			selectionchange : function(sm, selections) {
				//grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
				//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
			}
		}
	});
	mater_grid= Ext.create('Ext.grid.Panel', {
		itemId : 'mater_grid',
		store : mater_ds,
		margin : "5",
		columns :  mater_Fields,
		columnLines : true,
		selModel : mater_sm,
		viewConfig : {
			enableTextSelection : true
		},
		tbar:{
			xtype:"container",
			border:false,
			items:[{
			     //tbar第二行工具栏
			     xtype:"toolbar",
			     items : [
			    	 getTextField('matername', 100, '',0, '<s:text name="vInventory.matername" />'),
			    	 '-',
					{
						text : '查询',
						iconCls : 'search',
						handler : function() {
						sqlStr = "";
						t_sql = "";
						try {
							t_sql = this.prev("#matername").getValue();
							if (t_sql != "")
								sqlStr += " and matername like '%"+ t_sql+ "%' ";
							t_sql = matetypeid
							if (t_sql != "" && t_sql != -1)
								sqlStr += " and matetypeid = '"+ t_sql+ "' ";
						}catch(e){
							Ext.MessageBox.alert('错误', '查询条件有误' + e);
						}
						Ext.apply(
							mater_ds.proxy.extraParams,{whereSql : sqlStr});
							mater_ds.loadPage(1);
						}
					}
			     ]
			}]
		},
		flex:1
	});
</script>
