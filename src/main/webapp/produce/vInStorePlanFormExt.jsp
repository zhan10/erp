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
			{name:'id',hidden:true},{name:'storeName',hidden:true},{name:'inputerName',hidden:true},{name:'checkerName',hidden:true},{name:'deliverName',hidden:true},{name:'accepterName',hidden:true},{name:'storeKeeper',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'code',
						fieldLabel:'<s:text name="vInStorePlan.code"/>'
					}
					,
					{
						flex:1,
						name:'deliverDept',
						fieldLabel:'<s:text name="vInStorePlan.deliverDept"/>'
					},
					{
						flex:1,
						name:'inputer',
						fieldLabel:'<s:text name="vInStorePlan.inputer"/>'
					},{
						flex:1,
						name:'inputDate',
						fieldLabel:'<s:text name="vInStorePlan.inputDate"/>'
					}
					
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [, {
        xtype: 'timefield',
        name: 'out',
        fieldLabel: 'Time Out',
        minValue: '0:00',
        maxValue: '24:00',
        increment: 15,
        anchor: '100%'
   },
					{
						flex:1,
						name:'caseNum',
						fieldLabel:'<s:text name="vInStorePlan.caseNum"/>'
					},
					{
						flex:1,
						name:'sumWeight',
						fieldLabel:'<s:text name="vInStorePlan.sumWeight"/>'
					},{
						flex:1,
						name:'checker',
						fieldLabel:'<s:text name="vInStorePlan.checker"/>'
					},{
						flex:1,
						name:'checkDate',
						fieldLabel:'<s:text name="vInStorePlan.checkDate"/>'
					}
					
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						xtype     : 'textareafield',
       					grow      : true,
						flex:1,
						name:'memo',
						height:50,						
						fieldLabel:'<s:text name="vInStorePlan.memo"/>'
					}
					
				]
			}
		],
		buttons : [ {
			text : '保存',
			id : 'btnSave',
			handler : function() {
				if (this.up('form').getForm().isValid()) {
					saveFormToDB(this.up('form'), 'store/inStorePlan!save', function() {
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
	batchForm = Ext.widget('form',{
		id : 'batchForm',
		autoScroll : true,
		overflowX:'scroll',
		overflowY : 'scroll',
		frame : true,
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
		items :[{
			flex : 1,
			name : 'name',
			fieldLabel : '修改项目',
			allowBlank : false,
			xtype : 'combo',
			selectOnFocus : true,
			store : [
				['deliver_dept','<s:text name="vInStorePlan.deliverDept"/>']
				,['deliver_name','<s:text name="vInStorePlan.deliverName"/>']
				,['accepter_name','<s:text name="vInStorePlan.accepterName"/>']
				,['source_type','<s:text name="vInStorePlan.sourceType"/>']
			],
			listeners : {
				select : function() {
					if(this.value=='deliverDept'){
						this.up('form').getForm().findField('deliverDeptValue').setVisible(true);
						this.up('form').getForm().findField('deliverDeptValue').setDisable(false);
						this.up('form').getForm().findField('deliverNameValue').setVisible(false);
						this.up('form').getForm().findField('deliverNameValue').setDisable(true);
						this.up('form').getForm().findField('accepterNameValue').setVisible(false);
						this.up('form').getForm().findField('accepterNameValue').setDisable(true);
						this.up('form').getForm().findField('sourceTypeValue').setVisible(false);
						this.up('form').getForm().findField('sourceTypeValue').setDisable(true);
					}
					if(this.value=='deliverName'){
						this.up('form').getForm().findField('deliverNameValue').setVisible(true);
						this.up('form').getForm().findField('deliverNameValue').setDisable(false);
						this.up('form').getForm().findField('deliverDeptValue').setVisible(false);
						this.up('form').getForm().findField('deliverDeptValue').setDisable(true);
						this.up('form').getForm().findField('accepterNameValue').setVisible(false);
						this.up('form').getForm().findField('accepterNameValue').setDisable(true);
						this.up('form').getForm().findField('sourceTypeValue').setVisible(false);
						this.up('form').getForm().findField('sourceTypeValue').setDisable(true);
					}
					if(this.value=='accepterName'){
						this.up('form').getForm().findField('accepterNameValue').setVisible(true);
						this.up('form').getForm().findField('accepterNameValue').setDisable(false);
						this.up('form').getForm().findField('deliverDeptValue').setVisible(false);
						this.up('form').getForm().findField('deliverDeptValue').setDisable(true);
						this.up('form').getForm().findField('deliverNameValue').setVisible(false);
						this.up('form').getForm().findField('deliverNameValue').setDisable(true);
						this.up('form').getForm().findField('sourceTypeValue').setVisible(false);
						this.up('form').getForm().findField('sourceTypeValue').setDisable(true);
					}
					if(this.value=='sourceType'){
						this.up('form').getForm().findField('sourceTypeValue').setVisible(true);
						this.up('form').getForm().findField('sourceTypeValue').setDisable(false);
						this.up('form').getForm().findField('deliverDeptValue').setVisible(false);
						this.up('form').getForm().findField('deliverDeptValue').setDisable(true);
						this.up('form').getForm().findField('deliverNameValue').setVisible(false);
						this.up('form').getForm().findField('deliverNameValue').setDisable(true);
						this.up('form').getForm().findField('accepterNameValue').setVisible(false);
						this.up('form').getForm().findField('accepterNameValue').setDisable(true);
					}
				}
			}
		}
		,{
			flex : 1,
			name : 'value',
			fieldLabel : '设置新值',
			id:'deliverDeptValue',
			hidden:false
		}
		,{
			flex : 1,
			name : 'value',
			itemId : 'value',
			fieldLabel : '设置新值',
			id:'deliverNameValue'
			,hidden:true
		}
		,{
			flex : 1,
			name : 'value',
			itemId : 'value',
			fieldLabel : '设置新值',
			id:'accepterNameValue'
			,hidden:true
		}
		,{
			flex : 1,
			name : 'value',
			itemId : 'value',
			fieldLabel : '设置新值',
			id:'sourceTypeValue'
			,hidden:true
		}
		],
		buttons:[
			{
				text : '更新',
				handler : function() {
					if (this.up('form').getForm().isValid()) {
						updateFieldsToDB(this.up('form'),sm,'store/inStorePlan!updateFields',
						function() {
							var r = sm.getSelection();
							var t_name = batchForm.getForm().findField('name').getValue();
							for ( var i = 0; i < r.length; i++) {
								r[i].set(t_name,batchForm.getForm().findField(t_name+ 'Value').getValue());
							}
							batchWin.hide();
						});
					}
				}
			},{
				text : '关闭',
				handler : function() {
					this.up('window').hide();
				}
			}]
		});
</script>
