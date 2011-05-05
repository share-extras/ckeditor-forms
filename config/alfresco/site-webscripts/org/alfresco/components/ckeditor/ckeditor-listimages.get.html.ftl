<#if CKEditorFuncNum??>
<div class="dashlet">
   <div class="title">${msg("header.title")}</div>
   <div id="${args.htmlid}-list" class="body">
<#if images.message?exists>
      <div class="detail-list-item first-item last-item">
         <div class="error">${images.message}</div>
      </div>
<#elseif images.items?size == 0>
      <div class="detail-list-item first-item last-item">
         <span>${msg("label.noitems")}</span>
      </div>
<#else>
   <#assign detailsmsg = msg("label.viewdetails")>
   <#list images.items as image>
      <#assign nodeRefUrl=image.nodeRef?replace('://','/')>
      <div class="images">
         <div class="item">
            <div class="thumbnail">
               <a href="${url.context}/proxy/alfresco/api/node/content/${nodeRefUrl}/${image.name?url}" rel="lightbox" title="${image.title?html} - ${msg("text.modified-by", image.modifier)} ${xmldate(image.modifiedOn)?string(msg("date-format.defaultFTL"))}"><img src="${url.context}/proxy/alfresco/api/node/${nodeRefUrl}/content/thumbnails/doclib?c=force"/></a>
            </div>
            <div class="details">
            <a onclick="window.opener.CKEDITOR.tools.callFunction( ${CKEditorFuncNum}, '${url.context}/proxy/alfresco/api/node/content/${nodeRefUrl}/${image.name?url}');window.close();" href="#">${image.name}</a>
            </div>
         </div>
      </div>
   </#list>
</#if>
   </div>
</div>
<#else>
${msg("notavailable")}
</#if>