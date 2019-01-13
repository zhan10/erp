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
			{itemId:'id',name:'id',hidden:true},
			{name:'buildingName',hidden:true},{name:'floorName',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'buildingId',
						fieldLabel:'<s:text name="vNewOffice.buildingName"/>',
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
						fieldLabel:'<s:text name="vNewOffice.floorName"/>',
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
						fieldLabel:'<s:text name="vNewOffice.name"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'numbering',
						fieldLabel:'<s:text name="vNewOffice.numbering"/>'
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
						name:'workbenchNumber',
						fieldLabel:'<s:text name="vNewOffice.workbenchNumber"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'price',
						fieldLabel:'<s:text name="vNewOffice.price"/>'
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
						name:'deposit',
						fieldLabel:'<s:text name="vNewOffice.deposit"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'payRatio',
						fieldLabel:'<s:text name="vNewOffice.payRatio"/>'
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
						fieldLabel : '<s:text name="vNewOffice.planePic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}
					
					}, {
						fieldLabel : '<s:text name="vNewOffice.planePic"/>',
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
						fieldLabel : '<s:text name="vNewOffice.coverPic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}
					
					}, {
						fieldLabel : '<s:text name="vNewOffice.coverPic"/>',
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
						fieldLabel:'<s:text name="vNewOffice.intro"/>'
					}
				]
			}
		],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
					//saveFormToDB(saveForm, 'products/newOffice!save',grid);
					newSaveFile(saveForm, 'uploadFile1','uploadFile2',fileTypes, 'products/newOffice!save',grid);
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
