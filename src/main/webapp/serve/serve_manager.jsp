<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<%@ include file="../jspComm/extHeader.jsp"%>
	<%@ include file="serveDataExt.jsp"%>
	<script type="text/javascript" src="ini/getServeStateDs.js"></script>
	<script type="text/javascript" src="ini/getServiceTypeDs.js"></script>
	<script type="text/javascript" src="serve/commonality.js"></script>
	<%@ include file="serveDefine.jsp"%>
	<%@ include file="serveFormExt.jsp"%>
	<%@ include file="serveSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
	var userId = <sec:authentication property="principal.userId"/>;
	var userName = '<sec:authentication property="principal.name"/>';
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.defaultFormat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,500,430,form);
			/*batchWin=getWindow('批量修改',320,160,320,160,batchForm);*/
			ds = getDs(mainFields, 'serve/serve!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						//grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						//grid.down('#tbar_btn_batch').setDisabled(selections.length == 0);
						grid.down('#gridDispose').setDisabled(selections.length != 1);
						grid.down('#gridFinish').setDisabled(selections.length != 1);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
                   /* Ext.create('Ext.form.field.ComboBox',{
	               itemId : 'state',
	               width : 100,
	               displayField: 'text',
	               valueField: 'value',
	               value:-1,
	               label : '<s:text name="serve.state" />',
	               mode : 'local',
	               selectOnFocus : true,
	               editable : false,
	               store :serveStateDs
                   }),
                   '-', */
                   Ext.create('Ext.form.field.ComboBox',{
    	               itemId : 'serviceType',
    	               width : 100,
    	               displayField: 'text',
    	               valueField: 'value',
    	               value:'-1',
    	               label : '<s:text name="serve.serviceType" />',
    	               mode : 'local',
    	               selectOnFocus : true,
    	               editable : false,
    	               store :serviceTypeDs
                       }),
                       '-',
                    Ext.create('Ext.form.DateField',{
	                  name:'data',
	                  id : 'data',
	                  width : 100,
	                  format : 'Y-m-d',
	                  emptyText:'创建时间'
                      }),		
                      '-',
					getTextField('name', 100, '',0, '<s:text name="serve.name" />'),
					'-',
					/*getTextField('state', 100, '',0, '<s:text name="serve.state" />'),
					'-',*/
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 80,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['name', '<s:text name="serve.name" />']
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
								/* t_sql = tbar.getComponent('state').getValue();
								if (t_sql != "" && t_sql!="-1")
									sqlStr += " and state ="+ t_sql; */
								t_sql = tbar.getComponent('serviceType').getValue();
								if (t_sql != "" && t_sql!="-1")
									sqlStr += " and serviceType ="+ t_sql;
								t_sql = tbar.getComponent('name').getValue();
								if (t_sql != "")
									sqlStr += " and name like '%"+ t_sql+ "%' ";
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('data').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',data)=0";
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
						'->'
						/*<sec:authorize url="/serve/serve!add">
						,getAddButton(win,winTitle + '——新增','新增'),
						getCopyAddButton(win,winTitle + '——拷贝添加', sm,'拷贝添加')
						</sec:authorize>*/
						/*<sec:authorize url="/serve/serve!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							form.down('#state').setReadOnly(true);
							form.down('#serviceType').setReadOnly(true);
							form.down('#name').setReadOnly(true);
							form.down('#phone').setReadOnly(true);
							form.down('#eMail').setReadOnly(true);
							form.down('#data').setReadOnly(true);
							form.down('#demandDescription').setReadOnly(true);
							form.down('#btnFinish').show();
							form.down('#btnDispose').show();
						}),getBatchButton(batchWin,sm,'批量修改')*/
						</sec:authorize>
						<sec:authorize url="/serve/serve!del">
						,getDelButton(ds, sm, 'serve/serve!delete','删除')
						</sec:authorize>
						
						<sec:authorize url="/serve/serve!dispose">
						,Ext.create('Ext.Button', {
							itemId : 'gridDispose',
							text : '处理',
							iconCls: 'check',
							tooltip : '服务处理',
							hidden:true,
							disabled : true,
							handler :  function() {
								Ext.MessageBox.confirm('处理确认', '您是否确认处理已选中的这' + sm.getCount()
										+ '条记录，请仔细核对要处理的记录！', function(btn) {
									if (btn == 'yes') {
										editWin(win,winTitle+'——处理', sm);
										form.down('#amender').setReadOnly(true);
										form.down('#amenderId').setValue(userId);
										form.down('#amender').setValue(userName);
										form.down('#result').setDisabled(true);
										form.down('#state').setReadOnly(true);
										form.down('#serviceType').setReadOnly(true);
										form.down('#name').setReadOnly(true);
										form.down('#phone').setReadOnly(true);
										form.down('#eMail').setReadOnly(true);
										form.down('#data').setReadOnly(true);
										form.down('#demandDescription').setReadOnly(true);
										form.down('#btnDispose').show();
									}
								});
							}
						})		
						</sec:authorize>
						<sec:authorize url="/serve/serve!finish">
						,Ext.create('Ext.Button', {
							itemId : 'gridFinish',
							text : '处理',
							iconCls: 'check',
							tooltip : '服务处理完成',
							hidden:true,
							disabled : true,
							handler :  function() {
								Ext.MessageBox.confirm('处理确认', '您是否确认处理已选中的这' + sm.getCount()
										+ '条记录，请仔细核对要处理的记录！', function(btn) {
									if (btn == 'yes') {
										editWin(win,winTitle+'——处理', sm);
										form.down('#amender').setReadOnly(true);
										form.down('#amenderId').setValue(userId);
										form.down('#amender').setValue(userName);
										form.down('#memo').setDisabled(true);
										form.down('#state').setReadOnly(true);
										form.down('#serviceType').setReadOnly(true);
										form.down('#name').setReadOnly(true);
										form.down('#phone').setReadOnly(true);
										form.down('#eMail').setReadOnly(true);
										form.down('#data').setReadOnly(true);
										form.down('#demandDescription').setReadOnly(true);
										form.down('#btnFinish').show();
									}
								});
							}
						})		
						</sec:authorize>
						/*,getComSearchButton(searchWin,'复合查询')*/
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
				 disposeAction = Ext.create('Ext.Action', {
						iconCls: 'check',
						hidden : true,
						text: '处理',
						handler :  function() {
							Ext.MessageBox.confirm('处理确认', '您是否确认处理已选中的这' + sm.getCount()
									+ '条记录，请仔细核对要处理的记录！', function(btn) {
								if (btn == 'yes') {
									editWin(win,winTitle+'——处理', sm);
									form.down('#amender').setReadOnly(true);
									form.down('#amenderId').setValue(userId);
									form.down('#amender').setValue(userName);
									form.down('#result').setDisabled(true);
									form.down('#state').setReadOnly(true);
									form.down('#serviceType').setReadOnly(true);
									form.down('#name').setReadOnly(true);
									form.down('#phone').setReadOnly(true);
									form.down('#eMail').setReadOnly(true);
									form.down('#data').setReadOnly(true);
									form.down('#demandDescription').setReadOnly(true);
									form.down('#btnDispose').show();
								}
							});
						}
					});
				 finishAction = Ext.create('Ext.Action', {
						iconCls: 'check',
						hidden : true,
						text: '处理',
						handler :  function() {
							Ext.MessageBox.confirm('处理确认', '您是否确认处理已选中的这' + sm.getCount()
									+ '条记录，请仔细核对要处理的记录！', function(btn) {
								if (btn == 'yes') {
									editWin(win,winTitle+'——处理', sm);
									form.down('#amender').setReadOnly(true);
									form.down('#amenderId').setValue(userId);
									form.down('#amender').setValue(userName);
									form.down('#memo').setDisabled(true);
									form.down('#state').setReadOnly(true);
									form.down('#serviceType').setReadOnly(true);
									form.down('#name').setReadOnly(true);
									form.down('#phone').setReadOnly(true);
									form.down('#eMail').setReadOnly(true);
									form.down('#data').setReadOnly(true);
									form.down('#demandDescription').setReadOnly(true);
									form.down('#btnFinish').show();
								}
							});
						}
					});
				
				/*var addAction = Ext.create('Ext.Action', {
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
				
			    editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					hidden:true,
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);
						form.down('#state').setReadOnly(true);
						form.down('#serviceType').setReadOnly(true);
						form.down('#name').setReadOnly(true);
						form.down('#phone').setReadOnly(true);
						form.down('#eMail').setReadOnly(true);
						form.down('#data').setReadOnly(true);
						form.down('#demandDescription').setReadOnly(true);
					 }
				});*/
				delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					hidden:true,
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'serve/serve!delete',function(){});
					}
				});
				 var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						
						showAction,'-'
						/*<sec:authorize url="/serve/serve!add">,addAction,copyAddAction</sec:authorize>*/
						//<sec:authorize url="/serve/serve!edit">,editAction</sec:authorize>
						<sec:authorize url="/serve/serve!del">,delAction</sec:authorize>
						<sec:authorize url="/serve/serve!dispose">,disposeAction</sec:authorize>
						<sec:authorize url="/serve/serve!finish">,finishAction</sec:authorize>
					 ]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				//grid.down('#tbar_btn_edit').hide();
				grid.down('#tbar_btn_delete').hide();
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					form.down('#btnFinish').hide();
					form.down('#btnDispose').hide();
					form.down('#memo').setDisabled(false);
					form.down('#result').setDisabled(false);
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
