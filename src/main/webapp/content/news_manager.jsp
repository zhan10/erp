<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="newsDefine.jsp"%>
	<%@ include file="newsDataExt.jsp"%>
	<!-- 引入日期时间控件 -->
	<script type="text/javascript" src="dateTime/UX_TimePickerField.js"></script>
	<script type="text/javascript" src="dateTime/UX_DateTimePicker.js"></script>
	<script type="text/javascript" src="dateTime/UX_DateTimeMenu.js"></script>
	<script type="text/javascript" src="dateTime/UX_DateTimeField.js"></script>
	<!-- 富文本 -->
	<script type="text/javascript" src="richText/ueditor.config.js"></script>
	<script type="text/javascript" src="richText/ueditor.all.js"></script>
	<script type="text/javascript" src="richText/lang/zh-cn/zh-cn.js"></script>
	<link type="text/css" rel="stylesheet" href="richText/themes/default/css/ueditor.css">
	<script type="text/javascript" src="ueditor/ueditor.js"></script> 
	
	<!-- kindeditor富文本 -->
	<script type="text/javascript" src="kindeditor/kindeditor-min.js"></script> 
	<script type="text/javascript" src="kindeditor/lang/zh_CN.js"></script>
	<script type="text/javascript" src="kindeditor/license.js"></script>
	<%@ include file="newsFormExt.jsp"%>
	<%@ include file="newsSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,400,form);
			ds = getDs(mainFields, 'news/news!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						//grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
					getTextField('title', 100, '',0, '<s:text name="news.newsTitle" />'),
					'-',
					getTextField('site', 100, '',0, '<s:text name="news.site" />'),
					'-',
					Ext.create('Ext.form.DateField',{
		            	name:'activityTime',
		                itemId : 'activityTime',
		                width : 100,
		                format : 'Y-m-d',
		                emptyText:'活动时间'
	                }),
					'-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 100,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['title', '<s:text name="news.newsTitle" />']
							,['site', '<s:text name="news.site" />']
							,['activityTime', '<s:text name="news.activityTime" />']
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
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('activityTime').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',activityTime)=0";
								t_sql = tbar.getComponent('title').getValue();
								if (t_sql != "")
									sqlStr += " and title like '%"+ t_sql+ "%' ";
								t_sql = tbar.getComponent('site').getValue();
								if (t_sql != "")
									sqlStr += " and site like '%"+ t_sql+ "%' ";
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
						<sec:authorize url="/content/news!add">
						,getAddButton(win,winTitle + '——新增','新增')
						</sec:authorize>
						<sec:authorize url="/content/news!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							var rec=(sm.getSelection())[0];
							if(rec.get('pic')!=''){
							form.down('#fileShow').setValue('<a target="_blank" href="pics/news/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');
						}else{
							form.down('#fileShow').setValue('');
						}
							form.down('#uploadFile').setVisible(true);	
							form.down('#delFileFlag').setVisible(true);	
							form.down('#fileShow').setVisible(true);
							})
						</sec:authorize>
						<sec:authorize url="/content/news!del">
						,getDelButton(ds, sm, 'news/news!delete','删除')
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
						if(rec.get('pic')!=''){
							form.down('#fileShow').setValue('<a target="_blank" href="pics/exhibitionRoom/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
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
						if(rec.get('pic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/building/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow').setValue('');
					}
						form.down('#uploadFile').setVisible(true);	
						form.down('#delFileFlag').setVisible(true);	
						form.down('#fileShow').setVisible(true);
						form.down('#fileShow').hideLabel=true;
					 }
				});
				var delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'news/news!delete',function(){});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/content/news!edit">,editAction</sec:authorize>
						<sec:authorize url="/content/news!add">,addAction</sec:authorize>
						<sec:authorize url="/content/news!del">,delAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					if(rec.get('pic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/exhibitionRoom/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
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
