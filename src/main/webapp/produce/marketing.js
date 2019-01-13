function addItem(id,form){
	var searchOperates1 = [ '=', '>', '>=', '<', '<=' ];
	var dd = 'dd' + id;
	var nn = 'nn' + id;
	var mm = 'mm' + id;
	var aa = 'aa' + id;
	var srt=1;
	var store=cb_productType_ds;
var con = Ext.create('Ext.container.Container', {
	    layout: {
	        type: 'hbox'
	    },
	    itemId : id,
	    defaultType : 'textfield',
		items : [ {
			flex : 2,
			xtype : 'combo',
			id : dd,
			allowBlank : true,
			fieldLabel : '名称',
			store : marketingNameStore,
			listeners : {
				select : function(dd,records) {
					Ext.getCmp(mm).reset();
					var name = dd.getValue();
					/*var value = Ext.getCmp(mm).getStore();
					value.clearFilter(true);
					value.filter("dd", name);
					marketingValueDs.load();*/
					if(name=='dateFrom'){
						Ext.getCmp(mm).setVisible(false);
						Ext.getCmp('total'+id).setVisible(false);
						form.down('#aa'+id+'').setVisible(true);
					}else if(name=='bookingTime'){
						Ext.getCmp(mm).setVisible(false);
						Ext.getCmp('total'+id).setVisible(false);
						form.down('#aa'+id+'').setVisible(true);
					}else if(name=='name'){
						Ext.getCmp(mm).setVisible(true);
						Ext.getCmp('total'+id).setVisible(false);
						form.down('#aa'+id+'').setVisible(false);
					}else if(name=='member'){
						Ext.getCmp(mm).setVisible(true);
						Ext.getCmp('total'+id).setVisible(false);
						form.down('#aa'+id+'').setVisible(false);
					}else if(name=='total'){
						Ext.getCmp(mm).setVisible(false);
						Ext.getCmp('total'+id).setVisible(true);
						form.down('#aa'+id+'').setVisible(false);
					}
				}
			}
		}, {
			flex : 2,
			xtype : 'combo',
			allowBlank : true,
			itemId : nn,
			store : searchOperates1,
			fieldLabel : '操作'
		}, {
			flex : 2,
			xtype : 'combo',
			id : mm,
			fieldLabel : '值',
			displayField : 'name',
			valueField : 'name',
			store : store,
			listeners:{
				expand: function(){
					var name=form.down('#dd'+id+'').getValue();
					if(name=='member'){
						Ext.getCmp(mm).getStore().getProxy().url='produce/memberLevel!getMemberLevelComboBox';
						Ext.getCmp(mm).getStore().loadPage(1);
					}else if(name=='name'){
						Ext.getCmp(mm).getStore().getProxy().url='system/productType!getProductTypesComboBox';
						Ext.getCmp(mm).getStore().loadPage(1);
					}
				}
			}
		},{
			flex : 2,
			name : 'consumeTo',
			id : aa,
			fieldLabel : '值',
			xtype:'datefield',
			format: 'Y-m-d'
		}, 
		 {
			flex : 2,
			name : 'price',
			id : 'total'+id,
			fieldLabel : '值',
		}, 
		{
			flex : 1,
			xtype : 'fieldcontainer',
			layout:"hbox", 
			items:[
				
				{
					xtype : 'button',
					text : '删除',
					id : 'delete'+id,
					handler : function() {
						ss=ss-1;
						form.remove(con.itemId);
						var x=form.items.get(form.items.length-1).itemId;
						if(form.items.length!=8){
							form.down('#delete'+x+'').setVisible(true);
							form.down('#add'+x+'').setVisible(true);
						}else{
							var x=form.items.get(form.items.length-1).itemId;
							var name=form.down('#dd'+x+'').getValue();
							var flag=form.down('#nn'+x+'').getValue();
							var val=form.down('#mm'+x+'').getValue();
							var time=form.down('#aa'+x+'').getValue();
							var totalPrice=form.down('#total'+x+'').getValue();
							form.remove(form.items.get(form.items.length-1));
							ss=1;
							addItem(ss,form);
							form.down('#delete'+ss+'').setVisible(false);
							form.down('#dd'+ss+'').setValue(name);
							form.down('#nn'+ss+'').setValue(flag);
							form.down('#mm'+ss+'').setValue(val);
							form.down('#aa'+ss+'').setValue(time);
							form.down('#total'+ss+'').setValue(totalPrice);
							if(name=='dateFrom'){
								form.down('#mm'+ss+'').setVisible(false);
								form.down('#total'+ss+'').setVisible(false);
							}else if(name=='bookingTime'){
								form.down('#mm'+ss+'').setVisible(true);
								form.down('#total'+ss+'').setVisible(false);
							}else if(name=='name'){
								form.down('#aa'+ss+'').setVisible(false);
								form.down('#total'+ss+'').setVisible(false);
							}else if(name=='member'){
								form.down('#aa'+ss+'').setVisible(false);
								form.down('#total'+ss+'').setVisible(false);
							}else if(name=='total'){
								form.down('#aa'+ss+'').setVisible(false);
								form.down('#mm'+ss+'').setVisible(false);
							}else{
								form.down('#aa'+ss+'').setVisible(false);
								form.down('#mm'+ss+'').setVisible(false);
							}
						}
					}
				} ,{
					xtype:'button',
					text:'新增',
					id : 'add'+id,
					handler:function(){
						ss++;
						var maxId=form.items.get(form.items.length-1).itemId+1;
						addItem(maxId,form);
						form.down('#aa'+maxId+'').setVisible(false);
						form.down('#mm'+maxId+'').setVisible(false);
						form.down('#delete'+(maxId-1)+'').setVisible(true);
						form.down('#add'+(maxId-1)+'').setVisible(false);
					} 
				}
			],
		},
		]
	})
	form.add(con);
}