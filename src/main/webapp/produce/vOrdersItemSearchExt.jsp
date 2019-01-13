<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var rBrackets = [ ')', '' ];
	var searchColumns = [
		[ 'id', '<s:text name="vOrdersItem.id"/>'],
		[ 'customId', '<s:text name="vOrdersItem.customId"/>'],
		[ 'salesId', '<s:text name="vOrdersItem.salesId"/>'],
		[ 'ordersNum', '<s:text name="vOrdersItem.ordersNum"/>'],
		[ 'ordersId', '<s:text name="vOrdersItem.ordersId"/>'],
		[ 'salesName', '<s:text name="vOrdersItem.salesName"/>'],
		[ 'customCode', '<s:text name="vOrdersItem.customCode"/>'],
		[ 'customName', '<s:text name="vOrdersItem.customName"/>'],
		[ 'spec1', '<s:text name="vOrdersItem.spec1"/>'],
		[ 'spec2', '<s:text name="vOrdersItem.spec2"/>'],
		[ 'purpose', '<s:text name="vOrdersItem.purpose"/>'],
		[ 'storeLimit', '<s:text name="vOrdersItem.storeLimit"/>'],
		[ 'amount', '<s:text name="vOrdersItem.amount"/>'],
		[ 'orderWeight', '<s:text name="vOrdersItem.orderWeight"/>'],
		[ 'produceWeight', '<s:text name="vOrdersItem.produceWeight"/>'],
		[ 'alloyModel', '<s:text name="vOrdersItem.alloyModel"/>'],
		[ 'alloyStatus', '<s:text name="vOrdersItem.alloyStatus"/>'],
		[ 'leng', '<s:text name="vOrdersItem.leng"/>'],
		[ 'thicknessTolerance', '<s:text name="vOrdersItem.thicknessTolerance"/>'],
		[ 'widthTolerance', '<s:text name="vOrdersItem.widthTolerance"/>'],
		[ 'lengthTolerance', '<s:text name="vOrdersItem.lengthTolerance"/>'],
		[ 'innerDiameter', '<s:text name="vOrdersItem.innerDiameter"/>'],
		[ 'outerDiameter', '<s:text name="vOrdersItem.outerDiameter"/>'],
		[ 'jointNum', '<s:text name="vOrdersItem.jointNum"/>'],
		[ 'sideSpread', '<s:text name="vOrdersItem.sideSpread"/>'],
		[ 'tensileStrength', '<s:text name="vOrdersItem.tensileStrength"/>'],
		[ 'pinholeNum', '<s:text name="vOrdersItem.pinholeNum"/>'],
		[ 'wettability', '<s:text name="vOrdersItem.wettability"/>'],
		[ 'wholeSpread', '<s:text name="vOrdersItem.wholeSpread"/>'],
		[ 'extensibility', '<s:text name="vOrdersItem.extensibility"/>'],
		[ 'appearance', '<s:text name="vOrdersItem.appearance"/>'],
		[ 'otherStandard', '<s:text name="vOrdersItem.otherStandard"/>'],
		[ 'specialReq', '<s:text name="vOrdersItem.specialReq"/>'],
		[ 'packReq', '<s:text name="vOrdersItem.packReq"/>'],
		[ 'memo', '<s:text name="vOrdersItem.memo"/>']
	];
	var searchOperates = [ '=', '>', '>=', '<', '<=', '!=', 'like', 'not like','in', 'not in' ];
	var lBrs = new Array(); // 左括号
	var rBrs = new Array(); // 右括号
	var andOrs = new Array();
	var fieldName = new Array();
	var operation = new Array();
	var orderByField = new Array();
	var orderType = new Array();
	var selectNameValue = new Array();
	searchForm = Ext.widget('form');
	for (i = 0; i < searchLine; i++) {
		lBrs[i] = Ext.create('Ext.form.field.ComboBox', {
			store : [ [ '', '　' ], [ '(', '(' ] ],
			width : 30,
			value : '',
			editable : false,
			margin : '0 5 0 0'
		});
		rBrs[i] = Ext.create('Ext.form.field.ComboBox', {
			store : [ [ '', '　' ], [ ')', ')' ] ],
			width : 30,
			value : '',
			editable : false,
			margin : '0 5 0 0'
		});
		fieldName[i] = Ext.create('Ext.form.field.ComboBox', {
			store : searchColumns,
			flex : 1,
			emptyText : '选择字段名',
			editable : false,
			margin : '0 5 0 0'
		});
		operation[i] = Ext.create('Ext.form.field.ComboBox', {
			store : searchOperates,
			flex : 1,
			emptyText : '选择操作符',
			editable : false,
			margin : '0 5 0 0'
		});
		selectNameValue[i] = Ext.create('Ext.form.field.Text', {
			flex : 1,
			margin : '0 5 0 0'
		});
		andOrs[i] = Ext.create('Ext.form.field.ComboBox', {
			store : [ 'and', 'or ' ], //or多加一空格以使长度与and一致便于截取字符串
			value : 'and',
			width : 50,
			editable : false
		});
		searchForm.add({
			xtype : 'container',
			layout : 'hbox',
			margin : '5 5 5 5',
			items : [ lBrs[i], fieldName[i], operation[i], selectNameValue[i],rBrs[i], andOrs[i] ]
		});
	}
	// 排序
	for (i = 0; i < 4; i++) {
		orderByField[i] = Ext.create('Ext.form.field.ComboBox', {
			store : searchColumns,
			flex : 1,
			emptyText : '选择排序字段',
			editable : false,
			margin : '0 5 0 0'
		});
		orderType[i] = Ext.create('Ext.form.field.ComboBox', {
			store : [ [ 'asc', '顺序' ], [ 'desc', '倒序' ] ],
			width : 50,
			margin : '0 5 0 0',
			value : 'asc',
			editable : false
		});
	}
	searchForm.add({
		xtype : 'fieldset',
		title : '排序',
		margin : '5 5 5 5',
		items : [
			{
				xtype : 'container',
				layout : 'hbox',
				margin : '5 5 5 5',
				items : [ orderByField[0], orderType[0], orderByField[1],orderType[1]]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				margin : '5 5 5 5',
				items : [ orderByField[2], orderType[2], orderByField[3],orderType[3] ]
			} ]
		});
	searchWin = new Ext.Window(
		{
			title : '高级查询',
			layout : 'fit',
			width : searchWinWidth,
			closeAction : 'hide',
			modal : true,
			height : searchWinHeight,
			buttonAlign : 'center',
			plain : true,
			items : searchForm,
			buttons : [
			{
				text : '查询',
				handler : function() {
					var sqlStr = '';
					for ( var i = 0; i < searchLine; i++) {
						if (fieldName[i].value != ''
							&& operation[i].value != ''
								&& selectNameValue[i].getValue() != '') {
							sqlStr += lBrs[i].value
							+ fieldName[i].value + ' '
								+ operation[i].value + ' \''
								+ selectNameValue[i].getValue()
								+ '\'' + rBrs[i].value + ' '
								+ andOrs[i].value + ' ';
						}
					}
					if (sqlStr.length > 0)
						sqlStr = ' and ('
							+ sqlStr.substr(0,
							sqlStr.length - 4) + ')';// 去掉最后一个and、or并在最前面加上and
						var orderBy = '';
						for ( var i = 0; i < 4; i++) {
							if (orderByField[i].value != null && orderByField[i].value != ''	
								&& orderType.value != '') {
								if (orderBy == '')
									orderBy = orderByField[i].value
									+ ' ' + orderType[i].value;
								else
									orderBy += ','
									+ orderByField[i].value
										+ ' ' + orderType[i].value;
							}
							}
							if (orderBy != '')
							order =' order by '+ orderBy;
							Ext.apply(ds.proxy.extraParams, { // 更新ds
								whereSql : sqlStr,
								order : order
								});
							ds.loadPage(1);
							searchWin.hide();
							}
					}, {
					text : '重置',
					handler : function() {
						searchForm.form.reset();
						}
					}, {
						text : '关闭',
							handler : function() {
							searchWin.hide();
						}
					} ]
				});
</script>
