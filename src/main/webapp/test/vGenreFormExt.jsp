<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	form = Ext
			.widget(
					'form',
					{
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
												flex : 1,
												itemId : 'productTypeId',
												name : 'productTypeId',
												allowBlank : false,
												fieldLabel : '<s:text name="genre.productTypeName"/>',
												xtype : 'combo',
												value : '',
												selectOnFocus : true,
												displayField : 'name',
												valueField : 'id',
												editable : true,
												store : cb_productType_ds,
												listeners : {
													select : function() {
														this
																.up('form')
																.getForm()
																.findField(
																		'productTypeName')
																.setValue(
																		this
																				.getRawValue());
													}
												}
											},
											{
												flex : 1,
												name : 'productTypeName',
												hidden : true
											},
											{
												flex : 1,
												allowBlank : false,
												name : 'name',
												fieldLabel : '<s:text name="genre.name"/>'
											}, ]
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
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [ {
										xtype : 'textarea',
										flex : 1,
										name : 'intro',
										height : 300,
										fieldLabel : '<s:text name="genre.intro"/>'
									} ]
								} ],
						buttons : [
								{
									text : '保存',
									itemId : 'btnSave',
									handler : function() {
										var saveForm = this.up('form');
										if (saveForm.getForm().isValid()) {
											saveFormToDB(saveForm,
													'system/genre!save', grid);
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
