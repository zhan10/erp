<%@ page contentType="text/html;charset=UTF-8"%>
<style type="text/css"> 
    .labelCls{ 
        color: red; 
    } 
</style>
<script>
	form = Ext
			.widget(
					'form',
					{
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
						items : [
								{
									itemId : 'id',
									name : 'id',
									hidden : true
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												allowBlank : false,
												name : 'productId',
												itemId : 'productId',
												fieldLabel : '<s:text name="vProduct.productName"/>',
												xtype : 'combo',
												value : '',
												selectOnFocus : true,
												displayField : 'name',
												valueField : 'id',
												editable : true,
												store : cb_productType_ds,
												listeners : {
													select : function() {
														this
																.up('form')
																.getForm()
																.findField(
																		'productName')
																.setValue(
																		this
																				.getRawValue());
														Ext
																.apply(
																		cb_genre_ds.proxy.extraParams,
																		{
																			whereSql : ' and productTypeId='
																					+ this
																							.getValue(),
																			order : order
																		});
														cb_genre_ds.loadPage(1);
													}
												}
											},
											{
												flex : 1,
												name : 'productName',
												hidden : true
											},
											{
												flex : 1,
												name : 'genreId',
												itemId : 'genreId',
												editable : false,
												fieldLabel : '<s:text name="vProduct.genreName"/>',
												xtype : 'combo',
												forceSelection : true,
												selectOnFocus : true,
												value : '',
												displayField : 'name',
												valueField : 'id',
												store : cb_genre_ds,
												listeners : {
													select : function() {
														this.up('form').getForm().findField('genreName')
																.setValue(this.getRawValue());
														var price = this.findRecord('id',this.getValue()).get('price');
														var priceUnit = this.findRecord('id',this.getValue()).get('priceUnit');
														this.up('form').getForm().findField('price').setValue(price);
														this.up('form').getForm().findField('priceUnit').setValue(priceUnit);
													},
													expand : function(){
														if(cb_genre_ds.getCount()!=0){
															form.down('#price').setReadOnly(true);
															form.down('#priceUnit').setReadOnly(true);
														}
													}
												}
											}, {
												flex : 1,
												name : 'genreName',
												hidden : true
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												allowBlank : false,
												name : 'buildingId',
												fieldLabel : '<s:text name="vWorkbench.buildingName"/>',
												xtype : 'combo',
												value : '',
												autoSelect : true,
												displayField : 'name',
												valueField : 'id',
												editable : false,
												store : cb_buildings_ds,
												listeners : {
													select : function() {
														this.up('form').getForm().findField('buildingName')
																.setValue(this.getRawValue());
														Ext.apply(cb_floors_ds.proxy.extraParams,
																{
																	whereSql : ' and buildingId='+ this.getValue(),
																	order : order
																});
														 cb_floors_ds.loadPage(1);
													}
												}
											},
											{
												flex : 1,
												name : 'buildingName',
												hidden : true
											},
											{
												flex : 1,
												name : 'floorId',id:'floorId',
												allowBlank : false,
												fieldLabel : '<s:text name="vWorkbench.floorName"/>',
												xtype : 'combo',
												value : '',
												selectOnFocus : true,
												displayField : 'name',
												itemId: 'floorName',
												valueField : 'id',
												forceSelection:true,
												editable : false,
												store : cb_floors_ds,
												listeners : {
													select : function() {
														this
																.up('form')
																.getForm()
																.findField(
																		'floorName')
																.setValue(
																		this
																				.getRawValue());
													}
												}
											}, {
												flex : 1,
												name : 'floorName',
												hidden : true
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												allowBlank : false,
												name : 'name',
												fieldLabel : '<s:text name="vProduct.name"/>'
											},
											{
												flex : 1,
												name : 'galleryful',id:'galleryful',
												editable : false,
												fieldLabel : '<s:text name="vProduct.galleryful"/>'
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex :1,
												xtype : 'container',
												layout : 'hbox',
												defaultType : 'textfield',
												items : [{
													flex :1,
													allowBlank : false,
													name : 'price',
													itemId : 'price',
													fieldLabel : '<s:text name="vProduct.price"/>'
												},{
													xtype : 'label',
													text : '选择类型，价格不可修改！',
													cls : 'labelCls'
												}]
											},
											{
												flex : 1,
												xtype : 'combo',
												displayField : 'text',
												valueField : 'value',
												editable : false,
												allowBlank : false,
												forceSelection : true,
												selectOnFocus : true,
												name : 'priceUnit',
												itemId : 'priceUnit',
												editable : false,
												store : productDs,
												fieldLabel : '<s:text name="vProduct.priceUnit"/>'
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [{
										xtype : 'container',
										layout : 'hbox',
										flex : 1,
										defaultType : 'textfield',
										items : [{
											flex : 2,
											allowBlank : false,
											name : 'minTime',
											fieldLabel : '<s:text name="vProduct.minTime"/>'
										},
										{
											flex : 1,
											xtype : 'combo',
											displayField : 'text',
											valueField : 'value',
											labelWidth : 50,
											allowBlank : false,
											editable : false,
											forceSelection : true,
											selectOnFocus : true,
											name : 'unit',
											itemId : 'unit',
											store : productDs,
											fieldLabel : '<s:text name="vProduct.unit"/>'
										}]
									},{
												flex : 1,
												allowBlank : false,
												name : 'deposit',
												fieldLabel : '<s:text name="vProduct.deposit"/>'
											}]
								},
								
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'combo',
									items : [{
												flex : 1,//allowBlank:false,
												name : 'equipment',
												itemId : 'equipment',
												fieldLabel : '<s:text name="vProduct.equipment"/>',
												xtype : 'combo',
												value : '',
												displayField : 'facilities',
												valueField : 'id',
												editable : false,
												multiSelect : true, 
												store : cb_roomFacilities_ds,
												queryMode: 'local',
												listeners : {
													focus : function(){
														cb_roomFacilities_ds.loadPage(1);
														this.setEditable(true);
														this.setEditable(false);
													}
												} ,
												listConfig : { 
											    	itemTpl : Ext.create('Ext.XTemplate','<input type=checkbox>{[values.facilities]}'),  
											    	onItemSelect : function(record) {
											        	 var node = this.getNode(record);
											        		 if (node) {
												             	var checkboxs = node.getElementsByTagName("input");
												                if (checkboxs != null)  
												                var checkbox = checkboxs[0];  
												                checkbox.checked = true;  
												             } 
											    	},
											        listeners : {
											        	itemclick : function(view, record, item, index, e, eOpts) {  
											        		var isSelected = view.isSelected(item);  
											                var checkboxs = item.getElementsByTagName("input");
											                    if (checkboxs != null) {  
											                        var checkbox = checkboxs[0];  
											                        if (!isSelected) {  
											                            checkbox.checked = true;  
											                        } else {  
											                            checkbox.checked = false;  
											                        }  
											                    }  
											             }  
											        }   
											  }
										}]
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
												itemId : 'uploadFile',
												emptyText : '请选择上传文件...',
												fieldLabel : '<s:text name="vProduct.pic"/>',
												buttonText : '',
												buttonConfig : {
													iconCls : 'uploadPic'
												}

											},
											{
												fieldLabel : '<s:text name="vProduct.pic"/>',
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
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [ {
										xtype : 'textarea',
										flex : 1,
										name : 'intro',
										height : 170,
										fieldLabel : '<s:text name="vProduct.intro"/>'
									} ]
								} ],
						buttons : [
								{
									text : '保存',
									itemId : 'btnSave',
									handler : function() {
										var saveForm = this.up('form');
										if (saveForm.getForm().isValid()) {
											//form.down('#equipment').setValue(form.down('#equipment').getValue()+"");
											saveFile(saveForm, 'uploadFile',fileTypes,'system/products!save',grid);											
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
