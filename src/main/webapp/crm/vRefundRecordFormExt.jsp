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
			{name:'relatedId',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [ {
					flex : 1,
					name : 'bookingId',
					allowBlank : false,
					fieldLabel : '<s:text name="vRefundRecord.code"/>',
					xtype : 'combo',
					value : '',
					selectOnFocus : true,
					forceSelection:true,
					displayField : 'name',
					valueField : 'id',
					editable : true,
					store : cb_booking_ds,
					listeners : {
						select : function() {
							this.up('form').getForm()
							.findField('code').setValue(
			                this.getRawValue());
							var consumerId = this.findRecord('id',this.getValue()).get('consumerId');
							Ext.apply(cb_consumer_ds.proxy.extraParams,{whereSql : ' and id='+consumerId,order : order});
							cb_consumer_ds.loadPage(1);
						}
					}
				},
				{
					flex : 1,
					name : 'code',
					hidden : true
				} ]
			},
			{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [
							{
								flex : 1,
								name : 'consumerId',
								allowBlank : false,
								forceSelection:true,
								fieldLabel : '<s:text name="vRefundRecord.consumerName"/>',
								xtype : 'combo',
								value : '',
								selectOnFocus : true,
								displayField : 'name',
								valueField : 'id',
								editable : true,
								store : cb_consumer_ds,
								listeners : {
									select : function() {
										this
												.up('form')
												.getForm()
												.findField(
														'consumerName')
												.setValue(
														this
																.getRawValue());
									}
								}
							},
							{
								flex : 1,
								name : 'consumerName',
								hidden : true
							},
					{
								flex : 1,
								allowBlank : false,
								name : 'refundTime',
								xtype:'datetimefield',
								format: 'Y-m-d',
								fieldLabel : '<s:text name="vRefundRecord.refundTime"/>'

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
						name:'amount',
						regex: /^\d+(\.\d{1,2})?$/,
						regexText:'请输入正确的数据类型',
						fieldLabel:'<s:text name="vRefundRecord.amount"/>'
					}
					,
					{
						flex:1,
						name:'tel',
						fieldLabel:'<s:text name="vRefundRecord.tel"/>',
						regex:/^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/,
				        regexText:'请输入正确的手机号'
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
						name:'memo',
						height:80,
						fieldLabel:'<s:text name="vRefundRecord.memo"/>'
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
					saveFormToDB(saveForm, 'crm/refundRecord!save',grid);
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
