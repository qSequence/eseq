<%@ include file="header_for_seqdet.jsp"%>
    <script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="jquery/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="jquery/jquery-ui.css">
<title>Detect change and release</title>
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<style>
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
<style>

.bubble{
    background-color: green;
    border-radius: 5px;
    box-shadow: 0px 0px 6px #B2B2B2;
    height: 20px;
    margin:30px 0 0 750px;
	font: 16px/25px sans-serif; 
	color : yellow;
	text-align: center;
}
.tooltip {
    text-decoration:none;
    position:relative;
}
.tooltip span {
    display:none;
}
.tooltip:hover span {
    display:block;
    position:fixed;
    overflow:hidden;
    background-color:yellow;
    font-family:Arial;
 font-size:8pt;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#tool_tip").hide();

	$("#tool_tip")
	.fadeIn(9000);
	
	var tooltips = document.querySelectorAll('.tooltip span');

	window.onmousemove = function (e) {
	    var x = (e.clientX + 20) + 'px',
	        y = (e.clientY + 20) + 'px';
	    for (var i = 0; i < tooltips.length; i++) {
	        tooltips[i].style.top = y;
	        tooltips[i].style.left = x;
	    }
	};

});

function updateSeqMst( user_request_action_param, social_network_param, seq_mst_id_param, url) { 

$("#img_"+seq_mst_id_param).attr('src',"images/secure-link-image.png");
$("#img_"+seq_mst_id_param).attr('title',"Secure your shared link");
$("#img_"+seq_mst_id_param).attr('alt',"Secure your shared link");

		$.post(url,
				{
					user_request_action_param:user_request_action_param,
					seq_mst_id_param:seq_mst_id_param,
					social_network_param:social_network_param
				},
				function(data,status){
					
				});
	}
</script>

<div id="container">


