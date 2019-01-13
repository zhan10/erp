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
			{name:'floorName',hidden:true},{name:'cityId',hidden:true},{name:'buildingName',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'buildingId',
						fieldLabel:'<s:text name="vFloorLock.buildingName"/>',
						xtype : 'combo',
						value : '',
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
								Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+this.getValue(),order : order});
								cb_floors_ds.loadPage(1);											
							}
						}
					},
					{
						flex:1,
						allowBlank:false,
						name:'floorId',
						fieldLabel:'<s:text name="vFloorLock.floorName"/>',
						xtype : 'combo',
						value : '',
						selectOnFocus : true,
						displayField : 'name',
						valueField : 'id',
						editable : true,
						store : cb_floors_ds,
						listeners : {
							select : function() {
								this.up('form').getForm().findField(
										'floorName').setValue(
										this.getRawValue());
							}
						}
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
						name:'lockFrom',
						itemId:'lockFrom',
						fieldLabel:'<s:text name="vFloorLock.lockFrom"/>',
						xtype:'datetimefield',
						format: 'Y-m-d'				
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'lockTo',
						itemId:'lockTo',
						fieldLabel:'<s:text name="vFloorLock.lockTo"/>',
						xtype:'datetimefield',
						format: 'Y-m-d'
					}
					
				]
			}
		],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				var lockFrom = Ext.Date.format(new Date(saveForm.down('#lockFrom').getValue()),'Y-m-d H:i:s');
				var lockTo = Ext.Date.format(new Date(saveForm.down('#lockTo').getValue()),'Y-m-d H:i:s');
				//当前时间
				var myDate = Ext.Date.format(new Date(),'Y-m-d H:i:s');
				if(lockFrom<myDate){
					Ext.Msg.alert('错误', "锁定开始时间不能小于当前时间！");
				}else if(lockFrom>lockTo){
					Ext.Msg.alert('错误', "锁定结束时间不能小于锁定开始时间！");
				}else{
					if (saveForm.getForm().isValid()) {
						saveFormToDB(saveForm, 'visit/floorLock!save',grid);
					}
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
