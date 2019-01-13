<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="vHealthDefine.jsp"%>
	<%@ include file="vHealthDataExt.jsp"%>
	<%@ include file="tabs_health.jsp"%>
	<%@ include file="vHealthFormExt.jsp"%>
	<%@ include file="vHealthSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
	//var a = <sec:authentication property="principal.Username"/>
	//alert(a);
	var userId;
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,500,form);
			batchWin=getWindow('批量修改',320,160,320,160,batchForm);
			ds = getDs(mainFields, 'crm/vHealth!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('name', 100, '',0, '<s:text name="vHealth.name"/>'),
					'-',
					getTextField('certificateCode', 100, '',0, '<s:text name="vHealth.certificateCode"/>'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ],
							[ 'id', '<s:text name="vHealth.id"/>'],
							[ 'checkedTime', '<s:text name="vHealth.checkedTime"/>'],
							[ 'name', '<s:text name="vHealth.name"/>'],
							[ 'sex', '<s:text name="vHealth.sex"/>'],
							[ 'birth', '<s:text name="vHealth.birth"/>'],
							[ 'certificate', '<s:text name="vHealth.certificate"/>'],
							[ 'certificateCode', '<s:text name="vHealth.certificateCode"/>'],
							[ 'tel', '<s:text name="vHealth.tel"/>'],
							[ 'email', '<s:text name="vHealth.email"/>'],
							[ 'address', '<s:text name="vHealth.address"/>'],
							[ 'cardType', '<s:text name="vHealth.cardType"/>'],
							[ 'cardCode', '<s:text name="vHealth.cardCode"/>'],
							[ 'height', '<s:text name="vHealth.height"/>'],
							[ 'weight', '<s:text name="vHealth.weight"/>'],
							[ 'pulse', '<s:text name="vHealth.pulse"/>'],
							[ 'diastolicPressure', '<s:text name="vHealth.diastolicPressure"/>'],
							[ 'systolicPressure', '<s:text name="vHealth.systolicPressure"/>'],
							[ 'bodyFatRatio', '<s:text name="vHealth.bodyFatRatio"/>'],
							[ 'oxygenSaturation', '<s:text name="vHealth.oxygenSaturation"/>'],
							[ 'userId', '<s:text name="vHealth.userId"/>']
						]
					}),
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderType',
						width : 60,
						value : 'asc',
						hideLabel : true,
						mode : 'local',
						selectOnFocus : true,
						editable : false,
						store : [['asc','顺序' ],['desc','倒序' ]]
					}),
					{
						text : '查询',
						iconCls : 'search',
						handler : function() {
							sqlStr = "";
							t_sql = "";
							try {
								t_sql = tbar.getComponent('name').getValue();
								if (t_sql != "")
									sqlStr += " and name like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('certificateCode').getValue();
								if (t_sql != "")
									sqlStr += " and certificateCode like '%"+ t_sql+ "%' ";
								var orderBy = tbar.getComponent('orderBy').getValue();
								if (orderBy != ''){
									order = " order by "+ orderBy;
									var orderType = tbar.getComponent('orderType').getValue();
									if (orderType == 'desc')
										order += " desc";
								}
							}catch(e){
								Ext.MessageBox.alert('错误', '查询条件有误' + e);
							}
							/*Ext.apply(
								ds.proxy.extraParams,{whereSql : sqlStr,order : order});
								ds.loadPage(1);*/
							}
						},
						'->','-'
						/* <sec:authorize url="/crm/health!add">
						,getAddButton(win,winTitle + '——新增','新增'),
						getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加')
						</sec:authorize> */
						<sec:authorize url="/crm/vHealth!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改')/* ,
						getBatchButton(batchWin,sm,'批量修改') */
						</sec:authorize>
						<sec:authorize url="/crm/vHealth!del">
						,getDelButton(ds, sm, 'crm/health!delete','删除')
						</sec:authorize>
						,getComSearchButton(searchWin,'复合查询')
					]
				});
				bbar = getBbar(ds);
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						showWin(win, winTitle+'——查看',sm);	
					}
				});
				/* var addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '新增',
					handler: function(widget, event) {
						addWin(win, winTitle + '——新增');
					}
				});
				var copyAddAction = Ext.create('Ext.Action', {
					iconCls: 'copy',
					 text: '拷贝添加',
						handler: function(widget, event) { 
						copyAddWin(win,winTitle + '——拷贝添加', sm);   
					}
				}); */
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);     
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'crm/health!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						/* <sec:authorize url="/crm/health!add">,addAction,copyAddAction</sec:authorize> */
						<sec:authorize url="/crm/vHealth!edit">,editAction</sec:authorize>
						<sec:authorize url="/crm/vHealth!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					userId=rec.get('userId');
					showWinByRec(win,winTitle+'——查看',rec);
					tabs.setActiveTab(0);
					Ext.apply(health_ds.proxy.extraParams,{whereSql :' and userId='+userId});
    				health_ds.load();
				});
				grid.on('itemcontextmenu',function(view, rec, node, index, e) {
					e.stopEvent();
					contextMenu.showAt(e.getXY());
					return false;
				});
				var viewport = Ext.create('Ext.Viewport', {
							layout : 'fit',
							items : grid
					});	
		});
	</script>
</body>
</html>
