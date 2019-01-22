<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var number = 0;
	var matetypeid = 0;
	var mater_Fields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
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
	
	cb_mateType_ds.on('load', function (store) {
        store.insert(0,{id: '-1', name: '请选择'});
    })
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
			     //tbar第一行工具栏
			     xtype:"toolbar",
			     items : [
			    	 {
						itemId : 'matetypeid',
						name : 'matetypeid',
						hidden : true
					},
				   	 {
						xtype : 'container',
						layout : 'hbox',
						id:'mateTypeCombos',
						defaultType : 'textfield',
						items : [
							 {
								flex : 1,
								allowBlank : false,
								itemId : 'matetypeid'+number,
								xtype : 'combo',
								displayField : 'name',forceSelection:false,
								valueField : 'id',
								store : cb_mateType_ds,
								listeners : {
									expand : function() {
										Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' and grade=1'});
										cb_mateType_ds.loadPage(1);
									},
									select : function() {
										matetypeid = this.getValue();
										var items=Ext.getCmp('mateTypeCombos');
										if(number!=0){
											for(var i=0;i<number;i++){
												items.remove("matetypeid"+(i+1));
											}
											number = 0;
										}
										Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' and grade=1'});
										cb_mateType_ds.loadPage(1);
										addItem(items,this.getValue());
									}
								 } 
							} 
						]
					}
				]
			},{
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
