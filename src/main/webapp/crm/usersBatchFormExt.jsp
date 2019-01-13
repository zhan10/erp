<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	batchForm = Ext.widget('form', {
		id : 'batchForm',

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
				fieldLabel : '修改项目',
				allowBlank : false
			}, {
				flex : 1,
				name : 'value',
				fieldLabel : '设置新值　'
			} 
		],
		buttons : [ {
			text : '修改',
			id : 'btnSave',
			handler : function() {
				if (this.up('form').getForm().isValid()) {
					saveFormToDB(this.up('form'), 'hr/users!save', function() {

						if (isEdit)
							form.form.updateRecord(form.activeRecord);
						else {
							ds.insert(0, form.getValues());
						}
						/* this.up('form').getForm().updateRecord(
								sm.getSelected()); */
						//form.getForm().reset();
						win.hide();
					});

				}
			}
		}, {
			text : '取消',
			id : 'btnClose',
			handler : function() {
				this.up('window').hide();
			}
		} ]
	});
</script>