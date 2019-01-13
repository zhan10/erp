<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vDailyReport.year" />',dataIndex:'reportYear',name:'reportYear',align : 'center',width:350}
		,{text : '<s:text name="vDailyReport.month" />',dataIndex:'reportMonth',name:'reportMonth',align : 'center',width:350}
		,{text : '<s:text name="vDailyReport.day" />',dataIndex:'reportDay',name:'reportDay',align : 'center',flex:1}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
