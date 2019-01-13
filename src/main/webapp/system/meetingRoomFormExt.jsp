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
						fieldLabel:'<s:text name="meetingRoom.name"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'price',
						fieldLabel:'<s:text name="meetingRoom.price"/>'
					}
					,
					{
						flex:1,
						name:'intro',
						fieldLabel:'<s:text name="meetingRoom.intro"/>'
					}
					,
					{
						flex:1,
						name:'pic',
						fieldLabel:'<s:text name="meetingRoom.pic"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'galleryful',
						fieldLabel:'<s:text name="meetingRoom.galleryful"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'floorId',
						fieldLabel:'<s:text name="meetingRoom.floorId"/>'
					}
					,
					{
						flex:1,
						name:'equipment',
						fieldLabel:'<s:text name="meetingRoom.equipment"/>'
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
					saveFormToDB(saveForm, 'system/meetingRoom!save',grid);
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
