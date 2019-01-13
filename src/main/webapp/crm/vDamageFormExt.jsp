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
				{
					itemId : 'id',
					name : 'id',
					hidden : true
				},
				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [ {
						flex : 1,
						allowBlank : false,
						name : 'payTime',
						fieldLabel : '<s:text name="vDamage.payTime"/>',
						xtype : 'datefield',
						format : 'Y-m-d'
					}, {
						flex : 1,
						xtype : 'combo',
						displayField : 'name',
						valueField : 'id',
						forceSelection : true,
						allowBlank : false,
						store : cb_booking_ds,
						name : 'bookingId',
						fieldLabel : '<s:text name="vDamage.code"/>',
						listeners : {
							select : function() {
								this.up('form').getForm().findField(
										'code').setValue(
										this.getRawValue());
								var consumerId = this.findRecord('id',this.getValue()).get('consumerId');
								Ext.apply(cb_consumer_ds.proxy.extraParams,{whereSql : ' and id='+consumerId,order : order});
								cb_consumer_ds.loadPage(1);
							}
						}
					}, {
						flex : 1,
						name : 'code',
						hidden : true
					}]
				},
				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [ {
						flex : 1,
						xtype : 'combo',
						displayField : 'name',
						valueField : 'id',forceSelection:true,
						allowBlank : false,
						store : cb_consumer_ds,
						name : 'consumerId',
						selectOnFocus : true,
						fieldLabel : '<s:text name="vDamage.consumerName"/>',
						listeners : {
								select : function() {
								this.up('form').getForm().findField(
								'consumerName').setValue(
								this.getRawValue());
								}
						}
					}, {
						flex : 1,
						name : 'consumerName',
						hidden : true
					}, {
						flex : 1,
						allowBlank : false,
						name : 'payment',
						regex: /^\d+(\.\d{1,2})?$/,
						regexText:'请输入正确的数据类型',
						fieldLabel : '<s:text name="vDamage.payment"/>'
					} ]
				},
				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [{
						flex : 1,
						allowBlank : false,
						name : 'digest',
						fieldLabel : '<s:text name="vDamage.digest"/>'
					}]
				}, {
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [ {
						xtype: 'textarea',
						flex : 1,
						name : 'memo',
						height:80,
						fieldLabel : '<s:text name="vDamage.memo"/>'
					} ]
				} ],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
					saveFormToDB(saveForm, 'crm/damage!save', grid);
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
