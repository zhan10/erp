var warehouseTypeArray =[[0,'原材料仓'],[1,'成品仓'],[2,'半成品仓'],[3,'原材料报废仓'],[4,'(半)成品报废仓'],[5,'原材料收货仓'],[6,'原材料在检仓'],[8,'办公用品仓']] ;
var warehouseTypeDs = Ext.create("Ext.data.ArrayStore", {
	fields : ['value','text'],
      data: warehouseTypeArray, 
      autoLoad:true
 });