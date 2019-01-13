<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	form = Ext
			.widget(
					'form',
					{
						id : 'form',
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
									name : 'id',
									hidden : true
								},
								{
									name : 'userName',
									id : 'userName',
									hidden : true
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [ {
										flex : 1,
										allowBlank : false,
										name : 'name',
										fieldLabel : '<s:text name="vStore.name"/>'
									} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [ {
										name : 'manager',
										id : 'manager',
										xtype : 'combo',
										value : '',
										fieldLabel : 'fieldLabel',
										selectOnFocus : true,
										displayField : 'name',
										valueField : 'id',
										editable : true,
										store : cb_users_ds,
										listeners : {
											select : function() {
												this
														.up('form')
														.getForm()
														.findField('userName')
														.setValue(
																this
																		.getRawValue());
											}
										}
									} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [ {
										flex : 1,
										name : 'position',
										fieldLabel : '<s:text name="vStore.position"/>'
									} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [ {
										flex : 1,
										name : 'memo',
										fieldLabel : '<s:text name="vStore.memo"/>'
									} ]
								} ],
						buttons : [
								{
									text : '保存',
									id : 'btnSave',
									handler : function() {
										if (this.up('form').getForm().isValid()) {
											saveFormToDB(
													this.up('form'),
													'system/store!save',
													function() {
														if (isEdit)
															form.form
																	.updateRecord(form.activeRecord);
														else {
															ds
																	.insert(
																			0,
																			form
																					.getValues());
														}
														win.hide();
													});
										}
									}
								}, {
									text : '关闭',
									id : 'btnClose',
									handler : function() {
										this.up('window').hide();
									}
								} ]
					});
	batchForm = Ext
			.widget(
					'form',
					{
						id : 'batchForm',
						autoScroll : true,
						overflowX : 'scroll',
						overflowY : 'scroll',
						frame : true,
						border : false,
						bodyPadding : 10,
						defaultType : 'textfield',
						fieldDefaults : {
							labelAlign : 'right',
							labelWidth : 100
						/* ,
													labelStyle : 'font-weight:bold' */
						},
						defaults : {
							margins : '0 0 10 0'
						},

						items : [

								{
									flex : 1,
									name : 'name',
									itemId : 'name',
									fieldLabel : '修改项目',
									allowBlank : false,
									xtype : 'combo',
									selectOnFocus : true,
									store : [
											[ 'manager',
													'<s:text name="vStore.manager"/>' ],
											[ 'position',
													'<s:text name="vStore.position"/>' ] ],
									listeners : {
										select : function() {
											if (this.value == 'manager') {
												this.up('form').getForm()
														.findField(
																'managerValue')
														.setVisible(true);
												this
														.up('form')
														.getForm()
														.findField(
																'positionValue')
														.setVisible(false);
												this.up('form').getForm()
														.findField(
																'managerValue')
														.setDisabled(false);
												this
														.up('form')
														.getForm()
														.findField(
																'positionValue')
														.setDisabled(true);
											}
											if (this.value == 'position') {
												this.up('form').getForm()
														.findField(
																'managerValue')
														.setVisible(false);
												this
														.up('form')
														.getForm()
														.findField(
																'positionValue')
														.setVisible(true);
												this.up('form').getForm()
														.findField(
																'managerValue')
														.setDisabled(true);
												this
														.up('form')
														.getForm()
														.findField(
																'positionValue')
														.setDisabled(false);
											}
										}
									}
								}, {
									flex : 1,
									name : 'value',
									itemId : 'value',
									fieldLabel : '设置新值',
									id : 'managerValue',
									xtype : 'combo',
									value : '',
									selectOnFocus : true,
									displayField : 'name',
									valueField : 'id',
									editable : true,
									store : cb_users_ds,
									hidden : false
								}, {
									flex : 1,
									name : 'value',
									fieldLabel : '设置新值',
									id : 'positionValue',
									hidden : true
								} ],

						buttons : [
								{
									text : '更新',
									handler : function() {
										if (this.up('form').getForm().isValid()) {
											updateFieldsToDB(
													this.up('form'),
													sm,
													'system/store!updateFields',
													function() {
														var r = sm
																.getSelection();
														var t_name = batchForm
																.getForm()
																.findField(
																		'name')
																.getValue();
														for ( var i = 0; i < r.length; i++) {
															r[i]
																	.set(
																			t_name,
																			batchForm
																					.getForm()
																					.findField(
																							t_name
																									+ 'Value')
																					.getValue());

															if (t_name == 'manager')
																r[i]
																		.set(
																				'userName',
																				batchForm
																						.getForm()
																						.findField(
																								t_name
																										+ 'Value')
																						.getRawValue());
														}
														batchWin.hide();
													});

										}
									}
								}, {
									text : '关闭',
									handler : function() {
										this.up('window').hide();
									}
								} ]
					});
</script>
