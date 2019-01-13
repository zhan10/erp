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
							name:'printUser',
							fieldLabel:'<s:text name="printStatistics.printUser" />'
						},
					{
						flex:1,
						allowBlank:false,
						name:'cardNumber',
						fieldLabel:'<s:text name="vPrintRecord.cardNumber" />'
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
						name:'printTime',
						fieldLabel:'<s:text name="printStatistics.printTime" />'
					},
					{
						flex:1,
						allowBlank:false,
						name:'printFormat',
						fieldLabel:'<s:text name="printStatistics.printFormat" />',
						xtype:'combobox',
						store:[['N','黑白'],['Y','彩色']]
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
						name:'paperFormat',
						fieldLabel:'<s:text name="printStatistics.paperFormat" />',
						xtype:'combobox',
						store:[['A3','A3'],['A4','A4'],['B4','B4'],['B5','B5'],['Letter','信封']]
					},
					{
						flex:1,
						allowBlank:false,
						name:'printCount',
						fieldLabel:'<s:text name="printStatistics.printCount" />'
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
							name:'price',
							fieldLabel:'<s:text name="printStatistics.price" />'
						}    
					,{
						flex:1,
						allowBlank:false,
						name:'priceTotal',
						fieldLabel:'<span style="color:red"><s:text name="printStatistics.priceTotal" /></span>'
					}
				]
			},
		],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
					saveFormToDB(saveForm, 'serve/printStatistics!save',grid);
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
