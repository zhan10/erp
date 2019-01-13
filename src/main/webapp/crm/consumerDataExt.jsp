<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,
		{text : '<s:text name="consumer.type" />',dataIndex:'type',name:'type',align : 'center',width:100,
		renderer : setType}
		,{text : '<s:text name="consumer.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="consumer.points" />',dataIndex:'points',name:'points',align : 'center',width:100}
		,{text : '<s:text name="consumer.fund" />',dataIndex:'fund',name:'fund',align : 'center',width:100}
		,{text : '<s:text name="consumer.loginName" />',dataIndex:'loginName',name:'loginName',align : 'center',width:100}
		, {
		text : '<s:text name="users.birth" />',
		type : 'date',
		dataIndex : 'birth',
		name : 'birth',
		width : 120,
		align : 'center',
		renderer : Ext.util.Format.dateRenderer('Y-m-d')
	}, {
		text : '<s:text name="consumer.sex" />',
		dataIndex : 'sex',
		type : 'boolean',
		name : 'sex',
		flex:1,
		align : 'center',
		convert : function(v, record) {//boolean类型中的false传给radio会有问题，转换为0\1
			if(v==true)
				return 1;
			if(v==false)
				return 0;
		},		
		renderer : setSex 
	}
		,{text : '<s:text name="consumer.tel" />',dataIndex:'tel',name:'tel',align : 'center',width:100}
		,{text : '<s:text name="consumer.email" />',dataIndex:'email',name:'email',align : 'center',width:100}
		,{text : '<s:text name="consumer.officeAddress" />',dataIndex:'officeAddress',name:'officeAddress',align : 'center',width:100}
		,{text : '<s:text name="consumer.address" />',dataIndex:'address',name:'address',align : 'center',width:100}
		,{text : '<s:text name="consumer.certificate" />',dataIndex:'certificate',name:'certificate',align : 'center',width:100,renderer : setSertificate}
		,{text : '<s:text name="consumer.certificateCode" />',dataIndex:'certificateCode',name:'certificateCode',align : 'center',width:100}
		,{text : '<s:text name="consumer.cardType" />',dataIndex:'cardType',name:'cardType',align : 'center',width:100,renderer : setCardType}
		,{text : '<s:text name="consumer.cardCode" />',dataIndex:'cardCode',name:'cardCode',align : 'center',width:100}
		,{text : '<s:text name="consumer.balance" />',dataIndex:'balance',name:'balance',align : 'center',width:100,
			convert : function(v, record) {//boolean类型中的false传给radio会有问题，转换为0\1
				if(v==true)
					return 1;
				if(v==false)
					return 0;
			},		
			renderer:function(v,m,record,ri,ci){
			if(v==1)
				return '已结算';
			if(v==0)
				return '未结算';
		} }
		,{text : '<s:text name="consumer.pic" />',dataIndex:'fileShow',name:'fileShow',align : 'center',width:200,
			renderer:function(v,m,record,ri,ci){  
			   var val= record.get('pic');  
			   return  val==''||val==null?'':'<a target="_blank" href="pics/consumer/'+val+'">'+val+'</a>';
		 } },		
		{text : '<s:text name="consumer.pic" />',dataIndex:'pic',name:'pic',hidden:true}
		//{text : '<s:text name="consumer.pwd" />',dataIndex:'pwd',name:'pwd',hidden:true}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	},{
		xtype:'actioncolumn',
		locked:true,
		width:50,
		items:[{
			icon:'img/toolbar/edit.gif',
			tooltip:'修改',
			handler : function(grid, rowIndex, colIndex) {
				//sm.select(rowIndex);
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'system/consumer!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
	
	function setSex(v) {
		if (v==1)
			return "男";
		if(v==0)
		return "女";
	}
	
	function setType(v) {
		if (v==1)
			return "单位";
		if(v==2)
		return "个人";
	}
	function setCardType(v) {
		if (v == 1)
			return "绿地卡";
		if (v == 2)
			return "招商卡";		
		return "";
	}
	function setSertificate(v) {
		if (v == 1)
			return "身份证";
		if (v == 2)
			return "护照";	
			if (v == 3)
			return "其它";	
		return "";
	}
</script>
