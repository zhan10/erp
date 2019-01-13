<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	form = Ext.widget('form', {
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
null				]
			}
		],
		buttons : [ {
			text : '保存',
			id : 'btnSave',
			handler : function() {
				if (this.up('form').getForm().isValid()) {
					saveFormToDB(this.up('form'), 'hr/resource!save', function() {
						if (isEdit)
							form.form.updateRecord(form.activeRecord);
						else {
							ds.insert(0, form.getValues());
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
				</script>
