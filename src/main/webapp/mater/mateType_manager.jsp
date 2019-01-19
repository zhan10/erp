<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="mateTypeDefine.jsp"%>
	<!-- 下拉框数据 -->
	<%@ include file="../c/cb_warehouse.jsp"%>
	<%@ include file="../c/cb_mateType.jsp"%>
	<script type="text/javascript" src="ini/getWarehouseTypeStatusDs.js"></script>
	<%@ include file="mateTypeDataExt.jsp"%>
	<%@ include file="mateTypeFormExt.jsp"%>
	<%@ include file="mateTypeSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,600,380,form);
			ds = getDs(mainFields, 'mater/mateType!managerExt', baseSql,order);
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
					getTextField('matetypeid', 100, '',0, '<s:text name="mateType.matetypeid" />'),
					'-',
					getTextField('matertypename', 100, '',0, '<s:text name="mateType.matertypename" />'),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 100,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['matetypeid', '<s:text name="mateType.matetypeid" />']
							,['matertypename', '<s:text name="mateType.matertypename" />']
							,['grade', '<s:text name="mateType.grade" />']
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
								t_sql = tbar.getComponent('matetypeid').getValue();
								if (t_sql != "")
									sqlStr += " and matetypeid like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('matertypename').getValue();
								if (t_sql != "")
									sqlStr += " and matertypename like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/mater/mateType!add">
						,getAddButton(win,winTitle + '——新增','新增',function(){})
						</sec:authorize>
						<sec:authorize url="/mater/mateType!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							var rec=(sm.getSelection())[0];
							set(rec);
						})
						</sec:authorize>
						<sec:authorize url="/mater/mateType!del">
						,getDelButton(ds, sm, 'mater/mateType!delete','删除')
						</sec:authorize>
					]
				});
				bbar = getBbar(ds);
				var showAction=Ext.create('Ext.Action', {
					iconCls: 'open',
					text: '查看',
					handler: function(widget, event) {
						showWin(win, winTitle+'——查看',sm);
						var rec=(sm.getSelection())[0];
						set(rec);
					}
				});
				var addAction = Ext.create('Ext.Action', {
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
				});
				var editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					text: '修改',
					handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);  
						var rec=(sm.getSelection())[0];
						set(rec);
					}	
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'mater/mateType!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/mater/mateType!add">,addAction</sec:authorize>
						<sec:authorize url="/mater/mateType!edit">,editAction</sec:authorize>
						<sec:authorize url="/mater/mateType!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					set(rec);
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
		function set(rec){
			var grade = rec.get("grade");
			form.down('#gradeOld').setValue(grade);
			if(grade==1){
				form.down('#grades').items.get(0).setValue(true);
				form.down('#parentid').hide();
			}else if(grade==2){
				form.down('#parentid').setValue(rec.get("matetypeid"));
				form.down('#parentid').show();
				form.down('#grades').items.get(1).setValue(true);
			}else{
				form.down('#parentid').show();
				form.down('#grades').items.get(2).setValue(true);
			}
		}
	</script>
</body>
</html>
