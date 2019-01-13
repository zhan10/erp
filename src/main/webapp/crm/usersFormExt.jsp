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
		/* ,
									labelStyle : 'font-weight:bold' */
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
			items : [

			{
				flex : 1,
				name : 'name',
				fieldLabel : '<s:text name="users.name" />',
				allowBlank : false
			}, {
				flex : 1,
				name : 'code',
				fieldLabel : '<s:text name="users.code" />',
				allowBlank : false
			}, {
				flex : 1,
				name : 'password',
				fieldLabel : '<s:text name="users.password" />'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [

			{
				flex : 1,
				xtype : 'datefield',
				name : 'birth',
				fieldLabel : '<s:text name="users.birth" />',
				format : 'Y-m-d'
			}, {
				flex : 1,
				fieldLabel : '<s:text name="users.sex" />',
				xtype : 'radiogroup',
				columns : 2,
				defaults : {
					name : 'sex' //Each radio has the same name so the browser will make sure only one is checked at once
				},
				items : [ {
					inputValue : true,
					boxLabel : '男'
				}, {
					inputValue : false,
					boxLabel : '女'
				} ]

			}, {
				flex : 1,
				name : 'dept',
				fieldLabel : '<s:text name="users.dept" />'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [

			{
				flex : 1,
				fieldLabel : '<s:text name="users.enable" />',
				xtype : 'radiogroup',
				columns : 2,
				defaults : {
					name : 'enable' //Each radio has the same name so the browser will make sure only one is checked at once
				},
				items : [ {
					inputValue : true,

					checked : true,
					boxLabel : '允许'
				}, {
					inputValue : false,
					boxLabel : '禁止'
				} ]
			}, {
				flex : 2,
				//name : 'status',
				fieldLabel : '<s:text name="users.status" />',
				xtype : 'radiogroup',
				// columns: 2,
				defaults : {
					name : 'status' //Each radio has the same name so the browser will make sure only one is checked at once
				},
				items : [ {
					inputValue : 0,
					boxLabel : '在职ddd'
				}, {
					inputValue : 1,
					boxLabel : '在职'
				}, {
					inputValue : 2,
					boxLabel : '离职'
				}, {
					inputValue : 3,
					boxLabel : '病休'
				} ]
			} ]
		} ],

		buttons : [ {
			text : '保存',
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
			text : '关闭',
			id : 'btnClose',
			handler : function() {
				this.up('window').hide();
			}
		} ]
	});
</script>