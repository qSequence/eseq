<%@ include file="header_for_seqdet.jsp"%>
    <script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="jquery/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="jquery/jquery-ui.css">
    <link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
	<link href="css/qSequence-otherPages.css" rel="stylesheet">    
<title>Host Cluster List</title>
</head>
<body>

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
.button {
  font: bold 11px Arial;
  text-decoration: none;
  background-color: #EEEEEE;
  color: #333333;
  padding: 2px 6px 2px 6px;
  border-top: 1px solid #CCCCCC;
  border-right: 1px solid #333333;
  border-bottom: 1px solid #333333;
  border-left: 1px solid #CCCCCC;
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
<c:redirect url="/HostClusterList.htm?user_request_action_param=default_action_param&sequenceSaveError=${modelUc.sequenceSaveError}&buyEnterpriseVersionLink=${modelUc.buyEnterpriseVersionLink}&displayUpgradeProductLink=${modelUc.displayUpgradeProductLink}"/>
</c:if>
<c:if test="${modelUc.toolTip=='CREATE_HOST_TIP'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Tip : Enter name of the sequence & click the create sequence button, check <a href="<c:url value="www.qsequence.com/faq.htm#new_sequence"/>"><strong>FAQ - Creating Your First Sequence</strong></a></div>
</c:if>


		<table align="center">
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
		<!-- 
		<tr><td>

	        <form action="HostClusterList.htm" method="post" >
	        	<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="save_cluster_action" />
	        	<table>
					
	        		<tr><td><label for="hostClusterName">Host Cluster Name</label></td>
					<td>
	            		<input id="hostClusterName" name="hostClusterName" type="text" maxlength="100" />
	                </td>
	                </tr>
	                <tr><td><label for="primaryHostName">Primary Host Name</label></td>
						<td>
		            		<input id="primaryHostName" name="primaryHostName" type="text" maxlength="100" />
		                </td>
	                </tr>
	                <tr><td><label for="otherHostNames">Other Host Names</label></td>
						<td>
		            		<input id="otherHostNames" name="otherHostNames" type="text" maxlength="1000" />
		                </td>
	                </tr>
	                <tr><td><label for="hostType">Host Type</label></td>
						<td>
		            		<input id="hostType" name="hostType" type="text" maxlength="100" />
		                </td>
	                </tr>
	                <tr><td><label for="InConnDetails">In-connection details</label></td></tr>
	                <tr>
						<td>
		            		<label for="IpAddress">IpAddress</label><input id="inConnectionIpAddress" name="inConnectionIpAddress" type="text" maxlength="100" />
		            		<label for="Port">Port</label><input id="inConnectionPort" name="inConnectionPort" type="text" maxlength="100" />
		            		<label for="Protocol">Protocol</label><input id="inConnectionProtocol" name="inConnectionProtocol" type="text" maxlength="100" />
		                </td>
	                </tr>
	                <tr><td><label for="OutConnDetails">Out-connection details</label></td></tr>
	                <tr>
						<td>
		            		<label for="IpAddress">IpAddress</label><input id="outConnectionIpAddress" name="outConnectionIpAddress" type="text" maxlength="100" />
		            		<label for="Port">Port</label><input id="outConnectionPort" name="outConnectionPort" type="text" maxlength="100" />
		            		<label for="Protocol">Protocol</label><input id="outConnectionProtocol" name="outConnectionProtocol" type="text" maxlength="100" />
		                </td>
	                </tr>
	                <tr><td><input type="submit" src="/images/login.png" value="Save Cluster"></td></tr>
	        		<tr>
	        		<td colspan="3"><font color="red">${modelUc.sequenceSaveError}
	        		
	        		</font>
	        		</td></tr>
					<tr><td colspan="3">&nbsp;</td></tr>
	        	</table>
	        </form>

        </td>
		</tr>
		 -->
        <tr><td>
		<c:set var="x" value="0" />
        	<table align="center" width="900">
        	<!-- DRAFT sequences -->
        		<c:if test="${modelUc.ucHostClusterMstList[0]!=null}">
	        		<tr height="50px"><td  align="center" colspan = "7" bgcolor="gray" width="100%" ><div style="float:center;width:80%;"><label for="sequenceName">Host Cluster List</label></div><div style="float:right;width:20%;"><a align="right" class="button" href="<c:url value="EditHostCluster.htm?user_request_action_param=prop_menu_new_host"/>">Create New</a></div></td></tr>
	         		<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Cluster Name</label></th><th  bgcolor="#98bf21"><label for="createdDate">Primary Host Name</label></th><th  bgcolor="#98bf21"><label for="share">Other Host Names</label></th><th  bgcolor="#98bf21"><label for="secure">Host Type</label></th><th  bgcolor="#98bf21"><label for="delete">In Connection IpAddress</label></th><th  bgcolor="#98bf21"><label for="delete">Out Connection IpAddress</label></th><th  bgcolor="#98bf21"><label for="delete">Created Date</label></th></tr>
         		</c:if>
         			<c:if test="${modelUc.ucHostClusterMstList[0]==null }">
         			<tr height="50px"><td  align="center" colspan = "7" bgcolor="gray" width="100%" ><div style="float:center;width:80%;"><label for="sequenceName">Host Cluster List</label></div><div style="float:right;width:20%;"><a align="right" class="button" href="<c:url value="EditHostCluster.htm?user_request_action_param=prop_menu_new_host"/>">Create New</a></div></td></tr>
	         		<tr height="50px"><th  bgcolor="#98bf21" width="50%" ><label for="sequenceName">Cluster Name</label></th><th  bgcolor="#98bf21"><label for="createdDate">Primary Host Name</label></th><th  bgcolor="#98bf21"><label for="share">Other Host Names</label></th><th  bgcolor="#98bf21"><label for="secure">Host Type</label></th><th  bgcolor="#98bf21"><label for="delete">In Connection IpAddress</label></th><th  bgcolor="#98bf21"><label for="delete">Out Connection IpAddress</label></th><th  bgcolor="#98bf21"><label for="delete">Created Date</label></th></tr>
	         			<tr style="background-color: #F0F0F0; color: black;">
	         			<td colspan="7"><font color="red">No host clusters found !</font>
						</td>
						</tr>
         			</c:if>
        	<c:if test="${modelUc.ucHostClusterMstList[0]!=null}">
        		
         		<c:forEach items='${modelUc.ucHostClusterMstList}' var="hostCluster">
         		
         		<c:set var="changed" value="false" />
         		<c:if test="${x=='0' && changed=='false'}">
        		<tr style="background-color: #F0F0F0; color: black;">
        			<td><a class="bottom seq-margin yellow-tooltip" href="<c:url value="EditHostCluster.htm?hostId=${hostCluster.hostId}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${hostCluster.description}">${hostCluster.hostClusterName}</a>
					</td>
					<td align="center">${hostCluster.primaryHostName} </td>
					<td align="center">${hostCluster.otherHostNames}</td>
					<td align="center">${hostCluster.hostType}</td>
					<td align="center">${hostCluster.inConnectionIpaddress}</td>
					<td align="center">${hostCluster.outConnectionIpaddress}</td>
					<td align="center">${hostCluster.createdDate}</td>
					<c:set var="changed" value="true" />
					<c:set var="x" value="1" />
        		</tr>
        		</c:if>

         		<c:if test="${x=='1' && changed=='false'}">
        		<tr style="background-color:#E8E8E8; color: black;">
        			<td><a class="bottom seq-margin yellow-tooltip" href="<c:url value="EditHostCluster.htm?hostId=${hostCluster.hostId}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${hostCluster.description}">${hostCluster.hostClusterName}</a>
					</td>
					<td align="center">${hostCluster.primaryHostName} </td>
					<td align="center">${hostCluster.otherHostNames}</td>
					<td align="center">${hostCluster.hostType}</td>
					<td align="center">${hostCluster.inConnectionIpaddress}</td>
					<td align="center">${hostCluster.outConnectionIpaddress}</td>
					<td align="center">${hostCluster.createdDate}</td>
					<c:set var="x" value="0" />
					
        		</tr>
        		</c:if>
        		</c:forEach>
        		</c:if>
        		</table>
        		
        		<!-- END DRAFT sequences -->

       </td>
       </tr> 
	</table>
	<br/><br/><br/><br/><br/>
${modelUc.footerLineBreaks}
<%@ include file="footer.jsp"%>
