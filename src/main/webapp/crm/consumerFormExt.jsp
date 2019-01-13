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
		items : [ {
			itemId : 'id',
			name : 'id',
			hidden : true
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [{
				flex : 1,
				allowBlank : false,
				name : 'type',
				id : 'type',
				xtype : 'combo',
				displayField : 'text',forceSelection:true,
				valueField : 'value',
				store : [ [ 2, '个人' ], [ 1, '单位' ] ],
				fieldLabel : '<s:text name="consumer.type" />'
			} , {
				flex : 1,
				allowBlank : false,
				name : 'points',
				id:'points',
				xtype : 'numberfield', minValue: 0,
				fieldLabel : '<s:text name="consumer.points"/>'
			}, {
				flex : 1,
				fieldLabel : '<s:text name="consumer.balance" />',
				xtype : 'radiogroup',
				columns : 2,
				id:'balan',
				defaults : {
					name : 'balance' //Each radio has the same name so the browser will make sure only one is checked at once
				},
				items : [ {
					inputValue : true,
					boxLabel : '已结清'
				}, {
					inputValue : false,
					boxLabel : '未结清'
				} ]

			}]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				allowBlank : false,
				name : 'name',
				id : 'name',
				fieldLabel : '<s:text name="consumer.name"/>'
			}, {
				flex : 1,
				allowBlank : false,
				name : 'loginName',
				id:'loginName',
				fieldLabel : '<s:text name="consumer.loginName"/>'
			},{
				flex : 1,
				fieldLabel : '<s:text name="consumer.sex" />',
				xtype : 'radiogroup',
				columns : 2,
				id:'sexs',
				defaults : {
					name : 'sex'
				},
				items : [ {
					inputValue : true,
					boxLabel : '男'
				}, {
					inputValue : false,
					boxLabel : '女'
				} ]

			}]
		},  {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				xtype : 'datefield',
				name : 'birth',
				id : 'birth',
				fieldLabel : '<s:text name="consumer.birth" />',
				format : 'Y-m-d'
			} ,{
				flex : 1,
				name : 'tel',
				id : 'tel',
				fieldLabel : '<s:text name="consumer.tel"/>',
				regex:/^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/,
				regexText:'请输入正确的手机号'
			}, {
				flex : 1,
				name : 'email',
				id : 'email',
				fieldLabel : '<s:text name="consumer.email"/>',
				vtype:"email",
				vtypeText:'请输入正确的邮箱格式'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				name : 'officeAddress',
				itemId:'officeAddress',
				fieldLabel : '<s:text name="consumer.officeAddress"/>'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				name : 'address',
				id:'address',
				fieldLabel : '<s:text name="consumer.address"/>'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				allowBlank : false,
				name : 'certificate',
				id : 'certificate',
				fieldLabel : '<s:text name="consumer.certificate"/>',
				xtype:'combobox',
				store:[[0,''],[1,'身份证'],[2,'护照'],[2,'其它']]				
			}, {
				flex : 1,
				name : 'certificateCode',
				id : 'certificateCode',
				allowBlank : false,
				fieldLabel : '<s:text name="consumer.certificateCode"/>',
				regex : /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,
	            regexText : '输入正确的身份号码'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				name : 'cardType',
				id : 'cardType',
				fieldLabel : '<s:text name="consumer.cardType"/>',
				xtype:'combobox',
				store:[[0,''],[1,'绿地卡'],[2,'招商卡']]				
			}, {
				flex : 1,
				name : 'cardCode',
				id : 'cardCode',
				fieldLabel : '<s:text name="consumer.cardCode"/>'
			} ]
		}/* ,

		{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [  {
				flex : 1,
				name : 'pwd',
				allowBlank : false,
				fieldLabel : '<s:text name="consumer.pwd"/>'
			} ]
		}  */
		,{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [ {
						xtype : 'filefield',
						flex : 1,
						name : 'uploadFile',
						id : 'uploadFile',
						emptyText : '请选择上传文件...',
						fieldLabel : '<s:text name="consumer.pic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}

					}, {
						fieldLabel : '<s:text name="consumer.pic"/>',
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
				}],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
							saveFile(saveForm, 'uploadFile', fileTypes,
									'system/consumer!save', grid);			
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
