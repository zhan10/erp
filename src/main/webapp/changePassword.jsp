<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<%@ include file="./jspComm/extHeader.jsp"%>
</head>
<body>
	<script>
	Ext
		.onReady(function() {
		    Ext.QuickTips.init();
		    form = Ext
			    .widget(
				    'form',
				    {
					itemId : 'form',
					autoScroll : true,
					overflowX : 'scroll',
					overflowY : 'scroll',
					frame : true,
					layout : {
					    type : 'vbox',
					    align : 'stretch'
					},
					border : false,
					bodyPadding : 10,
					defaultType : 'textfield',
					fieldDefaults : {
					    labelAlign : 'right',
					    labelWidth : 100
					},
					defaults : {
					    margins : '0 0 10 0'
					},
					items : [ {
					    itemId : 'id',
					    name : 'id',
					    hidden : true
					}, {
					    xtype : 'textfield',
					    allowBlank : false,
					    name : 'oldPassword',
					    inputType : 'password',
					    fieldLabel : '现在的密码'

					}, {
					    xtype : 'textfield',
					    allowBlank : false,
					    name : 'newPassword',
					    itemId : 'newPassword',
					    inputType : 'password',
					    fieldLabel : '设置新的密码'

					}, {
					    xtype : 'textfield',
					    allowBlank : false,
					    name : 'confirmPassword',
					    itemId : 'confirmPassword',
					    inputType : 'password',
					    fieldLabel : '重复新的密码'

					} ],
					buttons : [
						{
						    text : '修改',
						    itemId : 'btnSave',
						    handler : function() {
							var saveForm = this
								.up('form');
							if (saveForm.getForm()
								.isValid()) {
							    if (saveForm
								    .down(
									    '#newPassword')
								    .getValue() != saveForm
								    .down(
									    '#confirmPassword')
								    .getValue()) {
								Ext.MessageBox
									.alert(
										'错误',
										'两次输入的新密码不同，请重新输入！');
								saveForm
									.down(
										'#newPassword')
									.setValue(
										'');
								saveForm
									.down(
										'#confirmPassword')
									.setValue(
										'');
								return;
							    }
							   Ext.Ajax
								    .request({
									url : 'system/users!chgPwd',
									timeout : 60000,
									params : {
									    extJson : '{password:'+saveForm
								    .down(
									    '#newPassword')
								    .getValue()+'}'
									},
									method : 'post',
									success : function(
										response) {
									    var responseText = response.responseText;
									    if (responseText
										    .indexOf('topit_ext_id!') != 0) {
										Ext.Msg
											.alert(
												'错误',
												(response.responseText));
									    } else {
										Ext.Msg
											.alert(
												'恭喜',
												"密码修改成功!",
												function() {
												   //关闭父窗口
													window.close();
												});
									    }
									},

									failure : function(
										response) {
									    Ext.Msg
										    .alert(
											    '错误',
											    (response.responseText));
									}
								    });
							}
						    }
						}, {
						    text : '关闭',
						    itemId : 'btnClose',
						    handler : function() {
							window.close();
						    }
						} ]
				    });
		    batchForm = Ext
			    .widget(
				    'form',
				    {
					itemId : 'batchForm',
					autoScroll : true,
					frame : true,
					border : false,
					layout : {
					    type : 'vbox',
					    align : 'stretch'
					},
					bodyPadding : 10,
					defaultType : 'textfield',
					fieldDefaults : {
					    labelAlign : 'right',
					    labelWidth : 100
					},
					defaults : {
					    margins : '0 0 10 0'
					},
					items : [
						{
						    flex : 1,
						    name : 'name',
						    itemId : 'selectName',
						    fieldLabel : '修改项目',
						    allowBlank : false,
						    xtype : 'combo',
						    forceSelection : true,
						    store : [
							    [ 'name',
								    '<s:text name="city.name"/>' ],
							    [ 'intro',
								    '<s:text name="city.intro"/>' ] ],
						    listeners : {
							select : function() {
							    var nodes = this
								    .up('form')
								    .query(
									    '[name=value]');
							    for (i = 0; i < nodes.length; i++) {
								if (nodes[i]
									.getItemId() == (this.value)) {
								    nodes[i]
									    .setDisabled(false);
								    nodes[i]
									    .setVisible(true);
								} else {
								    nodes[i]
									    .setDisabled(true);
								    nodes[i]
									    .setVisible(false);
								}
							    }
							}
						    }
						}, {
						    flex : 1,
						    name : 'value',
						    fieldLabel : '设置新值',
						    itemId : 'name'
						}, {
						    flex : 1,
						    name : 'value',
						    fieldLabel : '设置新值',
						    itemId : 'intro',
						    hidden : true
						} ],
					buttons : [
						{
						    text : '更新',
						    handler : function() {
							var saveForm = this
								.up('form');
							if (saveForm.getForm()
								.isValid()) {
							    updateFieldsToDB(
								    saveForm,
								    sm,
								    'system/city!updateFields',
								    function() {
								    });
							}
						    }
						},
						{
						    text : '取消',
						    handler : function() {
							this.up('window')
								.hide();
						    }
						} ]
				    });

		    var viewport = Ext.create('Ext.Viewport', {
			layout : 'fit',
			items : form
		    });
		});
    </script>
</body>
</html>