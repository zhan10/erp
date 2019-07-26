<%@ page contentType="text/html;charset=UTF-8"%>
<script>
var userId = <sec:authentication property="principal.userId"/>;
dsUrl = 'resolve/vErpOrders!managerExt'
gridTitle='分解管理';
winTitle = '分解管理';
winWidth=800,
winHeight=500,
//baseSql=' and status in (2,4) and uid='+userId;
baseSql=' and status in (8)';
order=' order by id desc';
</script>
