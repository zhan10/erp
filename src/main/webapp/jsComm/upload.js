function checkFile(url){
	if(url&&url.length>0){
	var resulturl="smaci/accplan/upload/"+url;
	window.open(
				baseHref + resulturl,
				"附件查看",
				"height=300,width=700,status=yes,toolbar=no,scrollbars=no,resizable=no,top=100,left=200,menubar=no,location=no");	
	}else{
		Ext.Msg.alert('错误', "附件不存在");	
	}
	
}
function saveFile(paramForm, fieldName,fileTypes,url, paramGrid) {
	//判断上传格式
	var fileName=paramForm.form.findField(fieldName).getValue();	
	if(fileName.length>0&&fileTypes.length>0){
		var type=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
		type=type.toLocaleLowerCase();
			if(fileType.indexOf(fileTypes)<0){
				Ext.Msg.alert('提示',"上传附件格式有误，上传的格式包括："+fileTypes);
				return;
			}
	}
	//主表json字符串
	var saveFormJson = Ext.JSON.encode(paramForm.getForm().getValues());	
	Ext.Msg.wait("请等候", "保存数据", "保存数据进行中...");
	paramForm.form.submit({
		url : url,
		method : 'post',
		params : {
			saveFormParam : saveFormJson
		},
		success : function(form,action) {
			
			//alert(unescape(action.result.msg));	
			Ext.Msg.alert('恭喜', "保存成功!", function() {
				func(action.result.msg);
					
				});
		},
		failure : function(form,action) {
			Ext.Msg.alert('错误', "保存失败");
		}
	});

}
//文件上传控件的值无法通过form.reset()清空
function clearFileUpload(id){
	if(document.getElementById(id)){
    // get the file upload element
    fileField     = document.getElementById(id);
    // get the file upload parent element
    parentNod     = fileField.parentNode;
    // create new element
    tmpForm        = document.createElement("form");
    parentNod.replaceChild(tmpForm,fileField);
    tmpForm.appendChild(fileField);
    tmpForm.reset();
    parentNod.replaceChild(fileField,tmpForm);}
}




