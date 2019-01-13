<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var rBrackets = [ ')', '' ];
	var searchColumns = [
		[ 'id', '<s:text name="vTechCardOrders.id"/>'],
		[ 'ordersItemId', '<s:text name="vTechCardOrders.ordersItemId"/>'],
		[ 'techCardId', '<s:text name="vTechCardOrders.techCardId"/>'],
		[ 'allotWeight', '<s:text name="vTechCardOrders.allotWeight"/>'],
		[ 'ordersNum', '<s:text name="vTechCardOrders.ordersNum"/>'],
		[ 'storeLimit', '<s:text name="vTechCardOrders.storeLimit"/>'],
		[ 'ordersId', '<s:text name="vTechCardOrders.ordersId"/>'],
		[ 'serialNum', '<s:text name="vTechCardOrders.serialNum"/>'],
		[ 'spec1', '<s:text name="vTechCardOrders.spec1"/>'],
		[ 'spec2', '<s:text name="vTechCardOrders.spec2"/>'],
		[ 'alloyModel', '<s:text name="vTechCardOrders.alloyModel"/>'],
		[ 'alloyStatus', '<s:text name="vTechCardOrders.alloyStatus"/>'],
		[ 'thicknessTolerance', '<s:text name="vTechCardOrders.thicknessTolerance"/>'],
		[ 'widthTolerance', '<s:text name="vTechCardOrders.widthTolerance"/>'],
		[ 'outerDiameter', '<s:text name="vTechCardOrders.outerDiameter"/>'],
		[ 'innerDiameter', '<s:text name="vTechCardOrders.innerDiameter"/>'],
		[ 'jointNum', '<s:text name="vTechCardOrders.jointNum"/>'],
		[ 'pinholeNum', '<s:text name="vTechCardOrders.pinholeNum"/>'],
		[ 'wettability', '<s:text name="vTechCardOrders.wettability"/>'],
		[ 'tensileStrength', '<s:text name="vTechCardOrders.tensileStrength"/>'],
		[ 'extensibility', '<s:text name="vTechCardOrders.extensibility"/>'],
		[ 'sideSpread', '<s:text name="vTechCardOrders.sideSpread"/>'],
		[ 'wholeSpread', '<s:text name="vTechCardOrders.wholeSpread"/>'],
		[ 'leng', '<s:text name="vTechCardOrders.leng"/>'],
		[ 'lengthTolerance', '<s:text name="vTechCardOrders.lengthTolerance"/>'],
		[ 'appearance', '<s:text name="vTechCardOrders.appearance"/>'],
		[ 'otherStandard', '<s:text name="vTechCardOrders.otherStandard"/>'],
		[ 'specialReq', '<s:text name="vTechCardOrders.specialReq"/>'],
		[ 'purpose', '<s:text name="vTechCardOrders.purpose"/>'],
		[ 'amount', '<s:text name="vTechCardOrders.amount"/>'],
		[ 'packReq', '<s:text name="vTechCardOrders.packReq"/>'],
		[ 'memo', '<s:text name="vTechCardOrders.memo"/>'],
		[ 'produceWeight', '<s:text name="vTechCardOrders.produceWeight"/>']
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
