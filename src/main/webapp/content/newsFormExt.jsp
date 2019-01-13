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
						name:'title',
						fieldLabel:'<s:text name="news.newsTitle"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'site',
						fieldLabel:'<s:text name="news.site"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'activityTime',
						fieldLabel:'<s:text name="news.activityTime"/>',
						xtype:'datetimefield',
						format: 'Y-m-d'
					}
				]
			}, {
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
			},
			/* ,{
				flex : 1,
				xtype : 'filefield',
				name:'pic',
				fieldLabel : '<s:text name="news.pic"/>',
				buttonText : '',
				buttonConfig : {
					iconCls : 'uploadPic'
				}
			} */
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						xtype: 'textarea',
						flex : 1,
						name : 'content',
						itemId : 'content',
						fieldLabel:'<s:text name="news.content"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				items : [
					{
						//xtype: 'ueditor',
						xtype: 'extkindeditor',
						itemId : 'describe',
						width: 800,
		                height:250,
						name : 'describe',
						fieldLabel:'<s:text name="news.describe"/>'
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
					debugger;
					if (saveForm.getForm().isValid()) {
						saveFile(saveForm, 'uploadFile', fileTypes,
								'news/news!save', grid);
					}
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
