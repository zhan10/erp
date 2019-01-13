<%@ page contentType="text/html;charset=UTF-8"%>
<script>
/*var  recipeColumns =[
             		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
             		,{text : '<s:text name="health.userId" />',dataIndex:'userId',name:'userId',align : 'center',width:100}
             		,{text : '<s:text name="health.checkedTime" />',dataIndex:'checkedTime',name:'checkedTime',
             			renderer:function(_registerDate){
             		      return _registerDate.replace("T"," ");
             		 },align : 'center',width:100}
             		,{text : '<s:text name="health.height" />',dataIndex:'height',name:'height',align : 'center',width:100}
             		,{text : '<s:text name="health.weight" />',dataIndex:'weight',name:'weight',align : 'center',width:100}
             		,{text : '<s:text name="health.diastolicPressure" />',dataIndex:'diastolicPressure',name:'diastolicPressure',align : 'center',width:100}
             		,{text : '<s:text name="health.systolicPressure" />',dataIndex:'systolicPressure',name:'systolicPressure',align : 'center',width:100}
             		,{text : '<s:text name="health.bodyFatRatio" />',dataIndex:'bodyFatRatio',name:'bodyFatRatio',align : 'center',width:100}
             		,{text : '<s:text name="health.oxygenSaturation" />',dataIndex:'oxygenSaturation',name:'oxygenSaturation',align : 'center',width:100}
             		,{text : '<s:text name="health.pulse" />',dataIndex:'pulse',name:'pulse',align : 'center',width:100}
             	];
             	var recipeDs = getDs(recipeColumns, 'crm/health!managerExt', baseSql,order);
             	recipeDs.load();
             	var recipeGrid = getGrid('recipeGrid','详情',recipeDs,recipeColumns, null,null,null);
*/
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
			{name:'userId',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'checkedTime',
						fieldLabel:'<s:text name="vHealth.checkedTime"/>'
,xtype:'datefield',format: 'Y-m-d'					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'name',
						fieldLabel:'<s:text name="vHealth.name"/>'
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
						xtype : 'radiogroup',
						fieldLabel:'<s:text name="vHealth.sex"/>',
						columns : 2,
						defaults : {
							name : 'sex' //Each radio has the same name so the browser will make sure only one is checked at once
						},
						items : [ {
							inputValue : true,
							boxLabel : '男'
						}, {
							inputValue : false,
							boxLabel : '女'
						} ]
					}
					,
					{
						flex:1,
						name:'birth',
						fieldLabel:'<s:text name="vHealth.birth"/>'
,xtype:'datefield',format: 'Y-m-d H:i:s'					}
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
						name:'certificate',
						fieldLabel:'<s:text name="vHealth.certificate"/>'
					}
					,
					{
						flex:1,
						name:'certificateCode',
						fieldLabel:'<s:text name="vHealth.certificateCode"/>',
						regex : /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,
	                    regexText : '输入正确的证件号'
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
						name:'tel',
						fieldLabel:'<s:text name="vHealth.tel"/>',
						regex:/^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/,
				        regexText:'请输入正确的手机号'
					}
					,
					{
						flex:1,
						name:'email',
						fieldLabel:'<s:text name="vHealth.email"/>',
						vtype:"email",
				        vtypeText:'请输入正确的邮箱格式'
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
						name:'address',
						fieldLabel:'<s:text name="vHealth.address"/>'
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
						name:'cardType',
						fieldLabel:'<s:text name="vHealth.cardType"/>'
					}
					,
					{
						flex:1,
						name:'cardCode',
						fieldLabel:'<s:text name="vHealth.cardCode"/>'
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
						name:'height',
						fieldLabel:'<s:text name="vHealth.height"/>'
					}
					,
					{
						flex:1,
						name:'weight',
						fieldLabel:'<s:text name="vHealth.weight"/>'
					}
					,
					{
						flex:1,
						name:'pulse',
						fieldLabel:'<s:text name="vHealth.pulse"/>'
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
						name:'diastolicPressure',
						fieldLabel:'<s:text name="vHealth.diastolicPressure"/>'
					}
					,
					{
						flex:1,
						name:'systolicPressure',
						fieldLabel:'<s:text name="vHealth.systolicPressure"/>'
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
						name:'bodyFatRatio',
						fieldLabel:'<s:text name="vHealth.bodyFatRatio"/>'
					}
					,
					{
						flex:1,
						name:'oxygenSaturation',
						fieldLabel:'<s:text name="vHealth.oxygenSaturation"/>'
					}
				]
			},tabs//recipeGrid
		],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
					saveFormToDB(saveForm, 'crm/vHealth!save',grid);
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
