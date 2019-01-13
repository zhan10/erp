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
						name:'numbers',
						fieldLabel:'<s:text name="vOrdersList.numbers"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'price',
						fieldLabel:'<s:text name="vOrdersList.price"/>'
					}]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						xtype : 'combo',
						allowBlank:false,
						name:'status',
						displayField : 'text',
						valueField : 'value',
						store : vOrdersStatusDs,
						fieldLabel:'<s:text name="vOrdersList.status"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'recipeName',
						fieldLabel:'<s:text name="vOrdersList.recipeName"/>'
					}]
			},
			{		
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
			         {
							flex:1,
							allowBlank:false,
							name:'total',
							fieldLabel:'<s:text name="vOrdersList.total"/>'
						}
					,
					{
						flex:1,
						allowBlank:false,
						name:'consumerName',
						fieldLabel:'<s:text name="vOrdersList.consumerName"/>'
					}]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
				     {
						flex:1,
						allowBlank:false,
						name:'address',
						fieldLabel:'<s:text name="vOrdersList.address"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'tel',
						fieldLabel:'<s:text name="vOrdersList.tel"/>',				
                     }]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'ordersTime',
						fieldLabel:'<s:text name="vOrdersList.ordersTime"/>',
						xtype:'datefield',
						format: 'Y-m-d H:i:s'				
					}/*,
					{
						flex:1,
						allowBlank:false,
						name:'recipeId',
						fieldLabel:'<s:text name="vOrdersList.recipeId"/>'
					}*/]
			},
			/*{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
			        {
						flex:1,
						allowBlank:false,
						name:'consumerId',
						fieldLabel:'<s:text name="vOrdersList.consumerId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'bookingId',
						fieldLabel:'<s:text name="vOrdersList.bookingId"/>'
					}]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
			        {
						flex:1,
						allowBlank:false,
						name:'buildingId',
						fieldLabel:'<s:text name="vOrdersList.buildingId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'ordersId',
						fieldLabel:'<s:text name="vOrdersList.ordersId"/>'
					}]
			},*/
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
			       {
						flex:1,
						name:'memo',
						height:80,
						fieldLabel:'<s:text name="vOrdersList.memo"/>'
					}]
			
			}],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
					saveFormToDB(saveForm, 'serve/vOrdersList!save',grid);
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
