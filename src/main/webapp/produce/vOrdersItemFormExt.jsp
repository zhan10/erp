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
					{name:'id',hidden:true,itemId:'id'},{name:'ordersId',hidden:true,itemId:'ordersId'},
					{
						xtype : 'container',
						layout : 'hbox',
						defaultType : 'textfield',
						items : [
							{
				                xtype: 'fieldcontainer',				               
				                flex:1,
				                fieldLabel: '<s:text name="orders.ordersNum"/>',
				                combineErrors: true,
				                msgTarget : 'side',
				                layout: 'hbox',
				                defaults: {
				                   hideLabel: true,				                  
				                },
				                items: [
				                    {				                       
				                    	xtype: 'displayfield', name  : 'ordersNum'
				                    },{xtype: 'displayfield', value: '-'},
				                    {
				                       
				                    	xtype: 'displayfield', name : 'serialNum'
				                    }
				                ]
				            },{
								flex:1,
								name:'purpose',
								fieldLabel:'<s:text name="vOrdersItem.purpose"/>'
							}
							
						]
					},
					{
						xtype : 'container',
						layout : 'hbox',
						defaultType : 'numberfield',
						items : [
							{
								flex:1,
								name:'spec1',
								fieldLabel:'<s:text name="vOrdersItem.spec1"/>'
							}
							,
							{
								flex:1,
								name:'spec2',
								fieldLabel:'<s:text name="vOrdersItem.spec2"/>'
							}
						]
					},
					{
						xtype : 'container',
						layout : 'hbox',
						defaultType : 'numberfield',
						items : [
							{
								flex:1,
								name:'amount',
								fieldLabel:'<s:text name="vOrdersItem.amount"/>'
							}
							,
							{
								flex:1,
								name:'leng',
								fieldLabel:'<s:text name="vOrdersItem.leng"/>'
							}
						]
					},
					{
						xtype : 'container',
						layout : 'hbox',
						defaultType : 'numberfield',
						items : [
							{
								flex:1,
								name:'orderWeight',
								fieldLabel:'<s:text name="vOrdersItem.orderWeight"/>'
							}
							,
							{
								flex:1,
								name:'produceWeight',
								fieldLabel:'<s:text name="vOrdersItem.produceWeight"/>'
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
								name:'alloyModel',
								fieldLabel:'<s:text name="vOrdersItem.alloyModel"/>'
							}
							,
							{
								flex:1,
								name:'alloyStatus',
								fieldLabel:'<s:text name="vOrdersItem.alloyStatus"/>'
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
								name:'thicknessTolerance',
								fieldLabel:'<s:text name="vOrdersItem.thicknessTolerance"/>'
							}
							,
							{
								flex:1,
								name:'widthTolerance',
								fieldLabel:'<s:text name="vOrdersItem.widthTolerance"/>'
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
								name:'lengthTolerance',
								fieldLabel:'<s:text name="vOrdersItem.lengthTolerance"/>'
							}
							,
							{
								flex:1,
								name:'jointNum',
								fieldLabel:'<s:text name="vOrdersItem.jointNum"/>'
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
								name:'innerDiameter',
								fieldLabel:'<s:text name="vOrdersItem.innerDiameter"/>'
							}
							,
							{
								flex:1,
								name:'outerDiameter',
								fieldLabel:'<s:text name="vOrdersItem.outerDiameter"/>'
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
								name:'sideSpread',
								fieldLabel:'<s:text name="vOrdersItem.sideSpread"/>'
							}
							,
							{
								flex:1,
								name:'wholeSpread',
								fieldLabel:'<s:text name="vOrdersItem.wholeSpread"/>'
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
								name:'tensileStrength',
								fieldLabel:'<s:text name="vOrdersItem.tensileStrength"/>'
							}
							,
							{
								flex:1,
								name:'pinholeNum',
								fieldLabel:'<s:text name="vOrdersItem.pinholeNum"/>'
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
								name:'wettability',
								fieldLabel:'<s:text name="vOrdersItem.wettability"/>'
							}
							,
							{
								flex:1,
								name:'extensibility',
								fieldLabel:'<s:text name="vOrdersItem.extensibility"/>'
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
								name:'appearance',
								fieldLabel:'<s:text name="vOrdersItem.appearance"/>'
							}
							,
							{
								flex:1,
								name:'packReq',
								fieldLabel:'<s:text name="vOrdersItem.packReq"/>'
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
								name:'otherStandard',
								fieldLabel:'<s:text name="vOrdersItem.otherStandard"/>'
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
								name:'specialReq',
								fieldLabel:'<s:text name="vOrdersItem.specialReq"/>'
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
								name:'memo',
								fieldLabel:'<s:text name="vOrdersItem.memo"/>'
							}
						]
					}
				],

		buttons : [ {
		text : '关闭',
			id : 'btnClose',
			handler : function() {
				this.up('window').hide();
			}
			} , {
				text : '关闭',
				id : 'btnSave',
				handler : function() {
					this.up('window').hide();
				}
				} ]
			});
	
</script>
