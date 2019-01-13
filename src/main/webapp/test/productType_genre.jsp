<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../c/cb_productType.jsp"%>
<script type="text/javascript" src="ini/getProductUnitDs.js"></script>
<script>
	var genre_Fields = [
			{text : '<s:text name="genre.id" />',dataIndex : 'id',name : 'id',width : 40,hidden : true}
			,{text : '<s:text name="genre.name" />',dataIndex:'name',name:'name',align : 'center',width:200}
			,{text : '<s:text name="genre.price" />',dataIndex:'price',name:'price',align : 'center',width:200}
			,{
				text : '<s:text name="genre.priceUnit" />',
				dataIndex:'priceUnit',
				name:'priceUnit',
				align : 'center',
				width:100,
				renderer : function(val) {
					try {
						var ret = productDs.findRecord('value', val).get('text');
						return ret;
					} catch (e) {
					}
				}
			 }
			,{text : '<s:text name="genre.intro" />',dataIndex:'intro',name:'intro',align : 'center',flex:1}
			,{text : '<s:text name="genre.productTypeId" />',dataIndex : 'productTypeId',name : 'productTypeId',width : 40,hidden : true}
		];

	var genre_ds = getDs(genre_Fields, 'system/vGenre!managerExt','','order by id');
	genre_ds.pageSize=999;
	genre_sm = Ext.create('Ext.selection.CheckboxModel', {
		listeners : {
			selectionchange : function(genre_sm, selection) {
				genre_grid.down('#delete').setDisabled(selection.length == 0);
				genre_grid.down('#edit').setDisabled(selection.length != 1);
			}
		}
	});
	var saveFormJson;
	var genre_tbar = Ext.create('Ext.toolbar.Toolbar',{
		padding : '5 0 5 10',
		items : [
		         	'->',
		         	Ext.create('Ext.Button', {
						text : '新增',
						iconCls : 'add',
						handler : function(){
							addWin(genre_win, winTitle + '——新增');
							genre_form.down('#btnEdit').setVisible(false);
						}
					}),
					Ext.create('Ext.Button', {
						text : '修改',
						itemId : 'edit',
						iconCls : 'edit',
						disabled : true,
						handler : function(){
							editWin(genre_win, winTitle + '——修改',genre_sm);	
							genre_form.down('#btnSave').setVisible(false);
							genre_form.down('#btnEdit').setVisible(true);
							saveFormJson = Ext.JSON.encode(genre_form.getForm().getValues());
							arr.push(saveFormJson);
						}
					}),
					Ext.create('Ext.Button', {
						text : '删除',
						itemId : 'delete',
						iconCls : 'delete',
						disabled : true,
						handler : function(){
							var id = genre_sm.getSelection()[0].data['id'];
							if(id==''){
								var name = genre_sm.getSelection()[0].data['name'];
								var index = genre_grid.getStore().find('name',name);
								Ext.MessageBox.confirm('删除记录', '您是否确认删除已选中的这' + genre_sm.getCount()
										+ '条记录，此操作无法还原，请仔细核对要删除的记录！', function(btn) {
									if (btn == 'yes') {
										genre_grid.getStore().removeAt(index);
										Ext.Msg.alert('恭喜', "成功删除!");
									}
								})
							}else{
								delFromDB(genre_ds,genre_sm,'system/genre!delete');							
							}
						}
					}),
				]
		});
	genre_grid= Ext.widget('grid', {
		id : 'genre_grid',
		title : '产品类型',
		store : genre_ds,
		margin : "5",
		selModel : genre_sm,
		tbar : genre_tbar,
		columns :  genre_Fields,
		columnLines : true,
		flex:1	
	});
	
	genre_form = Ext.widget('form', {
		itemId : 'form',
		autoScroll : true,
		overflowX : 'scroll',
		overflowY : 'scroll',
		frame : true,
		layout : {
			type : 'vbox',
			align : 'stretch'
		},
		border : false,
		bodyPadding : 10,
		defaultType : 'textfield',
		fieldDefaults : {
			labelAlign : 'right',
			labelWidth : 100
		},
		defaults : {
			margins : '0 0 10 0'
		},
		items : [
			{name:'id',hidden:true,itemId:'id'},
			{name:'productTypeId',hidden:true,itemId:'productTypeId'},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'name',
						fieldLabel:'<s:text name="genre.name"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						allowBlank : false,
						name : 'price',
						fieldLabel : '<s:text name="genre.price"/>'
					},
					{
						flex : 1,
						xtype : 'combo',
						displayField : 'text',
						valueField : 'value',
						allowBlank : false,
						name : 'priceUnit',
						itemId : 'priceUnit',
						store : productDs,
						fieldLabel : '<s:text name="genre.priceUnit"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						 xtype: 'textarea',
							flex : 1,
							name : 'intro',
							height:50,
						fieldLabel:'<s:text name="genre.intro"/>'
					}
				]
			}
		],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				/* if (saveForm.getForm().isValid()) {
					saveFormToDB(saveForm, 'system/genre!save',genre_grid);
				} */
				if (saveForm.getForm().isValid()) {
					if(saveForm.down('#id').getValue()==''){
						genre_grid.getStore().insert(0,saveForm.getValues());
						var saveFormJson = Ext.JSON.encode(saveForm.getForm().getValues());
						arr.push(saveFormJson);
					}else{
						saveForm.updateRecord();
					}
					genre_win.hide();
				}			
			}
		}, {
			text : '修改',
			itemId : 'btnEdit',
			hidden : true,
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
					var name = genre_sm.getSelection()[0].data['name'];
					var genreIndex = genre_grid.getStore().find('name',name);
					genre_grid.getStore().removeAt(genreIndex);
					genre_grid.getStore().insert(0,saveForm.getValues());
					//var saveFormJson = Ext.JSON.encode(saveForm.getForm().getValues());
					var index;
					for(var i=0;i<arr.length;i++){
						if(arr[i]==saveFormJson){
							index = i;
							break;
						}
					}
					arr.splice(index,1,Ext.JSON.encode(saveForm.getForm().getValues()));
					genre_win.hide();
				}			
			}
		}, {
		text : '关闭',
			itemId : 'btnClose',
			handler : function() {
				this.up('window').hide();
			}
			} ]
	})
	var genre_win;
	genre_grid.on('itemdblclick', function(item_grid, rec) {
		showWinByRec(genre_win, winTitle+'——查看', rec);
		genre_form.down('#btnEdit').setVisible(false);
		genre_form.down('#btnSave').setVisible(false);
	});
	genre_win = getWindow('产品类型',500,250,500,250,genre_form);
</script>
