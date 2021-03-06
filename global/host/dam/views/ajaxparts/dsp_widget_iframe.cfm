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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">
<head>
<title>Razuna Enterprise Digital Asset Management</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<cfoutput>
<!--- Control the cache --->
<cfset cacheTimeSeconds = 60*60*24>
<cfheader name="Expires" value="#GetHttpTimeString(DateAdd('s', cacheTimeSeconds, Now()))#">
<cfheader name="CACHE-CONTROL" value="max-age=#cacheTimeSeconds#">
<cfheader name="PRAGMA" value="public">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script language="JavaScript" type="text/javascript">var dynpath = '#dynpath#';</script>
<cfset thestorage = "#cgi.context_path#/assets/#session.hostid#/">
<!--- According to widget style we decide here what to load --->
<cfif qry_widget.widget_style EQ "d">
	<cfif application.razuna.isp>
		<!--- CSS --->
		<link rel="stylesheet" type="text/css" href="//d3jcwo7gahoav9.cloudfront.net/razuna/css/main.css" />
		<link rel="stylesheet" type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/smoothness/jquery-ui.css" />
		<!--- <link rel="stylesheet" type="text/css" href="//d3jcwo7gahoav9.cloudfront.net/razuna/js/jquery-ui-1.8.16.custom/css/smoothness/jquery-ui-1.8.16.custom.css" /> --->
		<script type="text/javascript" src="//d3jcwo7gahoav9.cloudfront.net/razuna/js/widget/overlay.css"></script>
		<!--- JS --->
		<!---
		<script src="//d3jcwo7gahoav9.cloudfront.net/razuna/js/jquery-1.6.4.min.js" type="text/javascript"></script>
		<script src="//d3jcwo7gahoav9.cloudfront.net/razuna/js/jquery-ui-1.8.16.custom/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
		--->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="//d3jcwo7gahoav9.cloudfront.net/razuna/js/flowplayer-3.2.6.min.js"></script>
		<script type="text/javascript" src="//d3jcwo7gahoav9.cloudfront.net/razuna/js/AC_QuickTime.js"></script>
		<script type="text/javascript" src="//d3jcwo7gahoav9.cloudfront.net/razuna/js/global.js"></script>
	<cfelse>
		<!--- CSS --->
		<link rel="stylesheet" type="text/css" href="#dynpath#/global/host/dam/views/layouts/main.css" />
		<link rel="stylesheet" type="text/css" href="#dynpath#/global/js/jquery-ui-1.8.16.custom/css/smoothness/jquery-ui-1.8.16.custom.css" />
		<link rel="stylesheet" type="text/css" href="#dynpath#/global/js/widget/overlay.css"/>
		<!--- JS --->
		<script type="text/javascript" src="#dynpath#/global/js/jquery-1.6.4.min.js"></script>
		<script type="text/javascript" src="#dynpath#/global/js/jquery-ui-1.8.16.custom/js/jquery-ui-1.8.16.custom.min.js"></script>
		<script type="text/javascript" src="#dynpath#/global/js/AC_QuickTime.js"></script>
		<script type="text/javascript" src="#dynpath#/global/videoplayer/js/flowplayer-3.2.6.min.js"></script>
		<script type="text/javascript" src="#dynpath#/global/host/dam/js/global.js"></script>
	</cfif>
	<!--[if lt IE 7]>
	<style> 
	div.apple_overlay {
		background-image:url(http://static.flowplayer.org/tools/img/overlay/overlay_IE6.gif);
		color:##fff;
	}
	/* default close button positioned on upper right corner */
	div.apple_overlay div.close {
		background-image:url(http://static.flowplayer.org/tools/img/overlay/overlay_close_IE6.gif);
	}	
	</style>
	<![endif]-->
	</head>
	<body>
	<div id="rightside">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="grid">
		<tr>
			<th colspan="5">
				<div style="float:left;">
					<cfif qry_widget.widget_uploading EQ "T"><a href="##" onclick="window.open('#myself#c.asset_add_single&folder_id=#session.fid#&_w=t','up#session.fid#','left=20,top=20,width=500,height=500,toolbar=0,resizable=1,location=0,status=0,menubar=0,history=0');">#defaultsObj.trans("add_file")#</a> | </cfif>
					#qry.qry_filecount.thetotal# #defaultsObj.trans("share_content_count")#
					<!--- BreadCrumb --->
					<cfif structkeyexists(url,"folder_id_r")>
						| <cfloop list="#qry_breadcrumb#" delimiters=";" index="i"> / <a href="#myself#c.w_content&wid=#attributes.wid#&folder_id=#ListGetAt(i,2,"|")#&folder_id_r=#ListGetAt(i,3,"|")#&fid=#attributes.fid#">#ListGetAt(i,1,"|")#</a> </cfloop>
					</cfif>
					<div style="padding-left:50px;float:right;">
						<cfif session.offset GTE 1>
							<!--- For Back --->
							<cfset newoffset = session.offset - 1>
							<a href="##" onclick="loadcontent('rightside','#myself#c.w_content&folder_id=#attributes.folder_id#&fid=#attributes.fid#<cfif structkeyexists(attributes,"folder_id_r")>&folder_id_r=#attributes.folder_id_r#</cfif>&offset=#newoffset#');"><<< #defaultsObj.trans("back")#</a> |
						</cfif>
						<cfset showoffset = session.offset * session.rowmaxpage>
						<cfset shownextrecord = (session.offset + 1) * session.rowmaxpage>
						<cfif qry.qry_filecount.thetotal GT session.rowmaxpage>#showoffset# - #shownextrecord#</cfif>
						<cfif qry.qry_filecount.thetotal GT session.rowmaxpage AND NOT shownextrecord GTE qry.qry_filecount.thetotal> | 
							<!--- For Next --->
							<cfset newoffset = session.offset + 1>
							<a href="##" onclick="loadcontent('rightside','#myself#c.w_content&wid=#attributes.wid#&folder_id=#attributes.folder_id#&fid=#attributes.fid#<cfif structkeyexists(attributes,"folder_id_r")>&folder_id_r=#attributes.folder_id_r#</cfif>&offset=#newoffset#');">#defaultsObj.trans("next")# >>></a>
						</cfif>
					</div>
					<!--- Pages --->
					<div style="float:right;">
						<cfif qry.qry_filecount.thetotal GT session.rowmaxpage>
							<span style="padding-left:30px;">
							<cfset thepage = ceiling(qry.qry_filecount.thetotal / session.rowmaxpage)>
							Pages: 
								<select id="thepagelistw" onChange="loadcontent('rightside', $('##thepagelistw :selected').val());">
								<cfloop from="1" to="#thepage#" index="i">
									<cfset loopoffset = i - 1>
									<option value="#myself#c.w_content&wid=#attributes.wid#&folder_id=#attributes.folder_id#&fid=#attributes.fid#<cfif structkeyexists(attributes,"folder_id_r")>&folder_id_r=#attributes.folder_id_r#</cfif>&offset=#loopoffset#"<cfif (session.offset + 1) EQ i> selected</cfif>>#i#</option>
								</cfloop>
								</select>
						</span>
						</cfif>
					</div>
				</div>
			</th>
		</tr>
		<tr>
			<td valign="top" align="center">
				<!--- Show Subfolders --->
				<cfif session.iscol EQ "F">
					<cfloop query="qry_subfolders">
						<div class="assetbox" style="text-align:center;">
							<a href="#myself#c.w_content&wid=#attributes.wid#&folder_id=#folder_id#&folder_id_r=#folder_id_r#&fid=#attributes.fid#">
								<div class="theimg">
									<img src="#dynpath#/global/host/dam/images/folder-yellow.png" border="0"><br />
								</div>
							<strong>#folder_name#</strong></a>
						</div>
					</cfloop>
				</cfif>
				<cfoutput query="qry.qry_files" group="id"> <!--- We need this here since the SQL can not be smplified otherwise --->
					<div class="assetbox">
						<!--- Images --->
						<cfif kind EQ "img">
							<cfif is_available>
								<div class="theimg">
									<!--- Show assets --->
									<cfif link_kind NEQ "url">
										<cfif application.razuna.storage EQ "amazon" OR application.razuna.storage EQ "nirvanix">
											<cfif theformat EQ "original" OR theformat EQ "org">
												<cfset thev = "o">
												<cfset thefile = cloud_url_org>
												<cfset theid = id>
											<cfelseif theformat EQ "thumb" OR theformat EQ "">
												<cfset thev = "p">
												<cfset thefile = cloud_url>
												<cfset theid = id>
											<cfelse>
												<cfset thev = "o">
												<cfset theid = theformat>
											</cfif>
											<a href="##" onclick="window.open('#myself#c.si&f=#theid#&v=#thev#','#theid#','left=20,top=20,width=500,height=500,toolbar=0,resizable=1,location=0,status=0,menubar=0,history=0');"><img src="#cloud_url#" border="0"></a>
										<cfelse>
											<cfif theformat EQ "original" OR theformat EQ "org">
												<cfset thev = "o">
												<cfset theid = id>
											<cfelseif theformat EQ "thumb" OR theformat EQ "">
												<cfset thev = "p">
												<cfset theid = id>
											<cfelse>
												<cfset thev = "o">
												<cfset theid = theformat>
											</cfif>
											<a href="##" onclick="window.open('#myself#c.si&f=#theid#&v=#thev#','#theid#','left=20,top=20,width=500,height=500,toolbar=0,resizable=1,location=0,status=0,menubar=0,history=0');"><img src="#thestorage##path_to_asset#/thumb_#id#.#ext#" border="0">
										</cfif>
									<cfelse>
										<img src="#link_path_url#" border="0">
									</cfif>
								</div>
								<strong>#filename#</strong>
								<br>
								<a href="##" onclick="window.open('#myself#c.widget_download&file_id=#id#&wid=#session.widget_id#&kind=img','dl#theid#','left=20,top=20,width=500,height=500,toolbar=0,resizable=1,location=0,status=0,menubar=0,history=0');">#defaultsObj.trans("download")#</a>
							<cfelse>
								We are still working on the asset "#filename#"...
							</cfif>
						<!--- Videos --->
						<cfelseif kind EQ "vid">
							<cfif is_available>
								<cfset theid = id>
								<div class="theimg">
									<cfif link_kind NEQ "url">
										<!--- This is for the overlay --->
										<cfif theformat EQ "video" OR theformat EQ "" OR theformat EQ "org">
											<cfset theid = id>
										<cfelse>
											<cfset theid = theformat>
										</cfif>
										<!--- Show video preview images --->
										<cfif application.razuna.storage EQ "amazon" OR application.razuna.storage EQ "nirvanix">
											<a href="##" onclick="window.open('#myself#c.sv&f=#theid#&v=o','#theid#','left=20,top=20,width=500,height=500,toolbar=0,resizable=1,location=0,status=0,menubar=0,history=0');"><img src="#cloud_url#" border="0" width="160"></a>
										<cfelse>
											<a href="##" onclick="window.open('#myself#c.sv&f=#theid#&v=o','#theid#','left=20,top=20,width=500,height=500,toolbar=0,resizable=1,location=0,status=0,menubar=0,history=0');"><img src="#thestorage##path_to_asset#/#filename_org#" border="0" width="160"></a>
										</cfif>
									<cfelse>
										<img src="#dynpath#/global/host/dam/images/icons/icon_movie.png" border="0">
									</cfif>
								</div>
								<strong>#filename#</strong>
								<br>
								<a href="##" onclick="window.open('#myself#c.widget_download&file_id=#id#&wid=#session.widget_id#&kind=vid','dl#theid#','left=20,top=20,width=500,height=500,toolbar=0,resizable=1,location=0,status=0,menubar=0,history=0');">#defaultsObj.trans("download")#</a>
							<cfelse>
								We are still working on the asset "#filename#"...
							</cfif>
						<!--- Audios --->
						<cfelseif kind EQ "aud">
							<cfif is_available>
								<cfset theid = id>
								<!--- This is for the overlay --->
								<cfif theformat EQ "audio" OR theformat EQ "" OR theformat EQ "org">
									<cfset theid = id>
								<cfelse>
									<cfset theid = theformat>
								</cfif>
								<div class="theimg">
									<a href="##" onclick="window.open('#myself#c.sa&f=#theid#','#theid#','left=20,top=20,width=500,height=500,toolbar=0,resizable=1,location=0,status=0,menubar=0,history=0');"><img src="#dynpath#/global/host/dam/images/icons/icon_<cfif ext EQ "mp3" OR ext EQ "wav">#ext#<cfelse>aud</cfif>.png" border="0"></a>
								</div>
								<strong>#filename#</strong>
								<br>
								<a href="##" onclick="window.open('#myself#c.widget_download&file_id=#id#&wid=#session.widget_id#&kind=aud','dl#theid#','left=20,top=20,width=500,height=500,toolbar=0,resizable=1,location=0,status=0,menubar=0,history=0');">#defaultsObj.trans("download")#</a>
							<cfelse>
								We are still working on the asset "#filename#"...
							</cfif>
						<!--- All other files --->
						<cfelse>
							<cfif is_available>
								<div class="theimg">
									<cfif (application.razuna.storage EQ "amazon" OR application.razuna.storage EQ "nirvanix") AND ext EQ "PDF">
										<img src="#cloud_url#" border="0">
									<cfelseif application.razuna.storage EQ "local" AND ext EQ "PDF">
										<cfset thethumb = replacenocase(filename_org, ".pdf", ".jpg", "all")>
										<cfif FileExists("#ExpandPath("../../")##thestorage##path_to_asset#/#thethumb#") IS "no">
											-#filename_org#-<img src="#dynpath#/global/host/dam/images/icons/icon_#ext#.png" border="0">
										<cfelse>
											<img src="#thestorage##path_to_asset#/#thethumb#" border="0">
										</cfif>
									<cfelse>
										<cfif FileExists("#ExpandPath("../../")#global/host/dam/images/icons/icon_#ext#.png") IS "no"><img src="#dynpath#/global/host/dam/images/icons/icon_txt.png" border="0"><cfelse><img src="#dynpath#/global/host/dam/images/icons/icon_#ext#.png" border="0"></cfif>
									</cfif>
								</div>
								<strong>#filename#</strong>
								<!--- For now download pf PDF is allows independent of setting in the widget preferences --->
								<!--- <cfif qry_widget.widget_dl_org EQ "t"> --->
									<br>
									<a href="#myself#c.serve_file&file_id=#id#&type=doc">#defaultsObj.trans("download")#</a>
								<!--- </cfif> --->
							<cfelse>
								We are still working on the asset "#filename#"...
							</cfif>
						</cfif>
					</div>
				</cfoutput>
			</td>
		</tr>
	</table>
	</div>
<!--- Load ScrollingImages --->
<cfelse>
	<!-- Smooth Div Scroll 1.1 - minified for faster loading-->
	<script src="#dynpath#/global/js/widget/scrolling/jquery.ui.widget.js" type="text/javascript"></script>
	<script src="#dynpath#/global/js/widget/scrolling/jquery.smoothDivScroll-1.1-min.js" type="text/javascript"></script>	
 	<link rel="Stylesheet" type="text/css" href="#dynpath#/global/js/widget/scrolling/smoothDivScroll.css" /> 
	<script type="text/javascript"> 
		// Initialize the plugin with no custom options
		$(window).load(function() {
			$("div##makeMeScrollable").smoothDivScroll({
				autoScroll: "onstart" , 
				autoScrollDirection: "backandforth", 
				autoScrollStep: 1, 
				autoScrollInterval: 15,	
/* 				startAtElementId: "startAtMe",  */
				visibleHotSpots: "always"
			});
		});
	</script> 
	<!-- Styles for my specific scrolling content --> 
	<style type="text/css"> 
		##makeMeScrollable
		{
			width: 100%;
			height: 330px;
			position: relative;
		}
		##makeMeScrollable div.scrollableArea img
		{
			position: relative;
			float: left;
			margin: 0;
			padding: 0;
		}
	</style> 
	</head>
	<body>
	<div id="makeMeScrollable"> 
		<div class="scrollingHotSpotLeft"></div> 
		<div class="scrollingHotSpotRight"></div> 
		<div class="scrollWrapper"> 
			<div class="scrollableArea"> 
				<cfoutput query="qry.qry_files" group="id"> <!--- We need this here since the SQL can not be smplified otherwise --->
					<!--- Images --->
					<cfif kind EQ "img">
						<cfif is_available>
							<!--- Show assets --->
							<cfif link_kind NEQ "url">
								<cfif application.razuna.storage EQ "amazon" OR application.razuna.storage EQ "nirvanix">
									<cfif theformat EQ "original" OR theformat EQ "org">
										<cfset thefile = cloud_url_org>
									<cfelseif theformat EQ "thumb" OR theformat EQ "">
										<cfset thefile = cloud_url>
									<cfelse>
										<cfquery dataSource="#application.razuna.datasource#" name="thisformat">
										SELECT cloud_url_org
										FROM #session.hostdbprefix#images
										WHERE img_id = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#theformat#">
										</cfquery>
										<cfset thefile = thisformat.cloud_url_org>
									</cfif>
									<img src="#thefile#" border="0" rel="###id#">
								<cfelse>
									<cfif theformat EQ "original" OR theformat EQ "org">
										<cfset thefile = thestorage & path_to_asset & "/" & filename_org>
									<cfelseif theformat EQ "thumb" OR theformat EQ "">
										<cfset thefile = thestorage & path_to_asset & "/thumb_#id#.#ext#">
									<cfelse>
										<cfquery dataSource="#application.razuna.datasource#" name="thisformat">
										SELECT path_to_asset, img_filename_org
										FROM #session.hostdbprefix#images
										WHERE img_id = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#theformat#">
										</cfquery>
										<cfset thefile = thestorage & thisformat.path_to_asset & "/" & thisformat.img_filename_org>
									</cfif>
									<img src="#thefile#" border="0" rel="###id#">
								</cfif>
							<cfelse>
								<img src="#link_path_url#" border="0">
							</cfif>
						</cfif>
					</cfif>
				</cfoutput>
			</div> 
		</div> 
	</div>
</cfif>

</cfoutput>

</body>
</html>