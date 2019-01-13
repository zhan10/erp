<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
	    {
	    	text : '<s:text name="vRentContract.img" />',
	    	dataIndex:'img',
	    	name:'img',
	    	align : 'center',
	    	width:100,
	    	tooltip:'几天之内到期',
	    	convert:function(val,record){
	      		var date=new Date();
	      		var dates=Ext.Date.format(date,'Y-m-d H:i:s');
	      		var vd=Ext.Date.add(new Date(record.data.validDate), Ext.Date.HOUR, -8);
	      		var vdd=Ext.Date.format(vd,'Y-m-d H:i:s');
	      		var start=new Date(dates);
	      		var end=new Date(vdd);
	      		var s=Math.round((end.getTime() - start.getTime())/(1000*60*60*24));
	      		if(s>=0 && s<=7){
	      			return '<img style="vertical-align:middle; height:18px; width:18px;" src="img/toolbar/7day.png" title="7天之内过期"/>';
	      		}else if(s>7 && s<=30){
	      			return '<img style="vertical-align:middle; height:18px; width:18px;" src="img/toolbar/30day.png" title="30天之内过期"/>';
	      		}else if(s>30 && s<=60){
	      			return '<img style="vertical-align:middle; height:18px; width:18px;" src="img/toolbar/60day.png" title="60天之内过期"/>';
	      		}else if(s>60 && s<=90){
	      			return '<img style="vertical-align:middle; height:18px; width:18px;" src="img/toolbar/90day.png" title="90天之内过期"/>';
	      		}else if(s>90){
	      			return '';
	      		}else{
	      			return '<img style="vertical-align:middle; height:18px; width:18px;" src="img/toolbar/overdue.png" title="已过期"/>';
	      		}
	    	}
	    }
		,{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vRentContract.cityName" />',dataIndex:'cityName',name:'cityName',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vRentContract.areaName" />',dataIndex:'areaName',name:'areaName',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vRentContract.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:100}
		,{text : '<s:text name="vRentContract.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:100}
		,{text : '<s:text name="vRentContract.contractNumber" />',dataIndex:'contractNumber',name:'contractNumber',align : 'center',width:100}
		,{
			text : '<s:text name="vRentContract.state" />',
			dataIndex:'state',
			name:'state',
			align : 'center',
			width:100,
			renderer:function(val){
				if(val==0)
					return "未完成";
				if(val==1)
					return "完成";
			}
		 }
		,{text : '<s:text name="vRentContract.customerName" />',dataIndex:'customerName',name:'customerName',align : 'center',width:100}
		,{
			text : '<s:text name="vRentContract.contractDate" />',
			dataIndex:'contractDate',
			name:'contractDate',
			align : 'center',
			width:150,
			convert : function(val){
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
				return Ext.Date.format(date,'Y-m-d H:i:s');
			}
		}
		,{
			text : '<s:text name="vRentContract.usefulLife" />',
			dataIndex:'usefulLife',
			name:'usefulLife',
			align : 'center',
			width:150,
			convert : function(val){
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
				return Ext.Date.format(date,'Y-m-d H:i:s');
			}
		}
		,{
			text : '<s:text name="vRentContract.validDate" />',
			dataIndex:'validDate',
			name:'validDate',
			align : 'center',
			width:150,
			renderer : function(val){
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
				return Ext.Date.format(date,'Y-m-d H:i:s');
			}
		}
		,{text : '<s:text name="vRentContract.pic" />',dataIndex:'pic',name:'pic',align : 'center',width:200,
				renderer:function(v,m,record,ri,ci){  
					   var val= record.get('pic');  
					   return  val==''||val==null?'':'<a target="_blank" href="pics/rentcontract/'+val+'">'+val+'</a>';
				 } }
		,{text : '<s:text name="vRentContract.acreage" />',dataIndex:'acreage',name:'acreage',align : 'center',width:100}
		,{text : '<s:text name="vRentContract.population" />',dataIndex:'population',name:'population',align : 'center',width:100}
		,{text : '<s:text name="vRentContract.monthRent" />',dataIndex:'monthRent',name:'monthRent',align : 'center',width:100}
		,{text : '<s:text name="vRentContract.downPayment" />',dataIndex:'downPayment',name:'downPayment',align : 'center',width:100}
		,{text : '<s:text name="vRentContract.margin" />',dataIndex:'margin',name:'margin',align : 'center',width:100}
		,{
				text : '<s:text name="vRentContract.roomNumber" />',
				dataIndex:'roomNumber',
				width : 100,
				align : 'center',
				name:'roomNumber',
				renderer:function(val){
					try {
						var array = val.split(',');
						var temp;
	                    for (var i = 0; i < array.length; i++) {
	                         for (var j = i+1; j < array.length; j++) {
	                              if (array[i] > array[j]) {
	                                  temp = array[i];
	                                  array[i] = array[j];
	                                  array[j] = temp;  // 两个数交换位置
	                              }
	                         }
	                    };		
						var str="";
						var ret="";
						for(var i=0;i<array.length;i++){
							var a=parseInt(array[i]);
							str =cb_workbenchTypes_ds.findRecord('id',a).get('name');
							if(i!=array.length-1){
								ret+=(str+",");
							}else{
								ret+=(str);
							}
						}
							
						return ret;
					} catch (e) {
					}
				} 
			}
		,{text : '<s:text name="vRentContract.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vRentContract.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vRentContract.cityId" />',dataIndex:'cityId',name:'cityId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vRentContract.areaId" />',dataIndex:'areaId',name:'areaId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vRentContract.comment" />',dataIndex:'comment',name:'comment',align : 'center',width:150}
		];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	}/*  ,{
		xtype:'actioncolumn',
		locked:true,
		width:50,
		items:[ {
		    iconCls:'delete', 
			renderer:function(val){
			}
		}]
	} */];
	var mainColumns = columnOperators.concat(mainFields);
</script>
