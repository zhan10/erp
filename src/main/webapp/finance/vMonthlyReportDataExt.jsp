<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vMonthlyReport.year" />',dataIndex:'reportYear',name:'reportYear',align : 'center',width:550}
		,{text : '<s:text name="vMonthlyReport.month" />',dataIndex:'reportMonth',name:'reportMonth',align : 'center',flex:1}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
