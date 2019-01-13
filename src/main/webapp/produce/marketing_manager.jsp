<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<%@ include file="../jspComm/extHeader.jsp"%>
<%@ include file="marketingDefine.jsp"%>
<script type="text/javascript" src="ini/getMarketingStatusDs.js"></script>
<script type="text/javascript" src="ini/getMarketingStatusBitDs.js"></script>
<script type="text/javascript" src="ini/getMarketingTypeDs.js"></script>
<script type="text/javascript" src="ini/getMarketingNameDs.js"></script>
<script type="text/javascript" src="produce/commonality.js"></script>
<script type="text/javascript" src="produce/marketing.js"></script>
<%@ include file="../c/cb_productType.jsp"%>
<%@ include file="../c/cb_memberLevel.jsp"%>
<!-- 引入日期时间控件 -->
<script type="text/javascript" src="dateTime/UX_TimePickerField.js"></script>
<script type="text/javascript" src="dateTime/UX_DateTimePicker.js"></script>
<script type="text/javascript" src="dateTime/UX_DateTimeMenu.js"></script>
<script type="text/javascript" src="dateTime/UX_DateTimeField.js"></script>
<%@ include file="marketingDataExt.jsp"%>
<%@ include file="marketingFormExt.jsp"%>
<%@ include file="marketingSearchExt.jsp"%>
</head>
<body>
	<script language="javascript">
	var sss=[];
	var ss = 0;
	var max_id=1;
	var usersName = '<sec:authentication property="principal.name"/>'
		Ext.QuickTips.init();
		Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.util.*','Ext.state.*' ]);
		Ext.onReady(function() {
			Ext.QuickTips.init();
			Ext.Date.dateformat='Y-m-d';
			win = getWindow(winTitle,winWidth,winHeight,300,200,form);
			win.on('close',function(){
				if(ss!=0){
					for (var i = 1; i <= ss; i++){
						form.remove(form.items.get(form.items.length-1));
					}
					ss=0;
				}
			});
			ds = getDs(mainFields, 'produce/marketing!managerExt', baseSql,order);
			ds.load();
			sm = Ext.create('Ext.selection.CheckboxModel', {
				listeners : {
					selectionchange : function(sm, selections) {
						grid.down('#tbar_btn_delete').setDisabled(selections.length == 0);
						grid.down('#tbar_btn_edit').setDisabled(selections.length != 1);
						grid.down('#gridRegain').setDisabled(selections.length!=1);
						grid.down('#gridQuit').setDisabled(selections.length!=1);
						grid.down('#gridDefer').setDisabled(selections.length!=1);
						grid.down('#gridOpen').setDisabled(selections.length!=1);
						grid.down('#gridInvalid').setDisabled(selections.length!=1);
						grid.down('#gridEffective').setDisabled(selections.length!=1);
					}
				}
			});
			tbar = Ext.create('Ext.toolbar.Toolbar',{
				padding : '5 0 5 10',
				items : [
                    getTextField('priority', 80, '',0, '<s:text name="marketing.priority" />'),
                     '-',
					getTextField('creater', 80, '',0, '<s:text name="marketing.creater" />'),
					 '-',
					Ext.create('Ext.form.DateField',{
	                  name:'openTime',
	                  id : 'openTime',
	                  width : 100,
	                  format : 'Y-m-d',
	                  emptyText:'创建时间'
                      }),	
                    '-',
 					 Ext.create('Ext.form.DateField',{
 	                  name:'startTime',
 	                  itemId : 'startTime',
 	                  width : 100,
 	                  format : 'Y-m-d',
 	                  emptyText:'活动开始时间'
                       }),
                      '-',
   					 Ext.create('Ext.form.DateField',{
   	                  name:'endTime',
   	                  itemId : 'endTime',
   	                  width : 100,
   	                  format : 'Y-m-d',
   	                  emptyText:'活动结束时间'
                         }), 
                      '-',
					Ext.create('Ext.form.field.ComboBox',{
						itemId : 'orderBy',		
						width : 120,
						value : '',
						mode : 'local',
						editable : false,
						store : [
							['','选择排序' ]
							,['creater', '<s:text name="marketing.creater" />']
							,['openTime', '<s:text name="marketing.openTime" />']
							,['startTime', '<s:text name="marketing.startTime" />']
							,['endTime', '<s:text name="marketing.endTime" />']
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
								t_sql = tbar.getComponent('priority').getValue();
								if (t_sql != "")
									sqlStr += " and priority = "+ t_sql;
								t_sql = tbar.getComponent('creater').getValue();
								if (t_sql != "")
									sqlStr += " and creater like '%"+ t_sql+ "%' ";
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('openTime').getValue())),'Y-m-d');
								//alert(t_sql);
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',openTime)=0";
							 	t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('startTime').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',startTime)=0";
								t_sql=Ext.Date.format(Ext.Date.add(new Date(tbar.getComponent('endTime').getValue())),'Y-m-d');
								if (t_sql != ""&&t_sql!="1970-01-01")
									sqlStr+="and datediff(day,'"+t_sql+"',endTime)=0";
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
						<sec:authorize url="/produce/marketing!add">
						,getAddButton(win,winTitle + '——新增','新增',function(){
							form.down('#creater').setValue(usersName);
							form.down('#creater').setReadOnly(true);
							//form.down('#ad').setVisible(true);
							form.down('#status').setReadOnly(true);
							form.down('#openTime').setValue(Ext.Date.format(new Date(),'Y-m-d H:i:s'));
							form.down('#openTime').setReadOnly(true);
							sss=[];
							ss++;
							addItem(ss,form);
							form.down('#aa'+ss+'').setVisible(false);
							form.down('#mm'+ss+'').setVisible(false);
							form.down('#delete'+ss+'').setVisible(false);
						})
						</sec:authorize>
						<sec:authorize url="/produce/marketing!edit">
						,getEditButton(win,winTitle+'——修改', sm,'修改',function(){
							gridType();
							form.down('#status').setReadOnly(true);
							form.down('#openTime').setReadOnly(true);
							partition();
							form.down('#creater').setReadOnly(true);
							ss = sss.length;
							if(ss!=1){
								for(var i=1;i<ss;i++){
									form.down('#delete'+i+'').setVisible(true);
									form.down('#add'+i+'').setVisible(false);
								}
							}else{
								form.down('#delete'+ss+'').setVisible(false);
								form.down('#add'+ss+'').setVisible(true);
							}
							
						})
						</sec:authorize>
						<sec:authorize url="/produce/marketing!del">
						,getDelButton(ds, sm, 'produce/marketing!delete','删除')
						</sec:authorize>
						<sec:authorize url="/produce/marketing!open">
						,Ext.create('Ext.Button', {
							text : '活动开始',
							tooltip : '活动开始',
							hidden : true,
							disabled : true,
							iconCls : 'check',
							itemId : 'gridOpen',
							handler : gridOpen
						})
						</sec:authorize>
						<sec:authorize url="/produce/marketing!invalid">
						,Ext.create('Ext.Button', {
							text : '失效',
							tooltip : '活动失效',
							hidden:true,
							disabled : true,
							iconCls : 'delete',
							itemId : 'gridInvalid',
							handler : gridInvalid
						})
						</sec:authorize>
						<sec:authorize url="/produce/marketing!effective">
						,Ext.create('Ext.Button', {
							text : '有效',
							tooltip : '活动有效',
							hidden:true,
							disabled : true,
							iconCls : 'add',
							itemId : 'gridEffective',
							handler : gridEffective
						})
						</sec:authorize>
						<sec:authorize url="/produce/marketing!quit">
						,Ext.create('Ext.Button', {
							text : '停用',
							tooltip : '活动停用',
							hidden : true,
							disabled : true,
							iconCls : 'delete',
							itemId : 'gridQuit',
							handler : gridQuit
						})
						</sec:authorize>
						<sec:authorize url="/produce/marketing!regain">
						,Ext.create('Ext.Button', {
							text : '恢复',
							tooltip : '活动恢复',
							hidden : true,
							disabled : true,
							iconCls : 'add',
							itemId : 'gridRegain',
							handler : gridRegain
						})
						</sec:authorize>
						<sec:authorize url="/produce/marketing!defer">
						,Ext.create('Ext.Button', {
							text : '延期',
							tooltip : '订单延期',
							hidden : true,
							disabled : true,
							iconCls : 'check',
							itemId : 'gridDefer',
							handler :  function() {
								Ext.MessageBox.confirm('延期确认', '您是否确认延期已选中的这' + sm.getCount()
										+ '条记录，请仔细核对要延期的记录！', function(btn) {
									if (btn == 'yes') {
										showWin(win, '订单延期',sm);
										partition();
										form.down('#btnDefer').show();
										form.down('#endTime').setReadOnly(false);
										ss=sss.length;
										var w=form.items.length-1;
										for(var i=7;i<=w;i++){
										var o=form.items.get(i).itemId;
										form.down('#add'+o+'').setVisible(false);
										form.down('#delete'+o+'').setVisible(false);
										}
									}
								});
							}
						})
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
						if(rec.get('pic')!=''){
							form.down('#fileShow').setValue('<a target="_blank" href="pics/marketing/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
						}else{
							form.down('#fileShow').setValue('');
						}
						gridType();
						partition();
						ss=sss.length;
						for(var i=1;i<=ss;i++){
							form.down('#delete'+i+'').setVisible(false);
							form.down('#add'+i+'').setVisible(false);
						}
					}
				});

				addAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					text: '新增',
					//hidden:true,
					handler: function(widget, event) {
						addWin(win, winTitle + '——新增');
						form.down('#status').setReadOnly(true);
						form.down('#creater').setValue(usersName);
						form.down('#creater').setReadOnly(true);
						form.down('#openTime').setValue(Ext.Date.format(new Date(),'Y-m-d H:i:s'));
						form.down('#openTime').setReadOnly(true);
						gridType();
						sss=[];
						ss++;
						addItem(ss,form);
						form.down('#aa'+ss+'').setVisible(false);
						form.down('#mm'+ss+'').setVisible(false);
						form.down('#delete'+ss+'').setVisible(false);
					}
				});
				editAction = Ext.create('Ext.Action', {
					iconCls: 'edit',
					//hidden:true,
					 text: '修改',
						handler: function(widget, event) { 
						editWin(win,winTitle+'——修改', sm);
						partition();
						form.down('#status').setReadOnly(true);
						form.down('#openTime').setReadOnly(true);
						form.down('#creater').setReadOnly(true);
						gridType();
						ss=sss.length;
						if(ss!=1){
							for(var i=1;i<ss;i++){
								form.down('#delete'+i+'').setVisible(true);
								form.down('#add'+i+'').setVisible(false);
							}
						}else{
							form.down('#delete'+ss+'').setVisible(false);
							form.down('#add'+ss+'').setVisible(true);
						}
					 }
				});
				delAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					//hidden:true,
					 text: '删除',
						handler: function(widget, event) {   
						delFromDB(ds,sm,'produce/marketing!delete',function(){});
					}
				});
				openAction = Ext.create('Ext.Action', {
					iconCls: 'check',
					hidden : true,
					text: '开始',
					handler: gridOpen
				});
				invalidAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					hidden : true,
					text: '失效',
					handler: gridInvalid
				});
				effectiveAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					hidden : true,
					text: '有效',
					handler: gridEffective
				});
				quitAction = Ext.create('Ext.Action', {
					iconCls: 'delete',
					hidden : true,
					text: '停用',
					handler: gridQuit
				});
				regainAction = Ext.create('Ext.Action', {
					iconCls: 'add',
					hidden : true,
					text: '恢复',
					handler: gridRegain
				});
				deferAction = Ext.create('Ext.Action', {
					iconCls: 'check',
					hidden : true,
					text: '延期',
					handler :  function() {
						Ext.MessageBox.confirm('延期确认', '您是否确认延期已选中的这' + sm.getCount()
								+ '条记录，请仔细核对要结算的记录！', function(btn) {
							if (btn == 'yes') {
								showWin(win, '订单延期',sm);
								partition();
								form.down('#btnDefer').show();
								form.down('#endTime').setReadOnly(false);
								ss=sss.length;
								var w=form.items.length-1;
								for(var i=7;i<=w;i++){
								var o=form.items.get(i).itemId;
								form.down('#add'+o+'').setVisible(false);
								form.down('#delete'+o+'').setVisible(false);
								}
							}
						});
					}
				});
				var contextMenu = Ext.create('Ext.menu.Menu', {
					 items: [
						showAction,'-'
						<sec:authorize url="/produce/marketing!add">,addAction</sec:authorize>
						<sec:authorize url="/produce/marketing!edit">,editAction</sec:authorize>
						<sec:authorize url="/produce/marketing!open">,openAction</sec:authorize>
						<sec:authorize url="/produce/marketing!quit">,quitAction</sec:authorize>
						<sec:authorize url="/produce/marketing!regain">,regainAction</sec:authorize>
						<sec:authorize url="/produce/marketing!defer">,deferAction</sec:authorize>
						<sec:authorize url="/produce/marketing!del">,delAction</sec:authorize>
						<sec:authorize url="/produce/marketing!invalid">,invalidAction</sec:authorize>
						<sec:authorize url="/produce/marketing!effective">,effectiveAction</sec:authorize>
						]
				});
				grid = getGrid('grid',gridTitle,ds,mainColumns, sm, tbar, bbar);
				grid.on('itemdblclick', function(grid,rec) {
					showWinByRec(win,winTitle+'——查看',rec);
					var rec=(sm.getSelection())[0];
					if(rec.get('pic')!=''){
						form.down('#fileShow').setValue('<a target="_blank" href="pics/marketing/'+rec.get('pic')+'">'+rec.get('pic')+'</a>');//.setVisible(true);
					}else{
						form.down('#fileShow').setValue('');
					}
					partition();
					gridType();
					ss=sss.length;
					for(var i=1;i<=ss;i++){
						form.down('#delete'+i+'').setVisible(false);
						form.down('#add'+i+'').setVisible(false);
					}
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
		//分割方法
		function handleStr(str){
			var reslut=new Array();
			var arry=str.replace(/\(|\)/g,"").split(/&&/g);//["smk>=skou", "skhie<=skjie"]
			if(arry.length>0){
				for (var i=0;i<arry.length;i++) {
					if(arry[i].indexOf(">")>-1){
						if((arry[i].indexOf(">")+1)==arry[i].indexOf("=")){
							reslut.push(arry[i].replace(">=",",>=,").split(","));
						}else{
							reslut.push(arry[i].replace(">",",>,").split(","));
						}
					}else if(arry[i].indexOf("<")>-1){
						if((arry[i].indexOf("<")+1)==arry[i].indexOf("=")){
							reslut.push(arry[i].replace("<=",",<=,").split(","));
						}else{
							reslut.push(arry[i].replace("<",",<,").split(","));
						}
					}else if(arry[i].indexOf("=")>-1){
						reslut.push(arry[i].replace("=",",=,").split(","));
					}
				}
			}
			return reslut;
		};
		//分割之后的显示
		function partition(){
			conditionSetting=sm.getSelection()[0].data['conditionSetting'];
		    var mn=/^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/;
		    var price=/^\d{n}$/;
			sss=handleStr(conditionSetting);
			for(var i=0;i<sss.length;i++){
				    addItem(i+1,form);
					form.down('#dd'+(i+1)).setValue(sss[i][0]);
					form.down('#nn'+(i+1)).setValue(sss[i][1]);
				if(mn.test(sss[i][2])){
					form.down('#mm'+(i+1)).hide();
					form.down('#total'+(i+1)).hide();
					form.down('#aa'+(i+1)).setValue(sss[i][2]);
				}else if(price.test(sss[i][2])){
					form.down('#mm'+(i+1)).hide();
					form.down('#aa'+(i+1)).hide();
					form.down('#total'+(i+1)).setValue(sss[i][2]);
				}else {
					form.down('#aa'+(i+1)).hide();
					form.down('#total'+(i+1)).hide();
					form.down('#mm'+(i+1)).setValue(sss[i][2]);
					}
			};
		};
		function gridType(){
			var type = form.down('#type').getValue();
			if(type==1){
				form.down('#percent').show();
				form.down('#component').hide();
			}else{
				form.down('#percent').hide();
				form.down('#component').show();
			}
		};
	</script>
</body>
</html>

