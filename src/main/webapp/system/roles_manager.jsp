<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="rolesDefine.jsp"%>
	<%@ include file="rolesDataExt.jsp"%>
	<%@ include file="roles_users_grid.jsp"%>
	<%@ include file="rolesFormExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			

			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,550,form);	
			ds = getDs(mainFields, 'system/roles!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('name', 100, '',0, '<s:text name="roles.name" />'),
					'-',
					getTextField('info', 100, '',0, '<s:text name="roles.info" />'),
					'-',Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ],['name', '<s:text name="roles.name" />']
							,['info', '<s:text name="roles.info" />']
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
								t_sql = tbar.getComponent('info').getValue();
								if (t_sql != "")
									sqlStr += " and info like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/system/roles!add">
						,getAddButton(win,winTitle + '——新增','新增',function(){
							users_ds.removeAll();
			     			Ext.apply(select_users_ds.proxy.extraParams,{whereSql : ''});
			     			select_users_ds.load();
							select_users_grid.show();form.down('#btnMove').show();})
							,getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加',function(){
							Ext.apply(users_ds.proxy.extraParams,{whereSql : ' and id in (select a.userId from UserRole a where a.roleId='+(sm.getSelection())[0].get('id')+')'});
			     			users_ds.load();
			     			Ext.apply(select_users_ds.proxy.extraParams,{whereSql : ' and id not in (select a.userId from UserRole a where a.roleId='+(sm.getSelection())[0].get('id')+')'});
			     			select_users_ds.load();select_users_grid.show();form.down('#btnMove').show();})
						</sec:authorize>
						<sec:authorize url="/system/roles!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							Ext.apply(users_ds.proxy.extraParams,{whereSql : ' and id in (select a.userId from UserRole a where a.roleId='+(sm.getSelection())[0].get('id')+')'});
			     			users_ds.load();
			     			Ext.apply(select_users_ds.proxy.extraParams,{whereSql : ' and id not in (select a.userId from UserRole a where a.roleId='+(sm.getSelection())[0].get('id')+')'});
			     			select_users_ds.load();
							select_users_grid.show();form.down('#btnMove').show();})
					
						</sec:authorize>
						<sec:authorize url="/system/roles!del">
						,getDelButton(ds, sm, 'system/roles!delete','删除')
						</sec:authorize>
						
					]
				});
				bbar = getBbar(ds);
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						showWin(win,winTitle+'——查看',sm);
						Ext.apply(users_ds.proxy.extraParams,{whereSql : ' and id in (select a.userId from UserRole a where a.roleId='+(sm.getSelection())[0].get('id')+')'});
		     			users_ds.load();
		     			select_users_grid.hide();form.down('#btnMove').hide();						
					}
				});
				var addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '新增',
					handler: function(widget, event) {
						addWin(win, winTitle + '——新增');
						users_ds.removeAll();
		     			Ext.apply(select_users_ds.proxy.extraParams,{whereSql : ''});
		     			select_users_ds.load();
						select_users_grid.show();form.down('#btnMove').show();
					}
				});
				var copyAddAction = Ext.create('Ext.Action', {
					iconCls: 'copy',
					 text: '拷贝添加',
						handler: function(widget, event) { 
						copyAddWin(win,winTitle + '——拷贝添加', sm);  
						Ext.apply(users_ds.proxy.extraParams,{whereSql : ' and id in (select a.userId from UserRole a where a.roleId='+(sm.getSelection())[0].get('id')+')'});
		     			users_ds.load();
		     			Ext.apply(select_users_ds.proxy.extraParams,{whereSql : ' and id not in (select a.userId from UserRole a where a.roleId='+(sm.getSelection())[0].get('id')+')'});
		     			select_users_ds.load();
						select_users_grid.show();form.down('#btnMove').show();
					}
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);    
						Ext.apply(users_ds.proxy.extraParams,{whereSql : ' and id in (select a.userId from UserRole a where a.roleId='+(sm.getSelection())[0].get('id')+')'});
		     			users_ds.load();
		     			Ext.apply(select_users_ds.proxy.extraParams,{whereSql : ' and id not in (select a.userId from UserRole a where a.roleId='+(sm.getSelection())[0].get('id')+')'});
		     			select_users_ds.load();
						select_users_grid.show();form.down('#btnMove').show();
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'system/roles!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/system/roles!add">,addAction,copyAddAction</sec:authorize>
						<sec:authorize url="/system/roles!edit">,editAction</sec:authorize>
						<sec:authorize url="/system/roles!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					Ext.apply(users_ds.proxy.extraParams,{whereSql : ' and id in (select a.userId from UserRole a where a.roleId='+(sm.getSelection())[0].get('id')+')'});
	     			users_ds.load();
	     			select_users_grid.hide();form.down('#btnMove').hide();
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
