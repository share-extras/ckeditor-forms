CKEDITOR.editorConfig = function( config )
{
		config.filebrowserImageBrowseUrl = Alfresco.constants.URL_CONTEXT + 'page/ckeditor-listimages?site=' + Alfresco.constants.SITE;
		config.toolbar=[
		        ['Source','Preview'],
		        ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Scayt'],
		        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
		        ['Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
		        '/',
		        ['Styles','Format'],
		        ['Bold','Italic','Strike','-','Subscript','Superscript'],
		        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
		        ['Link','Unlink','Anchor'],
		        ['Maximize','-','About']
		        ];
};
