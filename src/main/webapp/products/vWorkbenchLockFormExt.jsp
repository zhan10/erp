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
			{name:'productName',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'productId',
						fieldLabel:'<s:text name="vWorkbenchLock.productName"/>',
						xtype : 'combo',
						value : '',
						selectOnFocus : true,
						displayField : 'name',
						valueField : 'id',
						editable : true,
						store : cb_workbench_ds,
						listeners : {
							select : function() {
								this.up('form').getForm().findField(
										'productName').setValue(
										this.getRawValue());											
							}
						}
					},
					{
						flex:1,
						allowBlank:false,
						name:'quantity',
						fieldLabel:'<s:text name="vWorkbenchLock.quantity"/>'
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
						name:'lockFrom',
						itemId:'lockFrom',
						fieldLabel:'<s:text name="vOfficeLock.lockFrom"/>',
						xtype:'datetimefield',
						format: 'Y-m-d'				
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'lockTo',
						itemId:'lockTo',
						fieldLabel:'<s:text name="vOfficeLock.lockTo"/>',
						xtype:'datetimefield',
						format: 'Y-m-d'
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
					saveFormToDB(saveForm, 'products/workbenchLock!save',grid);
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
