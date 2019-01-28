function addItem(item,id){
		var mateTypeData = gatData(" and parentid='"+id+"' and matetypeid<>'"+id+"'");
		number = number+1;
		var con = Ext.create('Ext.container.Container', {
		    layout: 'hbox',
		    itemId : 'matetypeid'+number,
		    defaultType : 'textfield',
			items : [  
				{
					width:100,
					allowBlank : false,
					xtype : 'combo',
					displayField : 'name',forceSelection:false,
					valueField : 'id',
					store : mateTypeData,
					listeners : {
						select : function(combo,records) {
							form.down('#matetypeid').setValue(this.getValue())
							var items=Ext.getCmp('mateTypeCombos');
							var x = parseInt(con.itemId.substring(10));
							if(number!=x){
								for(var i=0;i<number-x;i++){
									items.remove("matetypeid"+(number-i));
								}
								number = x;
							}
							addItem(items,this.getValue());
						}
					}
				}
			]
		})
		mateTypeData.load({
			scope: this,
		    callback: function(records, operation, success) {
		        if(records.length!=0){
		        	item.add(con);
		        }
		    }
		})
		//item.add(con);
	}
	function gatData(whereSql){
		var mateTypeData =new Ext.data.Store({
			autoLoad:true,//必须自动加载以保证根据ID选中初始值
			pageSize:9999,
			fields: [{
            	name: 'id',
           		mapping: function(raw) {
                      return raw[0];
           		 }
        		}, {
		            name: 'name',
		            mapping: function(raw) {
		               return raw[1];
           			 }
      		  }, {
		            name: 'grade',
		            mapping: function(raw) {
		               return raw[2];
           			 }
      		  }, {
		            name: 'parentid',
		            mapping: function(raw) {
		               return raw[3];
           			 }
      		  }, {
		            name: 'isend',
		            mapping: function(raw) {
		               return raw[4];
           			 }
      		  }],
			proxy : {
				type : 'ajax',
				batchActions:true,
				actionMethods : {
					read : 'POST' // post方法解决中文参数乱码问题
				},
				url : 'mater/mateType!getMateTypeComboBox',				
				extraParams : {
					whereSql:whereSql,
					baseSql : '',
					order : 'order by name'
				},
				reader : {
					type : 'json',
					totalProperty: 'sum',
					root : 'records'
				}
			}
		});
		return mateTypeData;
	}