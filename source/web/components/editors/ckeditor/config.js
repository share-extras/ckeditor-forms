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


 CKEDITOR.on( 'instanceReady', function( ev )
  {
    var editor = ev.editor,
    dataProcessor = editor.dataProcessor,
    htmlFilter = dataProcessor && dataProcessor.htmlFilter;

    // Output properties as attributes, not styles.
    htmlFilter.addRules(
    {
      elements :
      {
        $ : function( element )
        {
          // Output dimensions of images as width and height
          if ( element.name == 'img' )
          {
            var style = element.attributes.style;

            if ( style )
            {
              // Get the width from the style.
              var match = /(?:^|\s)width\s*:\s*(\d+)px/i.exec( style ),
                width = match && match[1];

              // Get the height from the style.
              match = /(?:^|\s)height\s*:\s*(\d+)px/i.exec( style );
              var height = match && match[1];

              if ( width )
              {
                element.attributes.style = element.attributes.style.replace( /(?:^|\s)width\s*:\s*(\d+)px;?/i , '' );
                element.attributes.width = width;
              }

              if ( height )
              {
                element.attributes.style = element.attributes.style.replace( /(?:^|\s)height\s*:\s*(\d+)px;?/i , '' );
                element.attributes.height = height;
              }
            }
          }

          if ( !element.attributes.style )
            delete element.attributes.style;

          return element;
        }
      }
    });
  });

};
