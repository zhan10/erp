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
						name:'recipeType',
						fieldLabel:'<s:text name="recipe.recipeType"/>'
					}
					,
					{
						flex:1,
						name:'keyword',
						fieldLabel:'<s:text name="recipe.keyword"/>'
					}
					,
					{
						flex:1,
						name:'spicy',
						fieldLabel:'<s:text name="recipe.spicy"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'name',
						fieldLabel:'<s:text name="recipe.name"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'price',
						fieldLabel:'<s:text name="recipe.price"/>'
					}
					,
					{
						flex:1,
						name:'pic',
						fieldLabel:'<s:text name="recipe.pic"/>'
					}
					,
					{
						flex:1,
						name:'memo',
						fieldLabel:'<s:text name="recipe.memo"/>'
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
					saveFormToDB(saveForm, 'restaurant/recipe!save',grid);
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
