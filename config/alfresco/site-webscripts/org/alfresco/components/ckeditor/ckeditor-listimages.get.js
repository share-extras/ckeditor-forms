/**
 * Copyright (C) 20010-2011 Alfresco Share Extras project
 *
 * This file is part of the Alfresco Share Extras project.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
// Get the all image files in the doclibrary for this site
//var url = "/slingshot/doclib/images/site/" + page.url.args.site + "/documentLibrary?max=500";
var url,site,doclib;
site=page.url.args.site;
if(site){
	doclib=false;
}else{
	doclib=true;
	site="";
}
var url="/slingshot/search?site="+site+"&term=&tag=&maxResults=251&sort=&query="+encodeURI('{"prop_cm_name":"","prop_mimetype":"image/*","datatype":"cm:content"}');
var json = remote.call(url);
if (json.status == 200)
{
   // Create the model from the response data
   model.images = eval('(' + json + ')');
}
else
{
   model.images = {message: json.message};
}
model.CKEditorFuncNum=page.url.args.CKEditorFuncNum;