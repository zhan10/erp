var dsUrl='';
var dsBaseSql='';
var ds;
var grid;
var gridTitle='';
var form;
var bbar;
// 定义win，宽度、高度、标题
var win;
var winWidth = 800;
var winHeight = 500;
var winTitle = '';
//设置每页大小
var defaultPageSize=20;
//设置缺省查询条件，排序条件
var baseSql='';
var order='';
var sm;
// 设置搜索窗口大小
var searchWinWidth = 500;
var searchWinHeight = 440;
var searchLine = 10;// 搜索条件数
var searchForm;
var searchWin;
var batchWin;//批量修改
var batchForm;
var fileTypes = "jpg,png,gif,jpeg,xls,xlsx"; 