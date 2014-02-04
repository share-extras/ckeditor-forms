<#if field.name?substring(0,4) == 'prop'>

<#if field.control.params.rows??><#assign rows=field.control.params.rows><#else><#assign rows=8></#if>
<#if field.control.params.columns??><#assign columns=field.control.params.columns><#else><#assign columns=60></#if>
<#if field.control.params.settingsfile??><#assign settingsfile=field.control.params.settingsfile><#else><#assign settingsfile="components/editors/ckeditor/config.js"></#if>

<#if form.capabilities?? && form.capabilities.javascript?? && form.capabilities.javascript == false><#assign jsDisabled=true><#else><#assign jsDisabled=false></#if>

<#-- NOTE: content properties are not shown at all in view mode -->

<#if form.mode != "view">
<div class="form-field" id="${fieldHtmlId}-field">
   <#if jsDisabled == false>
   <script type="text/javascript">//<![CDATA[
   (function()
   {
      new Alfresco.CKEditorContentControl("${fieldHtmlId}").setOptions(
      {
         <#if form.mode == "view" || (field.disabled && !(field.control.params.forceEditable?? && field.control.params.forceEditable == "true"))>disabled: true,</#if>
         currentValue: "${field.value?js_string}",
         mandatory: ${field.mandatory?string},
         formMode: "${form.mode}",
         <#if context.properties.nodeRef??>
         nodeRef: "${context.properties.nodeRef?js_string}",
         <#elseif form.mode == "edit" && args.itemId??>
         nodeRef: "${args.itemId?js_string}",
         <#else>
         nodeRef: "",
         </#if>
         <#if field.control.params.settingsfile??>settingsfile: "${field.control.params.settingsfile}",</#if>
         <#if field.control.params.plainMimeTypes??>plainMimeTypes: "${field.control.params.plainMimeTypes}",</#if>
         <#if field.control.params.richMimeTypes??>richMimeTypes: "${field.control.params.richMimeTypes}",</#if>
         <#if field.control.params.imageMimeTypes??>imageMimeTypes: "${field.control.params.imageMimeTypes}",</#if>
         <#if field.control.params.forceEditor??>forceEditor: ${field.control.params.forceEditor},</#if>
         <#if field.control.params.forceContent??>forceContent: ${field.control.params.forceContent},</#if>
         fieldName: "${field.configName?js_string}",
         <#if field.configName=="cm:content">
         mimeType: "${(context.properties.mimeType!"")?js_string}"
         <#else>
         <#if field.control.params.propertyMimetype??>mimeType: "${field.control.params.propertyMimetype?js_string}"
         <#else>mimeType: "text/html"
         </#if>
         </#if>
         
      }).setMessages(
         ${messages}
      );
   })();
   //]]></script>
   </#if>
   
   <label for="${fieldHtmlId}">${field.label?html}:<#if field.mandatory><span class="mandatory-indicator">${msg("form.required.fields.marker")}</span></#if></label>
   <textarea id="${fieldHtmlId}" name="${field.name}" rows="${rows}" columns="${columns}" tabindex="0"
             <#if field.description??>title="${field.description?html}"</#if>
             <#if field.control.params.styleClass??>class="${field.control.params.styleClass}"</#if>
             <#if field.control.params.style??>style="${field.control.params.style}"</#if>
             <#if field.disabled && !(field.control.params.forceEditable?? && field.control.params.forceEditable == "true")>disabled="true"</#if>><#if field.configName=="cm:content"><#if jsDisabled>${field.content?html}</#if><#else><#if jsDisabled>${field.value?html}</#if></#if></textarea>
</div>
</#if>

</#if>
