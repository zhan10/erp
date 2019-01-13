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
		items : [ {
			itemId : 'id',
			name : 'id',
			hidden : true
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				xtype : 'combo',
				displayField : 'text',
				valueField : 'value',
				allowBlank : true,
				store : marketingStatusDs,
				itemId : 'status',
				name : 'status',
				value : 1,
				fieldLabel : '<s:text name="marketing.status"/>'
			}, {
				flex : 1,
				allowBlank : false,
				name : 'name',
				fieldLabel : '<s:text name="marketing.name"/>'
			}, {
				flex : 1,
				allowBlank : false,
				name : 'creater',
				itemId : 'creater',
				fieldLabel : '<s:text name="marketing.creater"/>'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				allowBlank : false,
				name : 'openTime',
				itemId : 'openTime',
				fieldLabel : '<s:text name="marketing.openTime"/>',
				xtype : 'datetimefield',
				format : 'Y-m-d'
			}, {
				flex : 1,
				allowBlank : false,
				name : 'startTime',
				itemId : 'startTime',
				fieldLabel : '<s:text name="marketing.startTime"/>',
				xtype : 'datetimefield',
				step:30,
				showToday: false,
				format : 'Y-m-d'
			}, {
				flex : 1,
				allowBlank : false,
				name : 'endTime',
				itemId : 'endTime',
				fieldLabel : '<s:text name="marketing.endTime"/>',
				xtype : 'datetimefield',
				showToday: false,
				format : 'Y-m-d'
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				xtype : 'combo',
				displayField : 'text',
				valueField : 'value',
				allowBlank : false,
				store : marketingTypeDs,
				itemId : 'type',
				name : 'type',
				fieldLabel : '<s:text name="marketing.type"/>',
				listeners : {
					select : function() {
						//alert(this.value);
						if (this.value == 1) {
							form.down('#percent').show();
							form.down('#component').hide();
						} else {
							form.down('#component').show();
							form.down('#percent').hide();
						}
					}
				}
			}, {
				flex : 1,
				allowBlank : false,
				name : 'coupon',
				emptyText : '90%表示九折',
				fieldLabel : '<s:text name="marketing.coupon"/>'
			}, {
				xtype : 'label',
				text : '%',
				name : 'percent',
				itemId : 'percent',
				hidden : true
			}, {
				xtype : 'label',
				text : '元',
				name : 'component',
				itemId : 'component',
				hidden : true
			}, {
				flex:1,
				allowBlank:false,
				name:'priority',
				fieldLabel:'<s:text name="marketing.priority"/>'
			} ]
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
				fieldLabel : '<s:text name="marketing.pic"/>',
				buttonText : '',
				buttonConfig : {
					iconCls : 'uploadPic'
				}

			}, {
				fieldLabel : '<s:text name="marketing.pic"/>',
				xtype : 'displayfield',
				itemId : 'fileShow',
				name : 'pic',
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
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				xtype: 'textarea',
				flex : 1,
				allowBlank : true,
				name : 'memo',
				height:100,
				fieldLabel : '<s:text name="marketing.memo"/>'
			} ]
		},{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				flex : 1,
				allowBlank : true,
				itemId : 'conditionSetting',
				name : 'conditionSetting',
				fieldLabel : '<s:text name="marketing.conditionSetting"/>',
				hidden : true
			} ]
		}, {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
				xtype : 'label',
				itemId : 'ad',
				text : '条件设置'
			} ]
		} ],
		buttons : [
				{
					text : '延期',
					hidden : true,
					itemId : 'btnDefer',
					handler : gridDefer
				},
				{
					text : '保存',
					itemId : 'btnSave',
					handler : function() {
						var saveForm = this.up('form');
						var zz = "(";
						var xx = ")";
						var cc = "&&";
						var yy;
					    for (var h = 1; h <= ss; h++) {
					    	if(form.down('#dd' + form.items.get(7+h).itemId)!=null){
									var dd = form.down('#dd' + form.items.get(7+h).itemId).getValue();
									var nn = form.down('#nn' +form.items.get(7+h).itemId).getValue();
									var mm = form.down('#mm' + form.items.get(7+h).itemId).getValue();
									var aa = Ext.Date.format(Ext.Date.add(new Date(form.down('#aa' + form.items.get(7+h).itemId).getValue())), 'Y-m-d');
									var bb = form.down('#total'+form.items.get(7+h).itemId).getValue();
									if(aa=="1970-01-01"){
										aa=null;
									};
									if(mm==null&&aa==null){
										var hh = "(" + dd + nn + bb + ")"
									} else if(mm==null&&bb==''){
										var hh = "(" + dd + nn + aa + ")"
									} else if(aa==null&&bb==''){
										var hh = "(" + dd + nn + mm + ")"
									};
									if (h == 1) {
										yy = zz + hh;
									} else {
										yy += cc + hh;
									};
					          }
							}
						yy += xx;
						form.down('#conditionSetting').setValue(yy);
						/* if (saveForm.getForm().isValid()) {
							saveFile(saveForm, 'produce/marketing!save',
									grid);
						} */
						if (saveForm.getForm().isValid()) {
							if (saveForm.getForm().isValid()) {
								saveFile(saveForm, 'uploadFile', fileTypes,
										'produce/marketing!save', grid);
							}
						}
						for (var i = 0; i < sss.length; i++) {
							form.remove(form.items.get(i + 100));
						}
						if (ss != 0) {
							for (var i = 1; i <= ss; i++) {
								form.remove(form.items.get(form.items.length-1));
							}
							ss = 0;
						}
					}
				}, {
					text : '关闭',
					itemId : 'btnClose',
					handler : function() {
						this.up('window').hide();
						if (ss != 0) {
							for (var i = 1; i <= ss; i++) {
								form.remove(form.items.get(form.items.length-1));
							}
							ss = 0;
						} 
					}
				} ]

	});
</script>
