<!---
*
* Copyright (C) 2005-2008 Razuna
*
* This file is part of Razuna - Enterprise Digital Asset Management.
*
* Razuna is free software: you can redistribute it and/or modify
* it under the terms of the GNU Affero Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* Razuna is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU Affero Public License for more details.
*
* You should have received a copy of the GNU Affero Public License
* along with Razuna. If not, see <http://www.gnu.org/licenses/>.
*
* You may restribute this Program with a special exception to the terms
* and conditions of version 3.0 of the AGPL as described in Razuna's
* FLOSS exception. You should have received a copy of the FLOSS exception
* along with Razuna. If not, see <http://www.razuna.com/licenses/>.
*
--->
<cfparam name="attributes.file_id" default="0">
<head>
<cfoutput>
<link rel="stylesheet" href="#dynpath#/global/host/dam/views/layouts/main.css" type="text/css" />
<script type="text/javascript" src="#dynpath#/global/js/jquery-1.6.4.min.js"></script>
<script type="text/javascript" src="#dynpath#/global/js/upload/swfupload.js"></script>
<script type="text/javascript" src="#dynpath#/global/js/upload/jquery-asyncUpload-0.1.js"></script>
<script>
    $(function() {
        $("##yourID").makeAsyncUploader({
        	flash_url: '#dynpath#/global/js/upload/swfupload.swf',
            upload_url: "#myself#c.asset_upload&tempid=#attributes.tempid#&thepath=#urlencodedformat(thisPath)#&thefieldname=filedata&folder_id=#attributes.folder_id#&cfid=#cfid#&cftoken=#cftoken#&file_id=#attributes.file_id#",
            button_image_url: '#dynpath#/global/js/upload/blankButton.png',
            file_size_limit: "2000 MB",
            file_types: "*.*",
            file_upload_limit: 100,
			file_queue_limit: 0,
			debug: false
        });
    });  
</script>
<style type="text/css">
<!--- <cfif attributes.file_id NEQ 0>body{background-color: ##DFE8F6;}</cfif> --->
DIV.ProgressBar { width: 100px; padding: 0; border: 1px solid black; margin-right: 1em; height:.75em; margin-left:1em; display:-moz-inline-stack; display:inline-block; zoom:1; *display:inline; }
DIV.ProgressBar DIV { background-color: Green; font-size: 1pt; height:100%; float:left; }
SPAN.asyncUploader OBJECT { position: relative; top: 5px; left: 10px; z-index: 7000;}
</style>
</head>
<body>
<form action="#self#" name="upme" method="post" enctype="multipart/form-data">
<!--- If this is a windows firefox browser we can not show the flash within the extjs window --->
<!---
<cfif structkeyexists(attributes,"extjs") AND cgi.http_user_agent CONTAINS "windows" AND cgi.http_user_agent CONTAINS "firefox">
<input type="hidden" name="fa" value="c.asset_upload">
<input type="hidden" name="tempid" value="#attributes.tempid#">
<input type="hidden" name="thepath" value="#thisPath#">
<input type="hidden" name="thefieldname" value="filedata">
<input type="hidden" name="folder_id" value="#attributes.folder_id#">
<input type="hidden" name="cfid" value="#cfid#">
<input type="hidden" name="cftoken" value="#cftoken#">
<input type="hidden" name="file_id" value="#attributes.file_id#">
<input type="hidden" name="extjs" value="T">
<input type="file" id="filedata" name="filedata"> <input type="submit" name="submit" value="Upload" class="button">
<cfif structkeyexists(form,"submit")>File is uploaded!</cfif>
<cfelse>
--->
<input type="file" id="yourID" name="yourID" />
<!--- </cfif> --->
</form>
</cfoutput>
</body>
</html>
