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
						fieldLabel:'<s:text name="building.name"/>'
					}
					,
					{
						flex:1,
						name:'areaId',
						fieldLabel:'<s:text name="building.areaId"/>'
					}
					,
					{
						flex:1,
						name:'circleId',
						fieldLabel:'<s:text name="building.circleId"/>'
					}
					,
					{
						flex:1,
						name:'intro',
						fieldLabel:'<s:text name="building.intro"/>'
					}
					,
					{
						flex:1,
						name:'traffic',
						fieldLabel:'<s:text name="building.traffic"/>'
					}
					,
					{
						flex:1,
						name:'pic',
						fieldLabel:'<s:text name="building.pic"/>'
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
					saveFormToDB(saveForm, 'system/building!save',grid);
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
