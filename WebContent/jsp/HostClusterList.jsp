<%@ include file="header_for_seqdet.jsp"%>
    <script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="jquery/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="jquery/jquery-ui.css">
    <link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
	<link href="css/qSequence-otherPages.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css" />
<link href="css/anirban.css" rel="stylesheet">
<title>Host Cluster List</title>
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
<div class="wrap-navbar">
  <div class="topHeader">
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <div class="navbar-header navbar-left">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><img src="images/logo2.png" alt="" /></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <c:if test="${modelUc.loginSuccessful!='SUCCESSFUL'}">
              <li><a href="<c:url value="/Dashboard.htm" />">Home</a></li>
              <li><a href="<c:url value="/Login.htm" />">Login</a></li>
            </c:if>
            <c:if test="${modelUc.loginSuccessful=='SUCCESSFUL'}">
              <li><a href="<c:url value="/Dashboard.htm" />">Home</a></li>
              <li><a href="<c:url value="/Profile.htm" />">Profile</a></li>
              <c:if test="${modelUc.role=='ADMIN' or modelUc.role=='ENTERPRISE_ARCHITECT' }">
                <li><a href="<c:url value="/Admin.htm" />">Admin</a></li>
              </c:if>
              <li><a href="<c:url value="/Logout.htm" />">Logout</a></li>
            </c:if>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
  </div>
</div>
<div class="container Capabilities">
    <c:if test="${modelUc.status=='SAVED'}">
        <c:redirect url="/HostClusterList.htm?user_request_action_param=default_action_param&sequenceSaveError=${modelUc.sequenceSaveError}&buyEnterpriseVersionLink=${modelUc.buyEnterpriseVersionLink}&displayUpgradeProductLink=${modelUc.displayUpgradeProductLink}"/>
    </c:if>
    <c:if test="${modelUc.toolTip=='CREATE_HOST_TIP'}">
        <div id="tool_tip" class="bubble">
            Tip : Enter name of the sequence & click the create sequence button, check <a href="
            <c:url value="www.qsequence.com/faq.htm#new_sequence"/>
            "><strong>FAQ - Creating Your First Sequence</strong></a>
        </div>
    </c:if>
    <table align="center">
        <tr>
            <td>
                <c:set var="x" value="0" />
                <table align="center" width="1000">
                    <!-- DRAFT sequences -->
                    <c:if test="${modelUc.ucHostClusterMstList[0]!=null}">
                        <tr>
                            <td>
                                <div><label for="sequenceName">Host Cluster List</label></div>
                                <div><a align="right" class="button" href="<c:url value="EditHostCluster.htm?user_request_action_param=prop_menu_new_host"/>">Create New</a></div>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="sequenceName">Cluster Name</label></th>
                            <th><label for="createdDate">Primary Host Name</label></th>
                            <th><label for="share">Other Host Names</label></th>
                            <th><label for="secure">Host Type</label></th>
                            <th><label for="delete">In Connection IpAddress</label></th>
                            <th><label for="delete">Out Connection IpAddress</label></th>
                            <th><label for="delete">Created Date</label></th>
                        </tr>
                    </c:if>
                    <c:if test="${modelUc.ucHostClusterMstList[0]==null }">
                        <tr>
                            <td>
                                <div><label for="sequenceName">Host Cluster List</label></div>
                                <div><a align="right" class="button" href="<c:url value="EditHostCluster.htm?user_request_action_param=prop_menu_new_host"/>">Create New</a></div>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="sequenceName">Cluster Name</label></th>
                            <th><label for="createdDate">Primary Host Name</label></th>
                            <th><label for="share">Other Host Names</label></th>
                            <th><label for="secure">Host Type</label></th>
                            <th><label for="delete">In Connection IpAddress</label></th>
                            <th><label for="delete">Out Connection IpAddress</label></th>
                            <th><label for="delete">Created Date</label></th>
                        </tr>
                        <tr>
                            <td><font color="red">No host clusters found !</font></td>
                        </tr>
                    </c:if>
                    <c:if test="${modelUc.ucHostClusterMstList[0]!=null}">
                        <c:forEach items='${modelUc.ucHostClusterMstList}' var="hostCluster">
                            <c:set var="changed" value="false" />
                            <c:if test="${x=='0' && changed=='false'}">
                                <tr>
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
                                <tr>
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
</div>

${modelUc.footerLineBreaks}
<%@ include file="footer.jsp"%>
