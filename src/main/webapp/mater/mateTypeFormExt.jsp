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
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					 {
						flex : 1,
						fieldLabel : '<s:text name="mateType.grade" />',
						xtype : 'radiogroup',
						id:'grades',
						defaults : {
							name : 'grade' //Each radio has the same name so the browser will make sure only one is checked at once
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
								if(newValue["grade"]==1){
									form.down('#parentid').hide();
								}else{
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
						fieldLabel : '<s:text name="mateType.parentid" />'
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
						id:'isends',
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
						var grade = saveForm.down('#grades').getValue()["grade"];
						var matetypeid = saveForm.down('#matetypeid').getValue();
						if(grade==1){
							saveForm.down('#parentid').setValue(matetypeid);
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
