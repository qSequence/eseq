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
<title>Sequence List</title>
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
        .bubble { background-color: green; border-radius: 5px; box-shadow: 0px 0px 6px #B2B2B2; height: 20px; margin: 30px 0 0 750px; font: 16px/25px sans-serif; color: yellow; text-align: center; }

        .button { font: bold 11px Arial; text-decoration: none; background-color: #EEEEEE; color: #333333; padding: 2px 6px 2px 6px; border-top: 1px solid #CCCCCC; border-right: 1px solid #333333; border-bottom: 1px solid #333333; border-left: 1px solid #CCCCCC; }

        .buttonSystem { font: bold 11px Arial; text-decoration: none; background-color: #EEEEEE; color: #333333; padding: 10px 60px 10px 60px; border-top: 1px solid #CCCCCC; border-right: 1px solid #333333; border-bottom: 1px solid #333333; border-left: 1px solid #CCCCCC; }

        .tooltip-inner { white-space:pre; max-width: none; text-align: justify;}
        .yellow-tooltip + .tooltip > .tooltip-inner {background-color: yellow; color: black; font-family: Arial; font-size: 8pt; font-weight: bold;}
        .span-warning{
             margin-left:10px;
             color: red;
         }
         .container_expand {
    width:80%;
    margin:0 auto;
    left: 150px;
    border:1px solid #d3d3d3;
}
.container_expand div {
    width:100%;
}
.container_expand .header {
    background-color:#d3d3d3;
    padding: 2px;
    cursor: pointer;
    font-weight: bold;
}
.container_expand .content {
    display: none;
    padding : 5px;
}
    </style>
</head>
<body>
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
	$("#userName").combogrid({
		url: 'SearchUsers.htm?action_param=search_with_properties_only',
		colModel: [
		           {'columnName':'userIdCol','width':'0','label':''},
		           {'columnName':'userNameCol','width':'50','label':'Username'},
		           {'columnName':'nameCol','width':'50','label':'Name'}
		           ],
		select: function( event, ui ) {


		$("#userName").val(ui.item.userNameCol);
		document.getElementById('userId').value="user_"+ui.item.userIdCol;
		
		return false;
		}
		});
	$("#catName").combogrid({
		url: 'SearchCategories.htm?action_param=search_with_properties_only',
		colModel: [
		           {'columnName':'catIdCol','width':'0','label':''},
		           {'columnName':'catNameCol','width':'50','label':'Category Name'}
		           ],
		select: function( event, ui ) {


		$("#catName").val(ui.item.catNameCol);
		document.getElementById('catId').value=ui.item.catIdCol;
		
		return false;
		}
		});
	$(".header").click(function () {

	    $header = $(this);
	    //getting the next element
	    $content = $header.next();
	    //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.
	    $content.slideToggle(500, function () {
	        //execute this after slideToggle is done
	        //change text of header based on visibility of content div
	        $header.text(function () {
	            //change text based on condition
	            return $content.is(":visible") ? "Search sequences" : "Search sequences";
	        });
	    });

	});   
});

function updateSeqMst( user_request_action_param, social_network_param, seq_mst_id_param,sequenceVersion_param, url) { 

$("#img_"+seq_mst_id_param).attr('src',"images/secure-link-image.png");
$("#img_"+seq_mst_id_param).attr('title',"Secure your shared link");
$("#img_"+seq_mst_id_param).attr('alt',"Secure your shared link");

		$.post(url,
				{
					user_request_action_param:user_request_action_param,
					seq_mst_id_param:seq_mst_id_param,
					social_network_param:social_network_param,
					sequenceVersion:sequenceVersion_param
				},
				function(data,status){
					
				});
	}
</script>

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
<c:if test="${modelUc.demoDB=='derby'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Note : You are using evaluation and demonstration purpose derrby database. Change to your own <a href="<c:url value="Install.htm"/>">database</a></div>
</c:if>
        <div class="row">
		<table align="center">
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
		<tr><td>
		<c:if test="${modelUc.sequenceVersion!='DEV_VERSION'}">
        	<c:if test="${modelUc.sequenceVersion!='PROD_VERSION'}">
        		<c:if test="${modelUc.showCreateSequence=='true'}">
		        <form action="ViewSequenceList.htm" method="post" >
				<div class="container_expand">
		        	<table>
						
		        		<tr><td><label for="sequenceName">Sequence Name*</label></td><td><label for="category">Select Category*</label></td><td><label for="sequenceName">User level access</label></td></tr>
						<tr>
						<td>
		            		<input id="sequenceName" name="sequenceName" type="text" maxlength="100" />
		            		<input id="number_of_sequences_param" name="number_of_sequences_param" type="hidden" value="${modelUc.numberOfSequences}" />
		            		<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="save_sequence_action" />
		                </td>
		                <td>
		            		<input id="catName" name="catName" type="text" maxlength="100" />
		            		<input id="catId" name="catId" type="hidden"  />
		            		
		                </td>
		                <td>
		                	<input id="userName" name="userName" type="text" maxlength="100" />
		            		<input id="userId" name="userId" type="hidden" />
		            		<select name="access_param" id="access_param" ><option value="RO">Read Only</option><option value="RW">Read Write</option></select>
		                	<input type="submit" src="/images/login.png" value="Create Sequence"></td>
		                
		                </tr>
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
				</div>
		        </form>
		        </c:if>
        	</c:if>
        </c:if>
	</td>
	</tr>
	<tr>
	<td>
<div class="container_expand">
    <div class="header"><span>Search sequences</span>

    </div>
    <div class="content">
<form action="ViewSequenceList.htm" method="post" >
        <input id="searchString" name="searchString" type="text" size="50" maxlength="1900"  />
        <input type="submit" src="/images/login.png" value="Search Sequences"></td>
</form>
    </div>
</div>
        </td>
		</tr>
        <tr><td>
		<c:set var="x" value="0" />
			<table align="center" width="1000" class="table-bordered">
        	<!-- DRAFT sequences -->
        		<c:if test="${modelUc.sequenceVersion!='DEV_VERSION'}">
        		<c:if test="${modelUc.sequenceVersion!='PROD_VERSION'}">

	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="#f7f8f9" width="100%" ><div style="float:center;width:80%;"><label for="sequenceName">Draft sequences</label></div>
	        		
	        		<div style="float:right;width:20%;"><a align="right" class="button" href="<c:url value="ModifiedSequenceList.htm?user_request_action_param=draft_release"/>">Release</a></div>
	        		
	        		</td></tr>
	        		<tr height="50px"><th  bgcolor="#d4fc5a" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#d4fc5a"><label for="createdDate">Created Date</label></th>
	        		<th  bgcolor="#d4fc5a"><label for="createdBy">Created By</label></th>
	        		<th  bgcolor="#d4fc5a"><label for="createdBy">Category</label></th>
	        		<th  bgcolor="#d4fc5a"><label for="delete">Delete</label></th>
	        		
	        		
	        		</tr>
					


         			<c:if test="${modelUc.ucSeqMstDraftList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color=red>No draft sequences found. Try creating one!</font>
						</td>
						</tr>
         			</c:if>
         		</c:if>
         		</c:if>
        	<c:if test="${modelUc.ucSeqMstDraftList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSeqMstDraftList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /> </td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
						<td align="center"><a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a></td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
        		</table>
        		
        		<!-- END DRAFT sequences -->
        		<!-- DRAFT system sequences -->
        		<table align="center" width="1000">
        		<c:if test="${modelUc.sequenceVersion!='DEV_VERSION'}">
        		<c:if test="${modelUc.sequenceVersion!='PROD_VERSION'}">

	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="#f7f8f9" width="100%" ><div style="float:center;width:80%;"><label for="sequenceName">Draft system sequences</label></div>
		        		
		        			<div style="float:right;width:20%;"><a align="right" class="button" href="<c:url value="ModifiedSequenceList.htm?user_request_action_param=draft_release"/>">Release</a></div>
	        			</td>
	        		</tr>
	         		<tr height="50px"><th  bgcolor="#d4fc5a" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#d4fc5a"><label for="createdDate">Created Date</label></th>
	         			<th  bgcolor="#d4fc5a"><label for="createdBy">Created By</label></th>
	        			<th  bgcolor="#d4fc5a"><label for="createdBy">Category</label></th>
	        			<th  bgcolor="#d4fc5a"><label for="delete">Delete</label></th>
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
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="UpdateCapability.htm?property_for_param=request&sys_seq_id=${seqMst.sysSeqId}&request_id_param=${seqMst.forRequestId}&sequenceVersion=sys_seq_draft"/>" ><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></td>
					</c:if>
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
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="UpdateCapability.htm?property_for_param=request&sys_seq_id=${seqMst.sysSeqId}&request_id_param=${seqMst.forRequestId}&sequenceVersion=sys_seq_draft"/>" ><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
        		</table>
        		<!-- END DRAFT system sequences -->
        		<!-- Development sequences -->
        		<table align="center" width="1000">
        		<c:if test="${modelUc.sequenceVersion!='DEV_VERSION'}">
        		<c:if test="${modelUc.sequenceVersion!='PROD_VERSION'}">
		        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="#c0c2c6" width="100%" >
		        				<div style="float:center;width:80%;"><label for="sequenceName">Development sequences</label></div>
		        			<div style="float:right;width:20%;"><a align="right" class="button" href="<c:url value="ModifiedSequenceList.htm?user_request_action_param=dev_release"/>">Release</a></div>
		        		</td></tr>
		         		
		         		<tr height="50px"><th  bgcolor="#beea3a" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#beea3a"><label for="createdDate">Created Date</label></th>
		         			<th  bgcolor="#beea3a"><label for="createdBy">Created By</label></th>
	        				<th  bgcolor="#beea3a"><label for="createdBy">Category</label></th>
		         			<th  bgcolor="#beea3a"><label for="delete">Delete</label></th>
		         			
		         		
		         		</tr>
		         		
		         		
		         		
	         		 <c:if test="${modelUc.ucSeqMstList[0]==null}">
	         		 	<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color="red">No development sequences found.</font>
						</td>
						</tr>
	         		 </c:if> 
         		 </c:if>
         		 </c:if>
         		<c:forEach items='${modelUc.ucSeqMstList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>     
				</table>
        		<!--END Development sequences -->
        		<!--Development system sequences -->
        		
        		<table align="center" width="1000">
        		<c:if test="${modelUc.sequenceVersion!='DEV_VERSION'}">
        		<c:if test="${modelUc.sequenceVersion!='PROD_VERSION'}">

	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="#c0c2c6" width="100%" >
	        			<div style="float:center;width:80%;"><label for="sequenceName">Development system sequences</label></div>
	        			
	        				<div style="float:right;width:20%;"><a align="right" class="button" href="<c:url value="ModifiedSequenceList.htm?user_request_action_param=dev_release"/>">Release</a></div>
	        			
	        		</td></tr>
	         		<tr height="50px"><th  bgcolor="#beea3a" width="50%" ><label for="sequenceName">Sequence Name</label></th>
	         		<c:if test="${modelUc.showCreateSequence=='true'}">
	         			<th  bgcolor="#beea3a"><label for="createdDate">Created Date</label></th>
	         		</c:if>
	         			<th  bgcolor="#beea3a"><label for="createdBy">Created By</label></th>
	        			<th  bgcolor="#beea3a"><label for="createdBy">Category</label></th>
	        			<th  bgcolor="#beea3a"><label for="delete">Delete</label></th>
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
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="UpdateCapability.htm?property_for_param=request&sys_seq_id=${seqMst.sysSeqId}&request_id_param=${seqMst.forRequestId}&sequenceVersion=sys_seq"/>" ><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></td>
					</c:if>
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
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="UpdateCapability.htm?property_for_param=request&sys_seq_id=${seqMst.sysSeqId}&request_id_param=${seqMst.forRequestId}&sequenceVersion=sys_seq"/>" ><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
        		</table>
        		
        		<!--END Development system sequences --> 
        		<!--START Development Version sequences --> 
        		<table align="center" width="1000">
        		<c:if test="${modelUc.sequenceVersion=='DEV_VERSION'}">
        			<tr height="50px"><td  align="center" colspan = "5" bgcolor="gray" width="100%" ><label for="sequenceName">Development sequence versions</label></td></tr>
         			<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#98bf21"><label for="createdDate">Created Date</label></th>
         				<th  bgcolor="#98bf21"><label for="createdBy">Created By</label></th>
	        			<th  bgcolor="#98bf21"><label for="createdBy">Category</label></th>
	         			
	         				<th  bgcolor="#98bf21"><label for="delete">Delete</label></th>
         			</tr>
         			<c:if test="${modelUc.ucSeqMstDevVersionList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	        			<td colspan="5"><font color="red">No development sequence versions found.</font>
						</td>
						</tr>
         			</c:if>
         		</c:if>
        		<c:if test="${modelUc.ucSeqMstDevVersionList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSeqMstDevVersionList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DEV_VERSION"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DEV_VERSION"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
						<td align="center"><a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DEV_VERSION"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a></td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DEV_VERSION"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DEV_VERSION"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
						<td align="center">
							<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DEV_VERSION"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a>
						</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>     
        		</c:if> 
        		</table>
        		<!--END Development Version sequences -->
        		<!--START Production sequences -->
        		
        		<table align="center" width="1000">
        		<c:if test="${modelUc.sequenceVersion!='DEV_VERSION'}">
        		<c:if test="${modelUc.sequenceVersion!='PROD_VERSION'}">
        		
	        		<tr height="50px"><td align="center" colspan="5" bgcolor="gray" width="100%" ><label for="sequenceName">Production sequences</label></td></tr>
	         		<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#98bf21"><label for="createdDate">Created Date</label></th>
	         			<th  bgcolor="#98bf21"><label for="createdBy">Created By</label></th>
	        			<th  bgcolor="#98bf21"><label for="createdBy">Category</label></th>
	         			<th  bgcolor="#98bf21"><label for="delete">Delete</label></th>
	         		
	         		</tr>
	         		<c:if test="${modelUc.ucSeqMstProdList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	        			<td colspan="5"><font color="red">No production sequences found.</font>
						</td>
						</tr>
	         		</c:if>
         		</c:if>
         		</c:if>
         		<c:forEach items='${modelUc.ucSeqMstProdList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
						<td align="center"><a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a></td>
					</c:if>
					
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:if test="${seqMst.accessLevel=='OW'}">
						<td align="center">
							<a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a>
						</td>
					</c:if>
					
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>     
				</table>
				<!--END Production sequences -->
				<!--START Production system sequences -->
				
				<table align="center" width="1000">
        		<c:if test="${modelUc.sequenceVersion!='DEV_VERSION'}">
        		<c:if test="${modelUc.sequenceVersion!='PROD_VERSION'}">
        		
	        		<tr height="50px"><td  align="center" colspan = "5" bgcolor="gray" width="100%" ><div style="float:center;width:80%;"><label for="sequenceName">Production system sequences</label></div></td></tr>
	         		<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#98bf21"><label for="createdDate">Created Date</label></th>
	         			<th  bgcolor="#98bf21"><label for="createdBy">Created By</label></th>
	        			<th  bgcolor="#98bf21"><label for="createdBy">Category</label></th>
	        			<th  bgcolor="#98bf21"><label for="createdBy">Delete</label></th>
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
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="UpdateCapability.htm?property_for_param=request&sys_seq_id=${seqMst.sysSeqId}&request_id_param=${seqMst.forRequestId}&sequenceVersion=sys_seq_prod"/>" ><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></td>
					</c:if>
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
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="UpdateCapability.htm?property_for_param=request&sys_seq_id=${seqMst.sysSeqId}&request_id_param=${seqMst.forRequestId}&sequenceVersion=sys_seq_prod"/>" ><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
        		     
				</table>
				<!--END Production system sequences -->
				<!--START Production sequence versions -->
				<table>
        		<c:if test="${modelUc.sequenceVersion=='PROD_VERSION'}">
        			<tr height="50px"><td  align="center" colspan = "5" bgcolor="gray" width="100%" ><label for="sequenceName">Production sequence versions</label></td></tr>
         			<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#98bf21"><label for="createdDate">Created Date</label></th>
         				<th  bgcolor="#98bf21"><label for="createdBy">Created By</label></th>
	        			<th  bgcolor="#98bf21"><label for="createdBy">Category</label></th>
	        			
	         				<th  bgcolor="#98bf21"><label for="delete">Delete</label></th>
	         			
         			</tr>
         			<c:if test="${modelUc.ucSeqMstProdVersionList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color="red"><strong>No production sequence versions found.</strong></font>
						</td>
						</tr>
         			</c:if>
         		</c:if>
        		<c:if test="${modelUc.ucSeqMstProdVersionList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSeqMstProdVersionList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD_VERSION"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD_VERSION"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
						<td align="center">
							<td align="center"><a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD_VERSION"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a></td>
						</td>
					</c:if>
					
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></td>
					</c:if>
				
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD_VERSION"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD_VERSION"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
						<td align="center">
							<td align="center"><a href="<c:url value="ViewSequenceList.htm?user_request_action_param=delete_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD_VERSION"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></a></td>
						</td>
					</c:if>
					
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.seqMstId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>     
        		</c:if> 
        	</table>
        	<!--START Production system sequence versions -->
				<table>
        		<c:if test="${modelUc.sequenceVersion=='SYS_SEQ_PROD_VERSION'}">
        			<tr height="50px"><td  align="center" colspan = "5" bgcolor="gray" width="100%" ><label for="sequenceName">Production system sequence versions</label></td></tr>
         			<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#98bf21"><label for="createdDate">Created Date</label></th>
         				<th  bgcolor="#98bf21"><label for="createdBy">Created By</label></th>
	        			<th  bgcolor="#98bf21"><label for="createdBy">Category</label></th>
	        			<th  bgcolor="#98bf21"><label for="delete">Delete</label></th>
	         			
         			</tr>
         			<c:if test="${modelUc.ucSysSeqMstProdVersionList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color="red"><strong>No production system sequence versions found.</strong></font>
						</td>
						</tr>
         			</c:if>
         		</c:if>
        		<c:if test="${modelUc.ucSysSeqMstProdVersionList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSysSeqMstProdVersionList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=SYS_PROD_VERSION"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=SYS_PROD_VERSION"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="UpdateCapability.htm?property_for_param=request&sys_seq_id=${seqMst.sysSeqId}&request_id_param=${seqMst.forRequestId}&sequenceVersion=SYS_PROD_VERSION"/>" ><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=SYS_PROD_VERSION"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=SYS_PROD_VERSION"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="UpdateCapability.htm?property_for_param=request&sys_seq_id=${seqMst.sysSeqId}&request_id_param=${seqMst.forRequestId}&sequenceVersion=SYS_PROD_VERSION"/>" ><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>     
        		</c:if> 
        	</table>
        	<!--START Development system sequence versions -->
				<table>
        		<c:if test="${modelUc.sequenceVersion=='SYS_SEQ_DEV_VERSION'}">
        			<tr height="50px"><td  align="center" colspan = "5" bgcolor="gray" width="100%" ><label for="sequenceName">Development system sequence versions</label></td></tr>
         			<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#98bf21"><label for="createdDate">Created Date</label></th>
         				<th  bgcolor="#98bf21"><label for="createdBy">Created By</label></th>
	        			<th  bgcolor="#98bf21"><label for="createdBy">Category</label></th>
	         			
	         				<th  bgcolor="#98bf21"><label for="delete">Delete</label></th>
	         			
         			</tr>
         			<c:if test="${modelUc.ucSysSeqMstDevVersionList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color="red"><strong>No development system sequence versions found.</strong></font>
						</td>
						</tr>
         			</c:if>
         		</c:if>
        		<c:if test="${modelUc.ucSysSeqMstDevVersionList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucSysSeqMstDevVersionList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=SYS_DEV_VERSION"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=SYS_DEV_VERSION"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="UpdateCapability.htm?property_for_param=request&sys_seq_id=${seqMst.sysSeqId}&request_id_param=${seqMst.forRequestId}&sequenceVersion=SYS_DEV_VERSION"/>" ><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=SYS_DEV_VERSION"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=SYS_DEV_VERSION"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					<c:if test="${seqMst.accessLevel=='OW'}">
					<td align="center">
						<a href="<c:url value="UpdateCapability.htm?property_for_param=request&sys_seq_id=${seqMst.sysSeqId}&request_id_param=${seqMst.forRequestId}&sequenceVersion=SYS_DEV_VERSION"/>" ><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></a>
					</td>
					</c:if>
					<c:if test="${seqMst.accessLevel!='OW'}">
						<td align="center"><img id='${seqMst.sysSeqId}'  src="images/delete.png"/></td>
					</c:if>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>     
        		</c:if> 
        	</table>
       </td>
       </tr> 
	</table>
</div>
</div>	
	 

	<script type= "text/javascript" src="jquery/bootstrap.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function () {
	        $('a').tooltip();
	    });
	</script>
</body>
</html>

