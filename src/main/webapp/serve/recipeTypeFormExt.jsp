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
						itemId:'name',
						fieldLabel:'<s:text name="recipeType.name"/>',
						listeners:{
							blur:function(){
								var name = this.getValue();
								Ext.Ajax.request({
									url:'restaurant/recipeType!managerExt',
									method : 'post',
									success:function(response){
										var recipeType = Ext.decode(response.responseText).records;
										for(var i=0;i<recipeType.length;i++){
											if(recipeType[i].name==name){
												Ext.MessageBox.show({title: '错误',msg: "您输入的信息验证错误，请核对后再执行该操作！<br/><span style='color:brown;'>错误原因：</span><span style='color:red;'>菜品类型已存在。</span>",buttons: Ext.MessageBox.OK,icon: Ext.MessageBox.ERROR});  
												form.down('#name').setValue('');
											} 
										}
									}
								});
							}
						}
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
					saveFormToDB(saveForm, 'restaurant/recipeType!save',grid);
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
