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
						fieldLabel:'<s:text name="area.name"/>'
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
						name:'intro',
						fieldLabel:'<s:text name="area.intro"/>'
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
						name:'cityId',
						fieldLabel:'<s:text name="area.cityId"/>'
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
						name:'pic',
						fieldLabel:'<s:text name="area.pic"/>'
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
					saveFormToDB(saveForm, 'system/area!save',grid);
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
	batchForm = Ext.widget('form',{
		itemId : 'batchForm',
		autoScroll : true,
		frame : true,
		border : false,
		layout : {
			type : 'vbox',
			align : 'stretch'
		},
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
			itemId:'selectName',
			fieldLabel : '修改项目',
			allowBlank : false,
			xtype : 'combo',
			forceSelection: true,
			store : [
				['city_id','<s:text name="area.cityId"/>']
			],
			listeners : {
				select : function() {
					var nodes = this.up('form').query('[name=value]');
					for (i = 0; i < nodes.length; i++) {
						if (nodes[i].getItemId() == (this.value)) {
							nodes[i].setDisabled(false);
							nodes[i].setVisible(true);
						} else {
							nodes[i].setDisabled(true);
							nodes[i].setVisible(false);
						}
					}
				}
			}
		}
		,{
			flex : 1,
			name : 'value',
			fieldLabel : '设置新值',
	itemId:'cityId'
		}
		],
		buttons:[
			{
				text : '更新',
				handler : function() {
					var saveForm = this.up('form');
					if (saveForm.getForm().isValid()) {
						updateFieldsToDB(saveForm,sm,'system/area!updateFields',function() {});
					}
				}
			},{
				text : '取消',
				handler : function() {
					this.up('window').hide();
				}
			}]
		});
</script>
