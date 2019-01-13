<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	form = Ext.widget('form', {
		fileUpload : true,
		enctype : 'multipart/form-data',
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
				{
					itemId : 'id',
					name : 'id',
					hidden : true
				}, 
				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [
							{
								width : 200,
								name : 'cityId',
								fieldLabel : '<s:text name="vCircle.cityName"/>',
								xtype : 'combo',
								value : '',
								selectOnFocus : true,
								displayField : 'name',
								valueField : 'id',
								editable : true,
								store : cb_cities_ds,
								listeners : {
									select : function() {
										this.up('form').getForm().findField(
												'cityName').setValue(
												this.getRawValue());
									}
								}
							}, {
								flex : 1,
								name : 'cityName',
								hidden : true
							}, {
								flex : 1,
								allowBlank : false,
								name : 'name',
								fieldLabel : '<s:text name="vCircle.name"/>'
							}

					]
				},

				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [ {
						xtype : 'filefield',
						flex : 1,
						name : 'uploadFile',
						id : 'uploadFile',
						emptyText : '请选择上传文件...',
						fieldLabel : '<s:text name="circle.pic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}

					}, {
						fieldLabel : '<s:text name="circle.pic"/>',
						xtype : 'displayfield',
						itemId : 'fileShow',
						name : 'fileShow',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						hidden : true,
						itemId : 'pic',
						name : 'pic',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						xtype : 'checkbox',
						boxLabel : '删除附件',
						value : 1,
						name : 'delFileFlag',
						itemId : 'delFileFlag',
						style : "margin-left:70px",
						hideLabel : true,
						width : 150,
						itemCls : 'left-float',
						clearCls : 'allow-float'
					} ]
				}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
			 xtype: 'textarea',
				flex : 1,
				name : 'intro',
				height:300,
				fieldLabel : '<s:text name="circle.intro"/>'
			} ]
		}
			],
		buttons : [
				{
					text : '保存',
					itemId : 'btnSave',
					handler : function() {
						var saveForm = this.up('form');
						if (saveForm.getForm().isValid()) {
							saveFile(saveForm, 'uploadFile', fileTypes,
									'product/circle!save', grid);
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
