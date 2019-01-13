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
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'name',
						fieldLabel:'<s:text name="officeType.name"/>'
					},/* {
						flex:1,
						xtype : 'container',
						layout : 'hbox',
						defaultType : 'textfield',
						items : [
							{
								flex:2,
								allowBlank:false,
								itemId:'price',
								name:'price',
								fieldLabel:'<s:text name="officeType.price"/>',
								xtype : 'numberfield', minValue: 1,decimalPrecision:2,  
		   						 allowDecimals:true, hideTrigger: true,
		   						 listeners:{
		   			                blur:function(){
		   			                       var price = form.down('#price').getValue();
		   			                       var proportion = form.down('#proportion').getValue();
		   			                       if(proportion!=null && price!=null)
		   			                    	form.down('#priceAll').setValue(price*proportion);
		   			                     }
		   			            }
							},
							{
								flex : 1,
								labelWidth : 50,
								xtype : 'combo',
								displayField : 'text',
								valueField : 'value',
							    allowBlank : false,
								store : dateDs,
							    itemId : 'unit',
								name : 'unit',
								fieldLabel : '<s:text name="officeType.unit"/>'
							}
						]
					} */
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					/* {
						flex:1,
						allowBlank:false,
						name:'deposit',
						fieldLabel:'<s:text name="officeType.deposit"/>'
					}, */
					{
						flex:1,
						allowBlank:false,
						itemId:'price',
						name:'price',
						fieldLabel:'<s:text name="officeType.price"/>',
						xtype : 'numberfield', minValue: 1,decimalPrecision:2,  
   						 allowDecimals:true, hideTrigger: true,
   						 listeners:{
   			                blur:function(){
   			                       var price = form.down('#price').getValue();
   			                       var proportion = form.down('#proportion').getValue();
   			                       if(proportion!=null && price!=null)
   			                    	form.down('#priceAll').setValue(price*proportion);
   			                     }
   			            }
					},
					{
						flex:1,
						xtype : 'container',
						layout : 'hbox',
						defaultType : 'textfield',
						items : [
								{
									flex:2,
									allowBlank:false,
									name:'deposit',
									fieldLabel:'<s:text name="officeType.deposit"/>',
									xtype : 'numberfield', minValue: 0
								},
							/* {
								flex:2,
								allowBlank:false,
								itemId:'price',
								name:'price',
								fieldLabel:'<s:text name="officeType.price"/>',
								xtype : 'numberfield', minValue: 1,decimalPrecision:2,  
		   						 allowDecimals:true, hideTrigger: true,
		   						 listeners:{
		   			                blur:function(){
		   			                       var price = form.down('#price').getValue();
		   			                       var proportion = form.down('#proportion').getValue();
		   			                       if(proportion!=null && price!=null)
		   			                    	form.down('#priceAll').setValue(price*proportion);
		   			                     }
		   			            }
							}, */
							{
								flex : 1,
								labelWidth : 50,
								xtype : 'combo',
								displayField : 'text',
								valueField : 'value',
							    allowBlank : false,
								store : dateDs,
							    itemId : 'unit',
								name : 'unit',
								fieldLabel : '<s:text name="officeType.unit"/>'
							}
						]
					}
				]
			},
			/* {
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						itemId:'proportion',
						name:'proportion',
						fieldLabel:'<s:text name="officeType.proportion"/>',
						 listeners:{
				                blur:function(){
				                    var price = form.down('#price').getValue();
	   			                       var proportion = form.down('#proportion').getValue();
	   			                       if(proportion!=null && price!=null)
	   			                    	form.down('#priceAll').setValue(price*proportion);
				                     }
				            }
					},{
						flex:1,
						xtype : 'container',
						layout : 'hbox',
						defaultType : 'textfield',
						items : [
							{
								flex:2,
								allowBlank:false,
								itemId:'priceAll',
								name:'priceAll',
								fieldLabel:'<s:text name="officeType.priceAll"/>',
								xtype : 'numberfield', minValue: 1,decimalPrecision:2,
		   						 allowDecimals:true, hideTrigger: true
							},
						]
					}
				]
			}, */
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						 xtype: 'textarea',
							flex : 1,
							name : 'intro',
							height:350,
						fieldLabel:'<s:text name="officeType.intro"/>'
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
					saveFormToDB(saveForm, 'product/officeType!save',grid);
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
