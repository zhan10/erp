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
						name:'printFormat',
						itemId:'printFormat',
						fieldLabel:'<s:text name="printRate.printFormat"/>',
						xtype:'combobox',
						store:[['N','黑白'],['Y','彩色']],
						listeners:{
							blur:function(){
								var paperFormat = form.down('#paperFormat').getValue();
								var printFormat = form.down('#printFormat').getValue();
								Ext.Ajax.request({
									url:'serve/printRate!managerExt',
									method : 'post',
									success:function(response){
										var printRate = Ext.decode(response.responseText).records;
										for(var i=0;i<printRate.length;i++){
											if(printRate[i].paperFormat==paperFormat && printRate[i].printFormat==printFormat){
												Ext.MessageBox.show({title: '错误',msg: "您输入的信息验证错误，请核对后再执行该操作！<br/><span style='color:brown;'>错误原因：</span><span style='color:red;'>打印格式和纸张格式已存在。</span>",buttons: Ext.MessageBox.OK,icon: Ext.MessageBox.ERROR});  
												form.down('#paperFormat').setValue('');
											} 
										}
									}
								});
							}
						}
					},
					{
						flex : 1,
						allowBlank:false,
						name : 'paperFormat',
						itemId:'paperFormat',
					    fieldLabel:'<s:text name="printRate.paperFormat"/>',
					    xtype:'combobox',
						store:[['A3','A3'],['A4','A4'],['B4','B4'],['B5','B5'],['Letter','信封']],
						listeners:{
							blur:function(){
								var paperFormat = this.getValue();
								var printFormat = form.down('#printFormat').getValue();
								Ext.Ajax.request({
									url:'serve/printRate!managerExt',
									method : 'post',
									success:function(response){
										var printRate = Ext.decode(response.responseText).records;
										for(var i=0;i<printRate.length;i++){
											if(printRate[i].paperFormat==paperFormat && printRate[i].printFormat==printFormat){
												Ext.MessageBox.show({title: '错误',msg: "您输入的信息验证错误，请核对后再执行该操作！<br/><span style='color:brown;'>错误原因：</span><span style='color:red;'>打印格式和纸张格式已存在。</span>",buttons: Ext.MessageBox.OK,icon: Ext.MessageBox.ERROR});  
												form.down('#paperFormat').setValue('');
											} 
										}
									}
								});
							}
						}
				}
				]
			},
			/* {
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
							flex : 1,
							allowBlank:false,
							name : 'paperFormat',
							id:'paperFormat',
						    fieldLabel:'<s:text name="printRate.paperFormat"/>'
					},
					{
						flex : 1,
						allowBlank:false,
						name : 'chargeUnit',
						id:'chargeUnit',
					    fieldLabel:'<s:text name="printRate.chargeUnit"/>'
				}
				]
			}, */
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
							flex : 1,
							allowBlank:true,
							name : 'chargeType',
							id:'chargeType',
						    fieldLabel:'<s:text name="printRate.chargeType"/>',
						    xtype:'combobox',
							store:[['N','张'],['Y','页']]
					},
					{
						flex : 1,
						allowBlank:false,
						xtype: 'numberfield',
						minValue:0,
						name : 'price',
						itemId:'price',
					    fieldLabel:'<s:text name="printRate.price"/>'
				}
				]
			},
			/* {
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
					flex : 1,
					name : 'amender',
					itemId:'amender',
					fieldLabel : '<s:text name="serve.handleUser"/>'
					} ,
				{
					name : 'amenderId',
					itemId:'amenderId',
					hidden : true
				}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						    xtype: 'textarea',
							flex : 1,
							allowBlank:true,
							name : 'demandDescription',
							id : 'demandDescription',
							height:70,
						    fieldLabel:'<s:text name="serve.demandDescription"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						    xtype: 'textarea',
							flex : 1,
							allowBlank:true,
							name : 'memo',
							id : 'memo',
							disabled:true,
							height:70,
						    fieldLabel:'<span style="color:red"><s:text name="serve.memo"/></span>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						    xtype: 'textarea',
							flex : 1,
							allowBlank:true,
							name : 'result',
							id : 'result',
							disabled:true,
							height:70,
						    fieldLabel:'<span style="color:red"><s:text name="serve.result"/></span>'
					}
				]
			}
			 */
		],
		buttons : [{
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
					saveFormToDB(saveForm, 'serve/printRate!save',grid);
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
