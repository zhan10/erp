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
			labelWidth : 80
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
						fieldLabel:'<s:text name="roles.name"/>'
					}
					,
					{
						flex:1,
						name:'info',
						fieldLabel:'<s:text name="roles.info"/>'
					}
				]
			},{
				xtype : 'container',
				layout : {type:'hbox', align: 'middle'},width:50,			
				items : [users_grid,{itemId:'btnMove',xtype : 'container',//height:400,
					layout : {type:'vbox', pack:'center',
                        align:'center'},items:[{xtype:'button',
				    iconCls: 'moveRight',	tooltip : '移出用户',
				   // margin:'200,5,0,5',
				    handler: function() {
				    	var recs=users_grid.getSelectionModel().getSelection();
				    	users_ds.remove(recs);
						select_users_ds.insert(0,recs);
				    }
				},{xtype:'button',
				    iconCls: 'moveLeft',	tooltip : '添加用户',
				    handler: function() {
				    	var recs=select_users_grid.getSelectionModel().getSelection();
				    	select_users_ds.remove(recs);
						users_ds.insert(0,recs);
				    }
				}]},select_users_grid]}
		],
		buttons : [ {
			text : '保存',
			id : 'btnSave',
			handler : function() {
				///
				var saveForm = this.up('form');
				if(!saveForm.getForm().isValid()){
					return;
				}
				var saveFormJson = Ext.JSON.encode(saveForm.getForm().getValues());
				var gridJsonStr = "";
				for (var i = 0; i < users_ds.getCount(); i++) {						
					gridJsonStr += "{id:"+users_ds.getAt(i).data['id']+"}";
					if (i < users_ds.getCount() - 1)
						gridJsonStr += ",";					
				}				
				if(!gridJsonStr=="")
					gridJsonStr="{usersItem:["+gridJsonStr+"]}";
				Ext.Msg.wait("请等候", "保存数据", "保存数据进行中...");				
				Ext.Ajax.request({
					url : 'system/roles!saveUsers',
					timeout : 60000,
					params : {
							extJson : saveFormJson,
							others :gridJsonStr
					},
					method : 'post',
					success : function(response) {
						var responseText = response.responseText;
						if (responseText.indexOf('topit_ext_id!') != 0) {
							Ext.Msg.alert('错误', (response.responseText));
						} else {
							Ext.Msg.alert('恭喜', "数据保存成功!", function() {
								if (saveForm.down('#id').getValue() == '') {
									// 新增记录
									saveForm.down('#id')
												.setValue(
														responseText.substring(13,
																responseText.length));						
									ds.insert(0, saveForm.getValues());
								} else {
									saveForm.updateRecord();
								}
								saveForm.up('window').hide();
							});
						}
					},
					failure : function(response) {
						Ext.Msg.alert('错误', (response.responseText));
					}
				});
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
