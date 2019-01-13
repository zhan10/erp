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
		items : [ {
			itemId : 'id',
			name : 'id',
			hidden : true
		},{
			itemId : 'price',
			name : 'price',
			hidden : true
		},{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			hidden : true,
			items : [ {
				flex : 1,
				xtype : 'combo',
				displayField : 'text',forceSelection:true,
				valueField : 'value',
				value:true,
				allowBlank : false,
				store : [ [ false, '未结算' ], [ true, '已结算' ] ],
				name : 'balance',
				itemId:'balance',
				fieldLabel : '<s:text name="vConsumeRecord.balance"/>'
			} ]
		},{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items:[{
				flex : 1,
				xtype : 'combo',
				displayField : 'name',
				valueField : 'id',forceSelection:true,
				allowBlank : false,
				store : cb_consumeArea_ds,
				name : 'consumeAreaId',
				itemId : 'consumeAreaId',
				fieldLabel : '<s:text name="consumeArea.name"/>',
				selectOnFocus :true,
				listeners : {
						select : function() {
						this.up('form').getForm().findField(
						'consumeAreaName').setValue(
						this.getRawValue());
						}
				}
			}, {
				flex : 1,
				name : 'consumeAreaName',
				hidden : true
			},]
		},{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [{
				flex : 1,
				xtype : 'combo',
				displayField : 'name',
				valueField : 'id',forceSelection:true,
				allowBlank : false,
				store : cb_booking_ds,
				name : 'bookingId',
				itemId : 'bookingId',
				fieldLabel : '<s:text name="vConsumeRecord.bookingCode"/>',
				listeners : {
						select : function() {
						this.up('form').getForm().findField(
						'bookingCode').setValue(
						this.getRawValue());
						var consumerId = this.findRecord('id',this.getValue()).get('consumerId');
						Ext.apply(cb_consumer_ds.proxy.extraParams,{whereSql : ' and id='+consumerId,order : order});
						cb_consumer_ds.loadPage(1);
						}
				}
			},{
				flex : 1,
				name : 'bookingCode',
				hidden : true
			},{
				flex : 1,
				xtype : 'combo',
				displayField : 'name',
				valueField : 'id',forceSelection:true,
				allowBlank : false,
				value : '',
				store : cb_consumer_ds,
				name : 'consumerId',
				itemId : 'consumerId',
				selectOnFocus : true,
				fieldLabel : '<s:text name="vConsumeRecord.consumerName"/>',
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
			}]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ 		
				{
				flex : 1,
				xtype : 'combo',
				displayField : 'name',
				valueField : 'id',forceSelection:true,
				allowBlank : false,
				store : cb_consumeType_ds,
				name : 'consumeTypeId',
				itemId : 'consumeTypeId',
				fieldLabel : '<s:text name="vConsumeRecord.consumeType"/>',
				listeners : {
						select : function() {
						this.up('form').getForm().findField(
						'consumeName').setValue(
						this.getRawValue());
						var price = this.findRecord('id',this.getValue()).get('price');
						form.down('#price').setValue(price);
						},
				select : function(){
						var chargeType = this.findRecord('id',this.getValue()).get('chargeType');
						if(chargeType==1){
							//时间
							form.down('#consumeDate').setVisible(true);
							form.down('#number').setVisible(false);
						}else{
							//数量
							form.down('#consumeDate').setVisible(false);
							form.down('#number').setVisible(true);
						}
						
					}
				}
			},{
				flex : 1,
				name : 'consumeName',
				hidden : true
			}, {
				flex : 1,
				xtype : 'fieldcontainer',
				layout:"hbox", 
				items:[{	
				    	    xtype: 'numberfield',
				    	    minValue:0,
				    	    name : 'consumeAmount',
				    	    itemId : 'consumeAmount',
				    	    width: 230,
							//allowBlank : false,
							fieldLabel : '<s:text name="vConsumeRecord.consumeAmount"/>'
						},{
							flex : 1,
							xtype : 'button',
							itemId : 'btnCount',
							width : 50,
							text :  '计算',
							handler : function() {
								var price = form.down('#consumeTypeId').findRecord('id',form.down('#consumeTypeId').getValue()).get('price');
								var chargeType = form.down('#consumeTypeId').findRecord('id',form.down('#consumeTypeId').getValue()).get('chargeType');
								if(chargeType==1){
									var from = form.down('#consumeFrom').getValue();
									var to = form.down('#consumeTo').getValue();
									var consumeTime = (to.getTime() - from.getTime())/1000/60/60;
									var total = price * consumeTime;
									form.down('#consumeAmount').setValue(total);
								}else{
									var number = form.down('#number').getValue();
									var total = price * number;
									form.down('#consumeAmount').setValue(total);
								}
							}
						}]
				
			}]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				xtype : 'combo',
				displayField : 'name',forceSelection:true,
				valueField : 'id',
				allowBlank : false,
				store : cb_paymentType_ds,
				itemId : 'paymentTypeId',
				name : 'paymentTypeId',
				fieldLabel : '<s:text name="vConsumeRecord.paymentName"/>',
				listeners : {
						select : function() {
						this.up('form').getForm().findField(
						'paymentName').setValue(
						this.getRawValue());
						}
				}
			},{
				flex : 1,
				name : 'paymentName',
				hidden : true
			} ,{
				flex : 1,
				itemId : 'usersName',
				name : 'usersName',
				fieldLabel : '<s:text name="vConsumeRecord.usersName"/>',
			}]
		}, {
			xtype : 'container',
			itemId : 'consumeDate',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				name : 'consumeFrom',
				itemId : 'consumeFrom', 
				fieldLabel : '<s:text name="vConsumeRecord.consumeFrom"/>',
				xtype:'datetimefield',
				format: 'Y-m-d'
			}, {
				flex : 1,
				name : 'consumeTo',
				itemId : 'consumeTo',
				fieldLabel : '<s:text name="vConsumeRecord.consumeTo"/>',
				xtype:'datetimefield',
				format: 'Y-m-d'
			} ]
		} , {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [{
				flex : 1,
				name : 'number',
				hidden : true,
				itemId : 'number', 
				xtype:'numberfield',
				minValue:0,
				fieldLabel : '<s:text name="vConsumeRecord.number"/>'
			}]
		}
		],
		buttons : [{
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
			//alert(cb_consumeArea_ds.getAt(5).get('id'));
			//alert(cb_consumeArea_ds.getAt(1).get('name'));
				var saveForm = this.up('form');
				//alert(form.down('#id').getValue());
				if (saveForm.getForm().isValid()) {	
					saveFormToDB(saveForm, 'crm/consumeRecord!save',grid);
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
