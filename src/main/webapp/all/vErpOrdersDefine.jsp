<%@ page contentType="text/html;charset=UTF-8"%>
<script>
var userId = <sec:authentication property="principal.userId"/>;
dsUrl = 'factory/vErpOrders!managerExt'
gridTitle='工厂客服';
winTitle = '工厂客服';
winWidth=800,
winHeight=500,
//baseSql=' and status in (2,4) and uid='+userId;
baseSql='';
order=' order by id desc';
</script>
