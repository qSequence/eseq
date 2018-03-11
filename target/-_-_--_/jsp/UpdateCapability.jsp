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
<title>Update Capability</title>
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
<c:redirect url="/UpdateCapability.htm?property_for_param=${modelUc.property_for_param}&system_id_param=${modelUc.system_id_param}&request_id_param=${modelUc.request_id_param}&response_id_param=${modelUc.response_id_param}&message=${modelUc.message}"/>
</c:if>
        <div class="row">
		<table align="center">
			<tr><td>&nbsp;</td></tr>
			<tr align="center"><td><h1>Update Capability</h1></td></tr>
			<tr><td>&nbsp;</td></tr>
		<tr><td>
		        <form action="UpdateCapability.htm" method="post" >
		        	<table align="center" >
						<c:if test="${modelUc.property_for_param=='request'}">
							<tr>
								<td><label for="capabilityName">System</label></td>
				        		<td><input id="system" name="system" type="text" maxlength="50" value="${modelUc.system}" disabled="disabled"/></td>
				        		<td>&nbsp;</td>
				        	</tr>
			        		<tr>
			        		
				        		<td><label for="capabilityName">Request</label></td>
				        		<td><input id="request" name="request" type="text" maxlength="50" value="${modelUc.request}" /></td>
				        		<td><label for="sequenceName"><input type="submit" src="/images/login.png" name="request_update" value="Update Request"></label></td>
				        	</tr>
				        	<tr>
			        		
				        		<td><label for="capabilityName">Response</label></td>
				        		<td><input id="response" name="response" type="text" maxlength="50" value="${modelUc.response}" /></td>
				        		<td><label for="sequenceName"><input type="submit" src="/images/login.png" name="response_update" value="Update Response"></label></td>
				        	</tr>
			        	</c:if>
			        	<c:if test="${modelUc.property_for_param=='response'}">
							<tr>
								<td><label for="capabilityName">System</label></td>
				        		<td><input id="system" name="system" type="text" maxlength="50" value="${modelUc.system}" disabled="disabled"/></td>
				        		<td>&nbsp;</td>
				        	</tr>
			        		<tr>
			        		
				        		<td><label for="capabilityName">Request</label></td>
				        		<td><input id="request" name="request" type="text" maxlength="50" value="${modelUc.request}" /></td>
				        		<td><label for="sequenceName"><input type="submit" src="/images/login.png" name="request_update" value="Update Request"></label></td>
				        	</tr>
				        	<tr>
			        		
				        		<td><label for="capabilityName">Response</label></td>
				        		<td><input id="response" name="response" type="text" maxlength="50" value="${modelUc.response}" /></td>
				        		<td><label for="sequenceName"><input type="submit" src="/images/login.png" name="response_update" value="Update Response"></label></td>
				        	</tr>
			        	</c:if>
			        	<c:if test="${modelUc.property_for_param=='system'}">
			        		<tr>
			        		
				        		<td><label for="capabilityName">System</label></td>
				        		<td><input id="system" name="system" type="text" maxlength="50" value="${modelUc.system}" /></td>
				        		<td><label for="sequenceName"><input type="submit" src="/images/login.png" name="system_update" value="Update System"></label></td>
				        	</tr>
			        	</c:if>
						<tr align="center">
							<td align="center" colspan="3">
			            		<input type="submit" src="/images/login.png" name="delete" value="Delete Capability">
			            		<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="save_sequence_action" />
			                
			                	
			            		<input id="property_for_param" name="property_for_param" type="hidden" value="${modelUc.property_for_param}" />
			            		<input id="system_id_param" name="system_id_param" type="hidden" value="${modelUc.system_id_param}" />
			            		<input id="request_id_param" name="request_id_param" type="hidden" value="${modelUc.request_id_param}" />
			            		<input id="response_id_param" name="response_id_param" type="hidden" value="${modelUc.response_id_param}" />
			            		
			                	
			                </td>
		                
		                </tr>

		        		<tr>
		        		<td colspan="3"><font color="red">${modelUc.message}</font>
		        		</td></tr>
						<tr><td colspan="3">&nbsp;</td></tr>
						
		        	</table>
		        </form>

        </td>
		</tr>
        <tr><td>
		<c:set var="x" value="0" />
		
			<table align="center" width="1000" class="table-bordered">
        	<!-- DRAFT sequences -->
        		
	        		<tr height="50px"><td  align="center" colspan = "6" bgcolor="#f7f8f9" width="100%" ><div style="float:center;width:80%;"><label for="sequenceName">Used in sequences</label></div>
	        		
	        		</td></tr>
	        		<tr height="50px"><th  bgcolor="#d4fc5a" width="50%" ><label for="sequenceName">Sequence Name</label></th>
	        		<th  bgcolor="#d4fc5a"><label for="createdDate">Release Status</label></th>
	        		<th  bgcolor="#d4fc5a"><label for="createdDate">Created Date</label></th>
	        		<th  bgcolor="#d4fc5a"><label for="createdBy">Created By</label></th>
	        		<th  bgcolor="#d4fc5a"><label for="createdBy">Category</label></th>
	        		
	        		</tr>
        		<c:if test="${modelUc.ucSeqMstDraftList[0]==null and modelUc.ucSeqMstList[0]==null and modelUc.ucSeqMstProdList[0]==null and modelUc.ucSysSeqMstDraftList[0]==null and modelUc.ucSysSeqMstList[0]==null and modelUc.ucSysSeqMstProdList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="6"><font color=red>No usage found.</font>
						</td>
						</tr>
         			</c:if>
         		<c:forEach items='${modelUc.ucSeqMstDraftList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a  target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  target="_blank" class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Draft</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /> </td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=DRAFT"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Draft</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		
         		<c:forEach items='${modelUc.ucSysSeqMstDraftList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Draft</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Draft</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /> </td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		
         		<c:forEach items='${modelUc.ucSeqMstList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Development</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Development</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>     
				
         		<c:forEach items='${modelUc.ucSysSeqMstList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Development</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Development</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		
         		<c:forEach items='${modelUc.ucSeqMstProdList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Production</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD"/>"><img id='${seqMst.seqMstId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${seqMst.seqMstId}&sequenceVersion=PROD"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Production</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
				
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>     
				
         		<c:forEach items='${modelUc.ucSysSeqMstProdList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Production</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Production</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>        		     
				</table>
				<!--END Production system sequences -->
				<table align="center" width="1000" class="table-bordered">
        			<tr height="50px"><td  align="center" colspan = "5" bgcolor="#f7f8f9" width="100%" ><div style="float:center;width:80%;"><label for="sequenceName">Capability sequences</label></div>
	        		
	        		</td></tr>
	        		<tr height="50px"><th  bgcolor="#d4fc5a" width="50%" ><label for="sequenceName">Sequence Name</label></th>
	        		<th  bgcolor="#d4fc5a"><label for="createdDate">Release Status</label></th>
	        		<th  bgcolor="#d4fc5a"><label for="createdDate">Created Date</label></th>
	        		<th  bgcolor="#d4fc5a"><label for="createdBy">Created By</label></th>
	        		<th  bgcolor="#d4fc5a"><label for="createdBy">Category</label></th>
	        		
	        		</tr>
	        		<c:if test="${modelUc.ucCapSysSeqMstDraftList[0]==null and modelUc.ucCapSysSeqMstList[0]==null and modelUc.ucCapSysSeqMstProdList[0]==null}">
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="5"><font color=red>No capability sequence found.</font>
						</td>
						</tr>
         			</c:if>
	        	<c:forEach items='${modelUc.ucCapSysSeqMstDraftList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Draft</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_draft"/>"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Draft</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /> </td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>	
	        	<c:forEach items='${modelUc.ucCapSysSeqMstList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Development</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Development</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>	
	        	<c:forEach items='${modelUc.ucCapSysSeqMstProdList}' var="seqMst">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Production</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqMst.htm?request_action_param=edit_sequence_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>"><img id='${seqMst.sysSeqId}'  src="images/yellow_+_button.png"/></a>
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"  class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${seqMst.sysSeqId}&sequenceVersion=sys_seq_prod"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${seqMst.seqDescription}">${seqMst.seqName}</a>
					</td>
					<td align="center">Production</td>
					<td align="center"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a"  value="${seqMst.createdDate}" /></td>
					<td align="center">${seqMst.usernameAndTeamCreated}</td>
					<td align="center">${seqMst.catName}</td>
					
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
	        		
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
