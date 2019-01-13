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
						name:'ordersItemId',
						fieldLabel:'<s:text name="vTechCardOrders.ordersItemId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'techCardId',
						fieldLabel:'<s:text name="vTechCardOrders.techCardId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'allotWeight',
						fieldLabel:'<s:text name="vTechCardOrders.allotWeight"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'ordersNum',
						fieldLabel:'<s:text name="vTechCardOrders.ordersNum"/>'
					}
					,
					{
						flex:1,
						name:'storeLimit',
						fieldLabel:'<s:text name="vTechCardOrders.storeLimit"/>'
,xtype:'datefield',format: 'Y-m-d'					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'ordersId',
						fieldLabel:'<s:text name="vTechCardOrders.ordersId"/>'
					}
					,
					{
						flex:1,
						name:'serialNum',
						fieldLabel:'<s:text name="vTechCardOrders.serialNum"/>'
					}
					,
					{
						flex:1,
						name:'spec1',
						fieldLabel:'<s:text name="vTechCardOrders.spec1"/>'
					}
					,
					{
						flex:1,
						name:'spec2',
						fieldLabel:'<s:text name="vTechCardOrders.spec2"/>'
					}
					,
					{
						flex:1,
						name:'alloyModel',
						fieldLabel:'<s:text name="vTechCardOrders.alloyModel"/>'
					}
					,
					{
						flex:1,
						name:'alloyStatus',
						fieldLabel:'<s:text name="vTechCardOrders.alloyStatus"/>'
					}
					,
					{
						flex:1,
						name:'thicknessTolerance',
						fieldLabel:'<s:text name="vTechCardOrders.thicknessTolerance"/>'
					}
					,
					{
						flex:1,
						name:'widthTolerance',
						fieldLabel:'<s:text name="vTechCardOrders.widthTolerance"/>'
					}
					,
					{
						flex:1,
						name:'outerDiameter',
						fieldLabel:'<s:text name="vTechCardOrders.outerDiameter"/>'
					}
					,
					{
						flex:1,
						name:'innerDiameter',
						fieldLabel:'<s:text name="vTechCardOrders.innerDiameter"/>'
					}
					,
					{
						flex:1,
						name:'jointNum',
						fieldLabel:'<s:text name="vTechCardOrders.jointNum"/>'
					}
					,
					{
						flex:1,
						name:'pinholeNum',
						fieldLabel:'<s:text name="vTechCardOrders.pinholeNum"/>'
					}
					,
					{
						flex:1,
						name:'wettability',
						fieldLabel:'<s:text name="vTechCardOrders.wettability"/>'
					}
					,
					{
						flex:1,
						name:'tensileStrength',
						fieldLabel:'<s:text name="vTechCardOrders.tensileStrength"/>'
					}
					,
					{
						flex:1,
						name:'extensibility',
						fieldLabel:'<s:text name="vTechCardOrders.extensibility"/>'
					}
					,
					{
						flex:1,
						name:'sideSpread',
						fieldLabel:'<s:text name="vTechCardOrders.sideSpread"/>'
					}
					,
					{
						flex:1,
						name:'wholeSpread',
						fieldLabel:'<s:text name="vTechCardOrders.wholeSpread"/>'
					}
					,
					{
						flex:1,
						name:'leng',
						fieldLabel:'<s:text name="vTechCardOrders.leng"/>'
					}
					,
					{
						flex:1,
						name:'lengthTolerance',
						fieldLabel:'<s:text name="vTechCardOrders.lengthTolerance"/>'
					}
					,
					{
						flex:1,
						name:'appearance',
						fieldLabel:'<s:text name="vTechCardOrders.appearance"/>'
					}
					,
					{
						flex:1,
						name:'otherStandard',
						fieldLabel:'<s:text name="vTechCardOrders.otherStandard"/>'
					}
					,
					{
						flex:1,
						name:'specialReq',
						fieldLabel:'<s:text name="vTechCardOrders.specialReq"/>'
					}
					,
					{
						flex:1,
						name:'purpose',
						fieldLabel:'<s:text name="vTechCardOrders.purpose"/>'
					}
					,
					{
						flex:1,
						name:'amount',
						fieldLabel:'<s:text name="vTechCardOrders.amount"/>'
					}
					,
					{
						flex:1,
						name:'packReq',
						fieldLabel:'<s:text name="vTechCardOrders.packReq"/>'
					}
					,
					{
						flex:1,
						name:'memo',
						fieldLabel:'<s:text name="vTechCardOrders.memo"/>'
					}
					,
					{
						flex:1,
						name:'produceWeight',
						fieldLabel:'<s:text name="vTechCardOrders.produceWeight"/>'
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
					saveFormToDB(saveForm, 'produce/techCardOrders!save',grid);
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
