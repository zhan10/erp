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
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				allowBlank : false,
				name : 'consumeType',
				fieldLabel : '<s:text name="consumeRecord.consumeType"/>'
			}, {
				flex : 1,
				allowBlank : false,
				name : 'consumeFrom',
				fieldLabel : '<s:text name="consumeRecord.consumeFrom"/>',
				xtype : 'datefield',
				format : 'Y-m-d'
			}, {
				flex : 1,
				name : 'consumeTo',
				fieldLabel : '<s:text name="consumeRecord.consumeTo"/>',
				xtype : 'datefield',
				format : 'Y-m-d'
			}, {
				flex : 1,
				allowBlank : false,
				name : 'consumerId',
				fieldLabel : '<s:text name="consumeRecord.consumerId"/>'
			}, {
				flex : 1,
				allowBlank : false,
				name : 'bookingId',
				fieldLabel : '<s:text name="consumeRecord.bookingId"/>'
			}, {
				flex : 1,
				name : 'relatedId',
				fieldLabel : '<s:text name="consumeRecord.relatedId"/>'
			} ]
		} ],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
					saveFormToDB(saveForm, 'crm/consumeRecord!save', grid);
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
