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
						name:'checkedTime',
						fieldLabel:'<s:text name="health.checkedTime"/>',
						xtype:'datefield',
						format: 'Y-m-d H:i:s'					
					},
					{
						flex:1,
						name:'height',
						fieldLabel:'<s:text name="health.height"/>',
						regex: /^\d{3}$/,
						regexText:'请输入正确的数据类型'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'weight',
						fieldLabel:'<s:text name="health.weight"/>',
						regex:/^[1-9]\d{1,2}$/,
						regexText:'请输入正确的数据类型'
					}
					,
					{
						flex:1,
						name:'diastolicPressure',
						fieldLabel:'<s:text name="health.diastolicPressure"/>',
						regex:/^[1-9]\d{1,2}$/,
						regexText:'请输入正确的数据类型'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'systolicPressure',
						fieldLabel:'<s:text name="health.systolicPressure"/>',
						regex:/^[1-9]\d{1,2}$/,
						regexText:'请输入正确的数据类型'
					}
					,
					{
						flex:1,
						name:'bodyFatRatio',
						fieldLabel:'<s:text name="health.bodyFatRatio"/>',
						regex:/^[1-9]\d{1,2}$/,
						regexText:'请输入正确的数据类型'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'oxygenSaturation',
						fieldLabel:'<s:text name="health.oxygenSaturation"/>',
						regex:/^[1-9]\d{1,2}$/,
						regexText:'请输入正确的数据类型'
					}
					,
					{
						flex:1,
						name:'pulse',
						fieldLabel:'<s:text name="health.pulse"/>',
						regex:/^[1-9]\d{1,2}$/,
						regexText:'请输入正确的数据类型'
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
					saveFormToDB(saveForm, 'crm/health!save',grid);
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
