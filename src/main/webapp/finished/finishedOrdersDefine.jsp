<%@ page contentType="text/html;charset=UTF-8"%>
<script>
var userId = <sec:authentication property="principal.userId"/>;
dsUrl = 'finished/vErpOrders!managerExt'
gridTitle='成品出库';
winTitle = '成品出库';
winWidth=800,
winHeight=500,
//baseSql=' and status in (2,4) and uid='+userId;
baseSql=' and status in (13)';
order=' order by id desc';
</script>
