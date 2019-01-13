<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<html>
  <head>
    <%@ include file="../jspComm/extHeader.jsp"%>
    <script type="text/javascript" src="richText/ueditor.config.js"></script>
	<script type="text/javascript" src="richText/ueditor.all.js"></script>
	<script type="text/javascript" src="richText/lang/zh-cn/zh-cn.js"></script>
	<link type="text/css" rel="stylesheet" href="richText/themes/default/css/ueditor.css">
	<script type="text/javascript" src="ueditor/ueditor.js"></script>
	<script type="text/javascript">
    Ext.onReady(function(){
    	Ext.create('Ext.form.Panel', {
       	 	title: 'Extjs4整合百度编辑器',
        	width: 800,
       	 	bodyPadding: 10,
        	renderTo: Ext.getBody(),
        	items: [{
            	xtype: 'textfield',
            	name: 'title',
            	fieldLabel: '标题',
            	labelWidth: 50,
            	allowBlank: false,
            	width: 700
        	},{
                xtype:'ueditor',
                name:'artcont',
                fieldLabel: '内容',
                labelWidth: 50,
                allowBlank: false,
                width: 800,
                height:280
            }]
    	});
    })
    </script>
  </head>
  <body>
  </body>
</html>
