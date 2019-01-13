<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	form = Ext.widget('form', {
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
			{itemId:'id',name:'id',hidden:true},{itemId:'editId',name:'editId',hidden:true},
			{name:'buildingName',hidden:true},{itemId:'floorName',name:'floorName',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'buildingId',
						fieldLabel:'<s:text name="vNewWorkbench.buildingName"/>',
						xtype : 'combo',
						value : '',
						selectOnFocus : true,
						displayField : 'name',
						valueField : 'id',
						editable : true,
						store : cb_buildings_ds,
						listeners : {
							select : function() {
								this.up('form').getForm().findField(
										'buildingName').setValue(
										this.getRawValue());												
								Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+this.getValue(),order : order});
								cb_floors_ds.loadPage(1);	
								this.up('form').getForm().findField('floorId').setValue("");
							}
						}
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'floorId',
						itemId:'floorId',
						fieldLabel:'<s:text name="vNewWorkbench.floorName"/>',
						xtype : 'combo',
						value : '',
						selectOnFocus : true,
						displayField : 'name',
						valueField : 'id',
						editable : true,
						store : cb_floors_ds,
						listeners : {
							select : function() {
								this.up('form').getForm().findField(
										'floorName').setValue(
										this.getRawValue());
							}
						}
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'name',
						fieldLabel:'<s:text name="vNewWorkbench.name"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'quantity',
						fieldLabel:'<s:text name="vNewWorkbench.quantity"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'price',
						fieldLabel:'<s:text name="vNewWorkbench.price"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'deposit',
						fieldLabel:'<s:text name="vNewWorkbench.deposit"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'payRatio',
						fieldLabel:'<s:text name="vNewWorkbench.payRatio"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						xtype : 'filefield',
						flex : 1,
						name : 'uploadFile1',
					    itemId : 'uploadFile1',
						emptyText : '请选择上传文件...',
						fieldLabel : '<s:text name="vNewWorkbench.planePic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}
					
					}, {
						fieldLabel : '<s:text name="vNewWorkbench.planePic"/>',
						xtype : 'displayfield',
						itemId : 'fileShow1',
						name : 'fileShow1',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					},{
						hidden : true,
						itemId : 'planePic',
						name : 'planePic',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					},{
						xtype : 'checkbox',
						boxLabel : '删除附件',
						value : 1,
						name : 'delFileFlag0',
						itemId : 'delFileFlag0',
						style : "margin-left:70px",
						hideLabel : true,
						width : 150,
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						xtype : 'filefield',
						flex : 1,
						name : 'uploadFile2',
					  itemId : 'uploadFile2',
						emptyText : '请选择上传文件...',
						fieldLabel : '<s:text name="vNewWorkbench.coverPic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}
					
					}, {
						fieldLabel : '<s:text name="vNewWorkbench.coverPic"/>',
						xtype : 'displayfield',
						itemId : 'fileShow2',
						name : 'fileShow2',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					},{
						hidden : true,
						itemId : 'coverPic',
						name : 'coverPic',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					},{
						xtype : 'checkbox',
						boxLabel : '删除附件',
						value : 1,
						name : 'delFileFlag1',
						itemId : 'delFileFlag1',
						style : "margin-left:70px",
						hideLabel : true,
						width : 150,
						itemCls : 'left-float',
						clearCls : 'allow-float'
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
						height:100,
						fieldLabel:'<s:text name="vNewWorkbench.intro"/>'
					}
				]
			}
		],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				var floorId = saveForm.down('#floorId').getValue();
				var floorName = saveForm.down('#floorName').getValue();
				var isEdit = saveForm.down('#editId').getValue();
				if(isEdit!=floorName){
					if(floorId==""){
						floorId = 'null';
					};
					Ext.Ajax.request({
						url : 'products/newWorkbench!findByFloorId',
						timeout : 60000,
						params : {
							floorId : floorId
						},
						method : 'post',
						success : function(response) {
							var responseText = response.responseText;
							if (responseText.indexOf('false') != 0) {
								Ext.Msg.alert('错误', '不允许添加相同楼层工位！');
							}else{
								if (saveForm.getForm().isValid()) {
									newSaveFile(saveForm, 'uploadFile1','uploadFile2',fileTypes, 'products/newWorkbench!save',grid);
								}
							}
						},
						failure : function(response) {
							Ext.Msg.alert('错误', (response.responseText));
						}
					});
				}else{
					if (saveForm.getForm().isValid()) {
						newSaveFile(saveForm, 'uploadFile1','uploadFile2',fileTypes, 'products/newWorkbench!save',grid);
					}
				}
				
			}
		}, {
		text : '关闭',
			itemId : 'btnClose',
			handler : function() {
				this.up('window').hide();
			}
			} ]
			});
</script>
