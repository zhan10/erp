 Ext.define('WMC.common.view.ExtKindEditor', {
	 extend: 'Ext.form.field.TextArea',
     alias: 'widget.extkindeditor',//xtype名称
     initComponent: function () {
         this.html = "<textarea id='" + this.getId() + "-input' name='" + this.name + "'></textarea>";
         this.callParent(arguments);
         this.on("boxready", function (t) {
             this.inputEL = Ext.get(this.getId() + "-input");
             this.editor = KindEditor.create('textarea[name="' + this.name + '"]', {
                height: t.getHeight()-18,//有底边高度，需要减去
                width: t.getWidth() - t.getLabelWidth(),//宽度需要减去label的宽度
                basePath: './kindeditor/',
                uploadJson: './kindeditor/jsp/upload_json2.jsp',//路径自己改一下
                fileManagerJson: './kindeditor/jsp/file_manager_json.jsp',//路径自己改一下
                resizeType: 0,
                wellFormatMode: true,
                newlineTag: 'br',
                allowFileManager: true,
                allowPreviewEmoticons: true,
                allowImageUpload: true,
                items: [
                    'source', '|', 'undo', 'redo', '|', 'justifyleft', 'justifycenter', 'justifyright',
                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', '|',
                    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'bold',
                   'italic', 'underline', 'lineheight', '|', 'image', /*'multiimage',*/
                   'table', 'emoticons',
                   'link', 'unlink', 'fullscreen'
                ]
            });
        });
        this.on("resize", function (t, w, h) {
            this.editor.resize(w - t.getLabelWidth(), h-18);
        });
    },
    setValue: function (value) {
        if (this.editor) {
            this.editor.html(value);
        }
    },
    reset: function () {
    	 if (this.editor) {
    		 this.editor.html('');
        }
    },
    setRawValue: function (value) {
       if (this.editor) {
           this.editor.html(value);
       }
    },
    getValue: function () {
    	if (this.editor) {
    		//this.editor.html('<h1>61333</h1>');
             return this.editor.html();
         } else {
             return ''
         }
     },
     getRawValue: function () {
         if (this.editor) {
             return this.editor.html();
         } else {
             return ''
         }
     }
 });