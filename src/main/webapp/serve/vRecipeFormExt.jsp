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
								flex : 1,allowBlank:false,
								name : 'cityId',
								fieldLabel : '<s:text name="vRecipe.cityName"/>',
								xtype : 'combo',
								value : '',
								selectOnFocus : true,
								displayField : 'name',
								valueField : 'id',
								editable : true,
								store : cb_cities_ds,
								listeners : {
									select : function() {
										this.up('form').getForm().findField(
												'cityName').setValue(
												this.getRawValue());												
										Ext.apply(cb_buildings_ds.proxy.extraParams,{whereSql : ' and cityId='+this.getValue(),order : order});
										cb_buildings_ds.loadPage(1);											
									}
								}
							}, {
								name : 'cityName',
								hidden : true
							},  {
								flex : 1,
								name : 'buildingId',allowBlank:false,
								fieldLabel : '<s:text name="vRecipe.buildingName"/>',
								xtype : 'combo',
								value : '',
								forceSelection : true,
								selectOnFocus : true,
								displayField : 'name',
								valueField : 'id',
								editable : true,
								store : cb_buildings_ds,
								listeners : {
									select : function() {
										this.up('form').getForm().findField(
												'buildingName').setValue(
												this.getRawValue());
								
									}
								}
							}, {
								name : 'buildingName',
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
								flex : 1,
								itemId:'recipeType',
								name : 'recipeType',
								fieldLabel : '<s:text name="vRecipe.typeName"/>',
								xtype : 'combo',	
								forceSelection:true,							
								value : '',
								allowBlank:false,
								selectOnFocus : true,
								displayField : 'name',
								valueField : 'id',
								editable : false,
								store : cb_recipeTypes_ds,
								listeners : {
									select : function() {
										this.up('form').getForm().findField(
												'typeName').setValue(
												this.getRawValue());
									}
								}
							}, {
								flex : 1,
								name : 'typeName',
								hidden : true
							}
					,
					{
				flex : 1,
				xtype : 'combo',
				displayField : 'text',
				valueField : 'value',
				allowBlank : false,
				store : spicyDegreeDs,forceSelection:true,	
				name : 'spicy',
				fieldLabel : '<s:text name="vRecipe.spicy"/>'
			}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'name',
						fieldLabel:'<s:text name="vRecipe.name"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						regex: /^\d+(\.\d{1,2})?$/,
						regexText:'请输入正确的数据类型',
						name:'price',
						fieldLabel:'<s:text name="vRecipe.price"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'keyword',
						fieldLabel:'<s:text name="vRecipe.keyword"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						xtype : 'filefield',
						flex : 1,
						name : 'uploadFile',
						id : 'uploadFile',
						emptyText : '请选择上传文件...',
						fieldLabel : '<s:text name="vRecipe.pic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}

					}, {
						fieldLabel : '<s:text name="vRecipe.pic"/>',
						xtype : 'displayfield',
						itemId : 'fileShow',
						name : 'fileShow',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						hidden : true,
						itemId : 'pic',
						name : 'pic',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						xtype : 'checkbox',
						boxLabel : '删除附件',
						value : 1,
						name : 'delFileFlag',
						itemId : 'delFileFlag',
						style : "margin-left:70px",
						hideLabel : true,
						width : 150,
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{						
						name:'memo', xtype: 'textarea',
						flex : 1,height:200,
						fieldLabel:'<s:text name="vRecipe.memo"/>'
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
							saveFile(saveForm, 'uploadFile', fileTypes,
									'restaurant/recipe!save', grid);
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
