<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	form = Ext.widget('form', {
		fileUpload : true,
		enctype : 'multipart/form-data',
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
				name : 'serviceName',
				fieldLabel : '<s:text name="city.serviceName"/>'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				allowBlank : false,
				name : 'serviceTel',
				fieldLabel : '<s:text name="city.serviceTel"/>'
			} ]
		}/* , {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				allowBlank : false,
				name : 'name',
				fieldLabel : '<s:text name="city.name"/>'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
			 xtype: 'textarea',
				flex : 1,
				name : 'intro',
				height:300,
				fieldLabel : '<s:text name="city.intro"/>'
			} ]
		} , {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [

			{
				xtype : 'filefield',
				flex : 1,
				name : 'uploadFile',
				id:'uploadFile',
				emptyText : '请选择上传文件...',
				fieldLabel : '<s:text name="city.pic"/>',
				buttonText : '',
				buttonConfig : {
					iconCls : 'uploadPic'
				}

			}, {
				fieldLabel : '<s:text name="city.pic"/>',
				xtype : 'displayfield',
				itemId : 'fileShow',
				name : 'fileShow',
				itemCls : 'left-float',
				clearCls : 'allow-float'
			}, {
				hidden:true,
				itemId : 'pic',
				name : 'pic',
				itemCls : 'left-float',
				clearCls : 'allow-float'
			}, {
				xtype : 'checkbox',
				boxLabel : '删除附件',value:1,
				name : 'delFileFlag',
				itemId : 'delFileFlag',
				style : "margin-left:70px",
				hideLabel : true,
				width : 150,
				itemCls : 'left-float',
				clearCls : 'allow-float'
			} ]
		} */],
		buttons : [
				{
					text : '保存',
					itemId : 'btnSave',
					handler : function() {
						var saveForm = this.up('form');
						if (saveForm.getForm().isValid()) {
							/* saveFile(saveForm, 'uploadFile', fileTypes,
									'product/city!save', grid); */
							saveFormToDB(saveForm, 'product/city!save',grid);
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
				['name','<s:text name="city.name"/>']
				,['intro','<s:text name="city.intro"/>']
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
	itemId:'name'
		}
		,{
			flex : 1,
			name : 'value',
			fieldLabel : '设置新值',
	itemId:'intro'
			,hidden:true
		}
		],
		buttons:[
			{
				text : '更新',
				handler : function() {
					var saveForm = this.up('form');
					if (saveForm.getForm().isValid()) {
						updateFieldsToDB(saveForm,sm,'product/city!updateFields',function() {});
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
</script>
