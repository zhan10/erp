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
						name:'timeEntry',
						fieldLabel:'<s:text name="receipt.timeEntry"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'accountNumber',
						fieldLabel:'<s:text name="receipt.accountNumber"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'outTradeNo',
						fieldLabel:'<s:text name="receipt.outTradeNo"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'tradeNo',
						fieldLabel:'<s:text name="receipt.tradeNo"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'city',
						fieldLabel:'<s:text name="receipt.city"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'serviceItems',
						fieldLabel:'<s:text name="receipt.serviceItems"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'productName',
						fieldLabel:'<s:text name="receipt.productName"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'price',
						fieldLabel:'<s:text name="receipt.price"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'amount',
						fieldLabel:'<s:text name="receipt.amount"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'receiptAmount',
						fieldLabel:'<s:text name="receipt.receiptAmount"/>'
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
						name:'accountBalance',
						fieldLabel:'<s:text name="receipt.accountBalance"/>'
					},
				]
			},
		],
		buttons : [{
		text : '关闭',
			itemId : 'btnClose',
			handler : function() {
				this.up('window').hide();
			}
			} ]
			});
</script>