<!--<div style="left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6;height:100px ">-->
<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/ViewSequenceList.htm?user_request_action_param=default_action_param&sequenceSaveError=${modelUc.sequenceSaveError}&buyEnterpriseVersionLink=${modelUc.buyEnterpriseVersionLink}&displayUpgradeProductLink=${modelUc.displayUpgradeProductLink}"/>
</c:if>
<c:if test="${modelUc.toolTip=='CREATE_SEQUENCE_TIP'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Enter name of the sequence & click the create sequence button, check <a href="<c:url value="faq.htm#new_sequence"/>"><strong>FAQ - Creating Your First Sequence</strong></a></div>
</c:if>
<c:if test="${modelUc.toolTip=='FIRST_SEQUENCE_SAVE'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Click on the sequence name to get started, check <a href="<c:url value="faq.htm#new_sequence"/>"><strong>FAQ - Creating Your First Sequence</strong></a></div>
</c:if>
<c:if test="${modelUc.toolTip=='ADD_SEQUENCE_DESC'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Click on   <img id="img1"  src="images/yellow_+_button.png"/>   to add description to the sequence</div>
</c:if>

		<table align="center">
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
		<tr><td>
		    <form action="DetectChangeAndRelease.htm" method="post" >
		        	<table>
						<tr><td>&nbsp;</td>
						<td>&nbsp;
						<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="save_release_items_action" />
		                </td><td><input type="submit" src="/images/login.png" value="Save"></td></tr>
		        		<tr>
		        		<td colspan="3"><font color="red">${modelUc.sequenceSaveError}
		        		<c:if test="${modelUc.displayUpgradeProductLink=='true'}">
		        			&nbsp;At the moment we provide the indicated number of sequences online. Contact us if you have any questions.
		        		</c:if>
		        		<c:if test="${modelUc.buyEnterpriseVersionLink=='true'}">
		        			&nbsp;Send email to admin@qsequence.com
		        		</c:if>
		
		        		</font>
		        		</td></tr>
						<tr><td colspan="3">&nbsp;</td></tr>
		        	</table>
		    </form>
        </td>
		</tr>
        <tr><td>
		<c:set var="x" value="0" />
        	<table align="center" width="900">

        		<c:if test="${modelUc.ucSeqRelease[0]!=null and modelUc.ucSeqMstList[0]!=null or modelUc.ucSeqMstProdList[0]!=null}">
	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="gray" width="100%" ><label for="sequenceName">Draft sequences</label></td></tr>
	         		<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#98bf21"><label for="createdDate">Created Date</label></th><th  bgcolor="#98bf21"><label for="share">Share</label></th><th  bgcolor="#98bf21"><label for="secure">Secure</label></th><th  bgcolor="#98bf21"><label for="delete">Delete</label></th></tr>
         		</c:if>
         			<c:if test="${modelUc.ucSeqMstDraftList[0]==null and modelUc.ucSeqMstList[0]==null and modelUc.ucSeqMstProdList[0]==null}">
         			<tr height="50px"><td  align="center" colspan = "5" bgcolor="gray" width="100%" ><label for="sequenceName">Draft sequences</label></td></tr>
	         		<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#98bf21"><label for="createdDate">Created Date</label></th><th  bgcolor="#98bf21"><label for="share">Share</label></th><th  bgcolor="#98bf21"><label for="secure">Secure</label></th><th  bgcolor="#98bf21"><label for="delete">Delete</label></th></tr>
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color="red"><strong>No draft sequences found. Try creating one!</strong></font>
						</td>
						</tr>
         			</c:if>
        	<c:if test="${modelUc.ucSeqMstDraftList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSeqMstDraftList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>">${seqMst.seqName}<span>${seqMst.seqDescription}</span></a>
					</td>
					<td align="center">${seqMst.createdDate} </td>
					
					<td align="center">
					<!-- Facebook -->
					<a onclick="updateSeqMst( 'make_link_public_action', 'facebook', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.facebook.com/sharer/sharer.php?s=100&p[url]=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&p[images][0]=&p[title]=${seqMst.seqName}&p[summary]=${seqMst.seqDescription}"><img id='${seqMst.seqMstId}'  src="images/facebook_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'twitter', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://twitter.com/home?status=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/twitter_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'gplus', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="https://plus.google.com/share?url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/googleplus_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'linkin', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.linkedin.com/shareArticle?mini=true&url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&title=${seqMst.seqName}&summary=${seqMst.seqDescription}&source=www.qsequence.com"><img id='${seqMst.seqMstId}'  src="images/linkedin_share_button.png"/></a>
					</td>
					<td>
					<c:if test="${seqMst.isPublic=='Y'}">
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=secure_link_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Note, if you secure the link, the link shared on your social network site will not work.')"><img id='img_${seqMst.seqMstId}' title="Secure your shared link" alt="Secure your shared link" src="images/secure-link-image.png"/></a>
					</c:if>
					<c:if test="${seqMst.isPublic!='Y'}">
						<img id='img_${seqMst.seqMstId}'  src="images/secure-link-image_gray.png" title="This is a secure link, if you want to make it public share it on one of the social networking sites"  alt="This is a secure link, if you want to make it public share it on one of the social networking sites"/>
					</c:if>

					</td>
					<td align="center"><a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a></td>
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>">${seqMst.seqName}<span>${seqMst.seqDescription}</span></a>
					</td>
					<td align="center">${seqMst.createdDate} </td>

					<td align="center">
					<!-- Facebook -->
					<a onclick="updateSeqMst( 'make_link_public_action', 'facebook', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.facebook.com/sharer/sharer.php?s=100&p[url]=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&p[images][0]=&p[title]=${seqMst.seqName}&p[summary]=${seqMst.seqDescription}"><img id='${seqMst.seqMstId}'  src="images/facebook_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'twitter', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://twitter.com/home?status=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/twitter_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'gplus', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="https://plus.google.com/share?url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"><img id='${seqMst.seqMstId}'  src="images/googleplus_share_button.png"/></a>
					<a onclick="updateSeqMst( 'make_link_public_action', 'linkin', '${seqMst.seqMstId}', '<c:url value="/ViewSequenceList.htm" />');" target="_blank" href="http://www.linkedin.com/shareArticle?mini=true&url=https://www.qsequence.com${modelUc.CONTEXT_PATH}/GlobalSeqDet.htm?seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT&title=${seqMst.seqName}&summary=${seqMst.seqDescription}&source=www.qsequence.com"><img id='${seqMst.seqMstId}'  src="images/linkedin_share_button.png"/></a>
					</td>
					<td>
					<c:if test="${seqMst.isPublic=='Y'}">
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=secure_link_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Note, if you secure the link, the link shared on your social network site will not work.')"><img id='img_${seqMst.seqMstId}' title="Secure your shared link" alt="Secure your shared link" src="images/secure-link-image.png"/></a>
					</c:if>
					<c:if test="${seqMst.isPublic!='Y'}">
						<img id='img_${seqMst.seqMstId}'  src="images/secure-link-image_gray.png" title="This is a secure link, if you want to make it public share it on one of the social networking sites"  alt="This is a secure link, if you want to make it public share it on one of the social networking sites"/>
					</c:if>
	
					</td>
					<td align="center">
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a>
					</td>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
        		 
        		
        		
        		
        	</table>
       </td>
       </tr> 
	</table>
	<br/><br/><br/><br/><br/>
${modelUc.footerLineBreaks}
<%@ include file="footer.jsp"%>
