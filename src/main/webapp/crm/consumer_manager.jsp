<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="consumerDefine.jsp"%>
	<%@ include file="consumerDataExt.jsp"%>
	<%@ include file="consumerFormExt.jsp"%>
	<%@ include file="consumerSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);
			
			ds = getDs(mainFields, 'crm/consumer!managerExt', baseSql,order);
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
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'type',		
						width : 80,
						value : -1,
						mode : 'local',
						editable : false,
						store : [
							[-1,'个人/单位']
							,[2, '个人']
							,[1, '单位']	
						]
					}),		
					'-',
					getTextField('name', 100, '',0, '<s:text name="consumer.name" />'),
					'-',
					getTextField('loginName', 100, '',0, '<s:text name="consumer.loginName" />'),
					'-',
					getTextField('address', 100, '',0, '<s:text name="consumer.address" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['points', '<s:text name="consumer.points" />']
							,['name', '<s:text name="consumer.name" />']
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
								t_sql = tbar.getComponent('type').getValue();
								if (t_sql!=-1&&t_sql!=null)
									sqlStr += " and type like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('name').getValue();
								if (t_sql != "")
									sqlStr += " and name like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('loginName').getValue();
								if (t_sql != "")
									sqlStr += " and loginName like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('address').getValue();
								if (t_sql != "")
									sqlStr += " and address like '%"+ t_sql+ "%' ";
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
							Ext.apply(
								ds.proxy.extraParams,{whereSql : sqlStr,order : order});
								ds.loadPage(1);
							}
						},
						'->','-'
						<sec:authorize url="/crm/consumer!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改')
						</sec:authorize>
						/*
						<sec:authorize url="/crm/consumer!add">
						,getAddButton(win,winTitle + '——新增','新增',function(){form.down('#uploadFile').setVisible(true);	
						form.down('#delFileFlag').setVisible(false);	
						form.down('#fileShow').setVisible(false);}) ,						
						getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加',function(){form.down('#uploadFile').setVisible(true);	
						form.down('#delFileFlag').setVisible(false);	
						form.down('#fileShow').setVisible(false);}) 
						</sec:authorize>*/
						/* <sec:authorize url="/crm/consumer!edit">
						,getEditButton(win,winTitle+'——修改密码', sm,'修改密码',function(){
						var rec=(sm.getSelection())[0];
						if(rec.get('pic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/consumer/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');
					}else{
						form.down('#fileShow').setValue('');
					}
						form.down('#uploadFile').setVisible(false);	
						form.down('#delFileFlag').setVisible(false);	
						form.down('#fileShow').setVisible(true);
						form.down('#type').setReadOnly(true);
						form.down('#points').setReadOnly(true);
						form.down('#balan').setReadOnly(true);
						form.down('#name').setReadOnly(true);
						form.down('#loginName').setReadOnly(true);
						form.down('#sexs').setReadOnly(true);
						form.down('#birth').setReadOnly(true);
						form.down('#tel').setReadOnly(true);
						form.down('#email').setReadOnly(true);
						form.down('#address').setReadOnly(true);
						form.down('#certificate').setReadOnly(true);
						form.down('#certificateCode').setReadOnly(true);
						form.down('#cardType').setReadOnly(true);
						form.down('#cardCode').setReadOnly(true);
						})
						</sec:authorize> */
						<sec:authorize url="/crm/consumer!del">
						,getDelButton(ds, sm, 'crm/consumer!delete','删除')
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
						var rec=(sm.getSelection())[0];
						if(rec.get('pic')!=''&&rec.get('pic')!=null){
							form.down('#fileShow').setValue('<a target="_blank" href="pics/consumer/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
						}else{
							form.down('#fileShow').setValue('');
						}
						form.down('#uploadFile').setVisible(false);	
						form.down('#delFileFlag').setVisible(false);	
						form.down('#fileShow').setVisible(true);
					}
				});
				var addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '新增',
					handler: function(widget, event) {
						addWin(win, winTitle + '——新增');
						form.down('#uploadFile').setVisible(true);	
						form.down('#delFileFlag').setVisible(false);	
						form.down('#fileShow').setVisible(false);
					}
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'crm/consumer!delete',function(){});
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);     
					 }
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/crm/consumer!edit">,editAction</sec:authorize>
						<sec:authorize url="/crm/consumer!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					if(rec.get('pic')!=''&&rec.get('pic')!=null){	
						form.down('#fileShow').setValue('<a target="_blank" href="pics/consumer/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow').setValue('');
					}
					form.down('#uploadFile').setVisible(false);	
					form.down('#delFileFlag').setVisible(false);	
					form.down('#fileShow').setVisible(true);	
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
