<%@ include file="header_for_seqdet.jsp"%>
    <script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="jquery/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="jquery/jquery-ui.css">
    <link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/a.css" />"  type="text/css">
<%--  12 Oct added combogrid jquery libraries--%>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
<script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>
<%-- END 12 Oct added combogrid jquery libraries--%>
<title>Capabilities</title>
    <style type="text/css">
        .navbar-inverse .navbar-nav>li>a {
            color: #767676;
            font-size:14px;
            border:2px solid #e7f4c1;
            padding:10px 5px;
        }
        .navbar-inverse .navbar-nav>li>a:hover{
            color: #6b8f00;
            border:1px solid #98bf21;
            background-color:#f1f1f1;
            transition: all 0.3s ease 0s;
        } 
       .main { 
    			width: 1000px;
    			margin: 0 auto;
			margin-top: 50px;
			align:center;
		}
		.capabilities_div {
		 	width: 150px;
		 	height: 30px;
			text-align:center;
		    box-shadow: 10px 10px 5px #888888;
		    float: left;
		}
		.button { font: bold 11px Arial; text-decoration: none; background-color: #EEEEEE; color: #333333; padding: 2px 6px 2px 6px; border-top: 1px solid #CCCCCC; border-right: 1px solid #333333; border-bottom: 1px solid #333333; border-left: 1px solid #CCCCCC; }

        .buttonSystem { font: bold 11px Arial; text-decoration: none; background-color: #EEEEEE; color: #333333; padding: 10px 60px 10px 60px; border-top: 1px solid #CCCCCC; border-right: 1px solid #333333; border-bottom: 1px solid #333333; border-left: 1px solid #CCCCCC; }
		
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
<!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#md-navbar-collapse-1">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="/">
<img src="images/logo.png" alt="qSequence logo" class="img-responsive">
</a>
</div>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="md-navbar-collapse-1">
<ul class="nav navbar-nav navbar-right">
<c:if test="${modelUc.loginSuccessful!='SUCCESSFUL'}">
<li>
<a href="<c:url value="/Dashboard.htm" />">Home</a>
</li>
<li>
<a href="<c:url value="/Login.htm" />">Login</a>
</li>
</c:if>
<c:if test="${modelUc.loginSuccessful=='SUCCESSFUL'}">
<li>
<a href="<c:url value="/Dashboard.htm" />">Home</a>
</li>
<li>
<a href="<c:url value="/Profile.htm" />">Profile</a>
</li>
<c:if test="${modelUc.role=='ADMIN' or modelUc.role=='ENTERPRISE_ARCHITECT' }">
	<li>
	<a href="<c:url value="/Admin.htm" />">Admin</a>
	</li>
</c:if>
<li>
<a href="<c:url value="/Logout.htm" />">Logout</a>
</li>
</c:if>
</ul>
</div>
<!-- /.navbar-collapse -->
</nav>
<div class="container">
<h1 align="center">Capabilities</h1>
<div class="main">
	<c:forEach items="${modelUc.systemTypeList}" var="systemType" >
		<a style="display:block" href="<c:url value="SystemTypeCapabilities.htm?user_request_action_param=SystemTypeCapabilities&systemType_param=${systemType.systemType}"/>">
			<div class="capabilities_div" style="background-color:${systemType.color}">
				<b>${systemType.count}</b> ${systemType.systemTypeDisplayName}
			</div>
		</a>
	</c:forEach>
</div>

<div>
	<table>
		<tr><td>&nbsp;</td></tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td>		<c:set var="x" value="0" />
			<!-- DRAFT system sequences -->
        		<table align="center" width="1000">
        		<c:if test="${modelUc.sequenceVersion!='DEV_VERSION'}">
        		<c:if test="${modelUc.sequenceVersion!='PROD_VERSION'}">

	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="gray" width="100%" ><div style="float:center;width:80%;"><label for="sequenceName">Draft system sequences</label></div>
		        		<c:if test="${modelUc.showCreateSequence=='true'}">
		        			<div style="float:right;width:20%;"><a align="right" class="button" href="<c:url value="ModifiedSequenceList.htm?user_request_action_param=draft_release"/>">Release</a></div>
		        		</c:if>	
	        			</td>
	        		</tr>
	         		<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#98bf21"><label for="createdDate">Created Date</label></th>
	         			<th  bgcolor="#98bf21"><label for="createdBy">Created By</label></th>
	        			<th  bgcolor="#98bf21"><label for="createdBy">Category</label></th>
	         		</tr>

         			<c:if test="${modelUc.ucSysSeqMstDraftList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color="red">No draft system sequences found.</font>
						</td>
						</tr>
         			</c:if>
         		</c:if>
         		</c:if>
         		<c:if test="${modelUc.ucSysSeqMstDraftList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSysSeqMstDraftList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<!-- 
					<td align="center">&nbsp; -->
					<!-- Facebook 
					<a onclick="updateSeqMst( 'make_link_public_action', 'facebook', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.facebook.com/sharer/sharer.php?s=100&p[url]=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&p[images][0]=&p[title]=${seqMst.seqName}&p[summary]=${seqMst.seqDescription}"><img id='${seqMst.seqMstId}'  src="images/facebook_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'twitter', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://twitter.com/home?status=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/twitter_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'gplus', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="https://plus.google.com/share?url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/googleplus_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'linkin', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.linkedin.com/shareArticle?mini=true&url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&title=${seqMst.seqName}&summary=${seqMst.seqDescription}&source=www.qsequence.com"><img id='${seqMst.seqMstId}'  src="images/linkedin_share_button.png"/></a>
					
					</td>
					<td>&nbsp;-->
					<!-- 
					<c:if test="${seqMst.isPublic=='Y'}">
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=secure_link_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Note, if you secure the link, the link shared on your social network site will not work.')"><img id='img_${seqMst.seqMstId}' title="Secure your shared link" alt="Secure your shared link" src="images/secure-link-image.png"/></a>
					</c:if>
					<c:if test="${seqMst.isPublic!='Y'}">
						<img id='img_${seqMst.seqMstId}'  src="images/secure-link-image_gray.png" title="This is a secure link, if you want to make it public share it on one of the social networking sites"  alt="This is a secure link, if you want to make it public share it on one of the social networking sites"/>
					</c:if>
					
					</td>
					<td align="center">-->
					<!-- 
					<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a>
					
					</td>-->
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /> </td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<!--
					<td align="center">&nbsp;
					 Facebook -->
					<!-- 
					<a onclick="updateSeqMst( 'make_link_public_action', 'facebook', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.facebook.com/sharer/sharer.php?s=100&p[url]=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&p[images][0]=&p[title]=${seqMst.seqName}&p[summary]=${seqMst.seqDescription}"><img id='${seqMst.seqMstId}'  src="images/facebook_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'twitter', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://twitter.com/home?status=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/twitter_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'gplus', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="https://plus.google.com/share?url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/googleplus_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'linkin', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.linkedin.com/shareArticle?mini=true&url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&title=${seqMst.seqName}&summary=${seqMst.seqDescription}&source=www.qsequence.com"><img id='${seqMst.seqMstId}'  src="images/linkedin_share_button.png"/></a>
					
					</td>
					<td>-->
					<!-- 
					<c:if test="${seqMst.isPublic=='Y'}">
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=secure_link_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Note, if you secure the link, the link shared on your social network site will not work.')"><img id='img_${seqMst.seqMstId}' title="Secure your shared link" alt="Secure your shared link" src="images/secure-link-image.png"/></a>
					</c:if>
					<c:if test="${seqMst.isPublic!='Y'}">
						<img id='img_${seqMst.seqMstId}'  src="images/secure-link-image_gray.png" title="This is a secure link, if you want to make it public share it on one of the social networking sites"  alt="This is a secure link, if you want to make it public share it on one of the social networking sites"/>
					</c:if>
					
					</td>
					<td align="center">-->
					<!-- 
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a>
					
					</td>-->
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
        		</table>
        		<!-- END DRAFT system sequences -->
        		<!--Development system sequences -->
        		
        		<table align="center" width="1000">
        		<c:if test="${modelUc.sequenceVersion!='DEV_VERSION'}">
        		<c:if test="${modelUc.sequenceVersion!='PROD_VERSION'}">

	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="gray" width="100%" >
	        			<div style="float:center;width:80%;"><label for="sequenceName">Development system sequences</label></div>
	        			<c:if test="${modelUc.showCreateSequence=='true'}">
	        				<div style="float:right;width:20%;"><a align="right" class="button" href="<c:url value="ModifiedSequenceList.htm?user_request_action_param=dev_release"/>">Release</a></div>
	        			</c:if>
	        		</td></tr>
	         		<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Sequence Name</label></th>
	         		<c:if test="${modelUc.showCreateSequence=='true'}">
	         			<th  bgcolor="#98bf21"><label for="createdDate">Created Date</label></th>
	         		</c:if>
	         			<th  bgcolor="#98bf21"><label for="createdBy">Created By</label></th>
	        			<th  bgcolor="#98bf21"><label for="createdBy">Category</label></th>
	         		</tr>

         			<c:if test="${modelUc.ucSysSeqMstList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color="red">No development system sequences found.</font>
						</td>
						</tr>
         			</c:if>
         		</c:if>
         		</c:if>
         		<c:if test="${modelUc.ucSysSeqMstList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSysSeqMstList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<!-- 
					<td align="center">&nbsp; -->
					<!-- Facebook 
					<a onclick="updateSeqMst( 'make_link_public_action', 'facebook', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.facebook.com/sharer/sharer.php?s=100&p[url]=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&p[images][0]=&p[title]=${seqMst.seqName}&p[summary]=${seqMst.seqDescription}"><img id='${seqMst.seqMstId}'  src="images/facebook_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'twitter', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://twitter.com/home?status=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/twitter_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'gplus', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="https://plus.google.com/share?url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/googleplus_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'linkin', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.linkedin.com/shareArticle?mini=true&url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&title=${seqMst.seqName}&summary=${seqMst.seqDescription}&source=www.qsequence.com"><img id='${seqMst.seqMstId}'  src="images/linkedin_share_button.png"/></a>
					
					</td>
					<td>&nbsp;-->
					<!-- 
					<c:if test="${seqMst.isPublic=='Y'}">
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=secure_link_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Note, if you secure the link, the link shared on your social network site will not work.')"><img id='img_${seqMst.seqMstId}' title="Secure your shared link" alt="Secure your shared link" src="images/secure-link-image.png"/></a>
					</c:if>
					<c:if test="${seqMst.isPublic!='Y'}">
						<img id='img_${seqMst.seqMstId}'  src="images/secure-link-image_gray.png" title="This is a secure link, if you want to make it public share it on one of the social networking sites"  alt="This is a secure link, if you want to make it public share it on one of the social networking sites"/>
					</c:if>
					
					</td>
					<td align="center">-->
					<!-- 
					<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a>
					
					</td>-->
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<!--
					<td align="center">&nbsp;
					 Facebook -->
					<!-- 
					<a onclick="updateSeqMst( 'make_link_public_action', 'facebook', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.facebook.com/sharer/sharer.php?s=100&p[url]=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&p[images][0]=&p[title]=${seqMst.seqName}&p[summary]=${seqMst.seqDescription}"><img id='${seqMst.seqMstId}'  src="images/facebook_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'twitter', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://twitter.com/home?status=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/twitter_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'gplus', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="https://plus.google.com/share?url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/googleplus_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'linkin', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.linkedin.com/shareArticle?mini=true&url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&title=${seqMst.seqName}&summary=${seqMst.seqDescription}&source=www.qsequence.com"><img id='${seqMst.seqMstId}'  src="images/linkedin_share_button.png"/></a>
					
					</td>
					<td>-->
					<!-- 
					<c:if test="${seqMst.isPublic=='Y'}">
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=secure_link_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Note, if you secure the link, the link shared on your social network site will not work.')"><img id='img_${seqMst.seqMstId}' title="Secure your shared link" alt="Secure your shared link" src="images/secure-link-image.png"/></a>
					</c:if>
					<c:if test="${seqMst.isPublic!='Y'}">
						<img id='img_${seqMst.seqMstId}'  src="images/secure-link-image_gray.png" title="This is a secure link, if you want to make it public share it on one of the social networking sites"  alt="This is a secure link, if you want to make it public share it on one of the social networking sites"/>
					</c:if>
					
					</td>
					<td align="center">-->
					<!-- 
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a>
					
					</td>-->
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
        		</table>
        		
        		<!--END Development system sequences --> 
        		<!--START Production system sequences -->
				
				<table align="center" width="1000">
        		<c:if test="${modelUc.sequenceVersion!='DEV_VERSION'}">
        		<c:if test="${modelUc.sequenceVersion!='PROD_VERSION'}">
        		
	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="gray" width="100%" ><div style="float:center;width:80%;"><label for="sequenceName">Production system sequences</label></div></td></tr>
	         		<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#98bf21"><label for="createdDate">Created Date</label></th>
	         			<th  bgcolor="#98bf21"><label for="createdBy">Created By</label></th>
	        			<th  bgcolor="#98bf21"><label for="createdBy">Category</label></th>
	         		</tr>
	         		<c:if test="${modelUc.ucSysSeqMstProdList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	        			<td colspan="5"><font color="red">No production system sequences found.</font>
						</td>
						</tr>
	         		</c:if>
         		</c:if>
         		</c:if>
         		<c:if test="${modelUc.ucSysSeqMstProdList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSysSeqMstProdList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<!-- 
					<td align="center">&nbsp; -->
					<!-- Facebook 
					<a onclick="updateSeqMst( 'make_link_public_action', 'facebook', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.facebook.com/sharer/sharer.php?s=100&p[url]=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&p[images][0]=&p[title]=${seqMst.seqName}&p[summary]=${seqMst.seqDescription}"><img id='${seqMst.seqMstId}'  src="images/facebook_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'twitter', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://twitter.com/home?status=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/twitter_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'gplus', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="https://plus.google.com/share?url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/googleplus_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'linkin', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.linkedin.com/shareArticle?mini=true&url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&title=${seqMst.seqName}&summary=${seqMst.seqDescription}&source=www.qsequence.com"><img id='${seqMst.seqMstId}'  src="images/linkedin_share_button.png"/></a>
					
					</td>
					<td>&nbsp;-->
					<!-- 
					<c:if test="${seqMst.isPublic=='Y'}">
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=secure_link_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Note, if you secure the link, the link shared on your social network site will not work.')"><img id='img_${seqMst.seqMstId}' title="Secure your shared link" alt="Secure your shared link" src="images/secure-link-image.png"/></a>
					</c:if>
					<c:if test="${seqMst.isPublic!='Y'}">
						<img id='img_${seqMst.seqMstId}'  src="images/secure-link-image_gray.png" title="This is a secure link, if you want to make it public share it on one of the social networking sites"  alt="This is a secure link, if you want to make it public share it on one of the social networking sites"/>
					</c:if>
					
					</td>
					<td align="center">-->
					<!-- 
					<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a>
					
					</td>-->
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<!--
					<td align="center">&nbsp;
					 Facebook -->
					<!-- 
					<a onclick="updateSeqMst( 'make_link_public_action', 'facebook', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.facebook.com/sharer/sharer.php?s=100&p[url]=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&p[images][0]=&p[title]=${seqMst.seqName}&p[summary]=${seqMst.seqDescription}"><img id='${seqMst.seqMstId}'  src="images/facebook_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'twitter', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://twitter.com/home?status=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/twitter_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'gplus', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="https://plus.google.com/share?url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/googleplus_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'linkin', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.linkedin.com/shareArticle?mini=true&url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&title=${seqMst.seqName}&summary=${seqMst.seqDescription}&source=www.qsequence.com"><img id='${seqMst.seqMstId}'  src="images/linkedin_share_button.png"/></a>
					
					</td>
					<td>-->
					<!-- 
					<c:if test="${seqMst.isPublic=='Y'}">
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=secure_link_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Note, if you secure the link, the link shared on your social network site will not work.')"><img id='img_${seqMst.seqMstId}' title="Secure your shared link" alt="Secure your shared link" src="images/secure-link-image.png"/></a>
					</c:if>
					<c:if test="${seqMst.isPublic!='Y'}">
						<img id='img_${seqMst.seqMstId}'  src="images/secure-link-image_gray.png" title="This is a secure link, if you want to make it public share it on one of the social networking sites"  alt="This is a secure link, if you want to make it public share it on one of the social networking sites"/>
					</c:if>
					
					</td>
					<td align="center">-->
					<!-- 
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a>
					
					</td>-->
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
        		     
				</table>
				<!--END Production system sequences -->
		</td>
       </tr> 
	</table>
</div>        	
</div>	
</body>
</html>
