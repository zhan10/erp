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
		items : [
			{
				itemId : 'id',
				name : 'id',
				hidden : true
			}, 
			{
				itemId : 'parentGrade',
				name : 'parentGrade',
				hidden : true
			}, 
			{
				itemId : 'parentId',
				name : 'parentId',
				hidden : true
			}, {
				itemId : 'grade',
				name : 'grade',
				hidden : true
			}, 
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					 {
						flex : 1,
						fieldLabel : '<s:text name="mateType.grade" />',
						allowBlank : false,
						xtype : 'radiogroup',
						itemId:'grades',
						defaults : {
							name : 'grades' //Each radio has the same name so the browser will make sure only one is checked at once
						},
						items : [ {
							inputValue : 1,
							boxLabel : '顶级'
						}, {
							inputValue : 2,
							boxLabel : '同级'
						}, {
							inputValue : 3,
							boxLabel : '下级'
						} ],
						listeners:{
							change:function(a,newValue, oldValue, eOpts){
								if(newValue["grades"]==1){
									Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ''});
									cb_mateType_ds.loadPage(1);
									form.down('#parentid').hide();
								}else if(newValue["grades"]==2){
									Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' and grade <> 1 '});
									cb_mateType_ds.loadPage(1);
									form.down('#parentid').show();
								}else if(newValue["grades"]==3){
									Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' and isend = 0 '});
									cb_mateType_ds.loadPage(1);
									form.down('#parentid').show();
								}
				            }
				        }
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						allowBlank : false,
						name : 'parentid',
						itemId : 'parentid',
						xtype : 'combo',
						displayField : 'name',forceSelection:false,
						valueField : 'id',
						store : cb_mateType_ds,
						fieldLabel : '<s:text name="mateType.parentid" />',
						listeners : {
							select : function() {
								form.down('#parentGrade').setValue(this.findRecord('id',this.getValue()).get('grade'));
								form.down('#parentId').setValue(this.findRecord('id',this.getValue()).get('parentid'));
							}
						}
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						allowBlank : false,
						name : 'matetypeid',
						itemId:'matetypeid',
						fieldLabel : '<s:text name="mateType.matetypeid"/>'
					},
					{
						flex : 1,
						allowBlank : false,
						name : 'matertypename',
						fieldLabel : '<s:text name="mateType.matertypename"/>'
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
						fieldLabel : '<s:text name="mateType.isend" />',
						xtype : 'radiogroup',
						itemId:'isend',
						allowBlank : false,
						defaults : {
							name : 'isend' //Each radio has the same name so the browser will make sure only one is checked at once
						},
						items : [ {
							inputValue : true,
							boxLabel : '是'
						}, {
							inputValue : false,
							boxLabel : '否'
						} ]
					}
				]
			}, {
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [ {
					xtype: 'textarea',
					flex : 1,
					name : 'description',
					height:100,
					fieldLabel : '<s:text name="mateType.description"/>'
				} ]
			}
		],
		buttons : [
				{
					text : '保存',
					itemId : 'btnSave',
					handler : function() {
						var saveForm = this.up('form');
						//alert(Ext.JSON.encode(saveForm.getForm().getValues()));
						debugger;
						//获取父类的值
						var parentid = saveForm.down('#parentid').getValue();
						//获取等级
						var grade = saveForm.down('#grade').getValue();
						//获取选择的级别
						var grades = saveForm.down('#grades').getValue()["grades"];
						//获取物料类别编号
						var matetypeid = saveForm.down('#matetypeid').getValue();
						//获取选择父类的等级以及父类id
						var parentGrade = saveForm.down('#parentGrade').getValue();
						var parentId = saveForm.down('#parentId').getValue();
						if(grades==1){
							saveForm.down('#parentid').setValue(matetypeid);
							saveForm.down('#grade').setValue(1);
						}else if(grades==2){
							saveForm.down('#parentid').setValue(parentId);
							saveForm.down('#matetypeid').setValue(parentId+""+matetypeid);
							saveForm.down('#grade').setValue(parentGrade);
						}else if(grades==3){
							saveForm.down('#matetypeid').setValue(parentid+""+matetypeid);
							saveForm.down('#grade').setValue(parseInt(parentGrade)+1);
						} 
						if (saveForm.getForm().isValid()) {
							saveFormToDB(saveForm, 'mater/mateType!save',grid);
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
