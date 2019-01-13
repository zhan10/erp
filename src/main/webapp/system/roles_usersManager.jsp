<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="roles_usersDefine.jsp"%>
	<%@ include file="roles_usersDataExt.jsp"%>
	<%@ include file="roles_usersFormExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			

			Ext.QuickTips.init();			
			win = getWindow(winTitle,winWidth,winHeight,500,550,form);	
			ds = getDs(mainFields, 'system/users!getUsersNameCode', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {						
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);						
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('name', 100, '',0, '<s:text name="users.name" />'),
					'-',
					getTextField('code', 100, '',0, '<s:text name="users.code" />'),
					'-',Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ],['name', '<s:text name="users.name" />']
							,['code', '<s:text name="users.code" />']
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
								t_sql = tbar.getComponent('code').getValue();
								if (t_sql != "")
									sqlStr += " and code like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/system/roles!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							form.down('#code').setReadOnly(true);form.down('#name').setReadOnly(true);
							Ext.apply(roles_ds.proxy.extraParams,{whereSql : ' and id in (select a.roleId from UserRole a where a.userId='+(sm.getSelection())[0].get('id')+')'});
			     			roles_ds.load();
			     			Ext.apply(select_roles_ds.proxy.extraParams,{whereSql : ' and id not in (select a.roleId from UserRole a where a.userId='+(sm.getSelection())[0].get('id')+')'});
			     			select_roles_ds.load();
							select_roles_grid.show();form.down('#btnMove').show();})					
						</sec:authorize>												
					]
				});
				bbar = getBbar(ds);
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						showWin(win,winTitle+'——查看',sm);
						Ext.apply(roles_ds.proxy.extraParams,{whereSql : ' and id in (select a.roleId from UserRole a where a.userId='+(sm.getSelection())[0].get('id')+')'});
						roles_ds.load();
		     			select_roles_grid.hide();form.down('#btnMove').hide();						
					}
				});				
				
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);   						
						form.down('#code').setReadOnly(true);form.down('#name').setReadOnly(true);
						Ext.apply(roles_ds.proxy.extraParams,{whereSql : ' and id in (select a.roleId from UserRole a where a.userId='+(sm.getSelection())[0].get('id')+')'});
			 			roles_ds.load();
			 			Ext.apply(select_roles_ds.proxy.extraParams,{whereSql : ' and id not in (select a.roleId from UserRole a where a.userId='+(sm.getSelection())[0].get('id')+')'});
			 			select_roles_ds.load();
						select_roles_grid.show();form.down('#btnMove').show();
					 }
				});
				
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/system/roles!edit">,editAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					Ext.apply(roles_ds.proxy.extraParams,{whereSql : ' and id in (select a.roleId from UserRole a where a.userId='+(sm.getSelection())[0].get('id')+')'});
	     			roles_ds.load();
	     			select_roles_grid.hide();form.down('#btnMove').hide();
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
