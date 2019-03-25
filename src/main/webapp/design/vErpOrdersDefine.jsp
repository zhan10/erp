<%@ page contentType="text/html;charset=UTF-8"%>
<script>
var userId = <sec:authentication property="principal.userId"/>;
dsUrl = 'design/vErpOrders!managerExt'
gridTitle='设计管理';
winTitle = '设计管理';
winWidth=800,
winHeight=500,
//baseSql=' and status in (2,4) and uid='+userId;
baseSql=' and status in (2,4)';
order=' order by id desc';
</script>
