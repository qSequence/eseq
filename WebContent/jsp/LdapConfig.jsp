<%@ include file="header_for_seqdet.jsp"%>
<title>Ldap Configuration</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery-ui.css" />">
<link rel="stylesheet" href="<c:url value="/a.css" />"  type="text/css">
<%-- 21Dec 2016 added for the header and navigation --%>
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<%--END 21Dec 2016 added for the header and navigation --%>
<%--  12 Oct added combogrid jquery libraries--%>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
<script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css"/>
<link href="css/anirban.css" rel="stylesheet">


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


$("#team_name_param").combogrid({
	url: 'SearchTeams.htm?system_type_param='+$("#system_type_param").val()+'&action_param=search_with_properties_only',
	colModel: [
	           {'columnName':'teamId','width':'0','label':''},
	           {'columnName':'teamName','width':'50','label':'Team'},
	           {'columnName':'teamDescription','width':'0','label':''}
	           ],
	select: function( event, ui ) {


	$("#team_name_param").val(ui.item.teamName);
	document.getElementById('team_id_param').value="team_"+ui.item.teamId;

	return false;
	}
	});
});
</script>
<script type="text/javascript">
	function addLi(accessText, teamId, access)
	{
		if(access=='PT'){
			accessText+=" - Permanent team";
		}else if(access=='TT'){
			accessText+=" - Temporary team";
		}
		document.getElementById('team_name_param').value="";
//		$("#div_id ul").append('<li><span class="tab">Message Center</span></li>');
		$("#div_id ul").append('<li id="li_'+teamId+'" style="padding-left:10px"><a href="#" onclick="parentNode.parentNode.removeChild(parentNode)"> '+accessText+'<input type="hidden" name="'+teamId+'_'+access+'" value="'+teamId+'_'+access+'" /> </a></li>');
	}
</script>
</head>
<body>
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
            <a class="navbar-brand" href="#"><img src="images/logo2.png" alt=""/></a>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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
        </div>
        <!-- /.container-fluid -->
      </nav>
    </div>
  </div>
  <div id="container" class="container license">
  <c:if test="${modelUc.status=='SAVED'}">
     <c:redirect url="/LdapConfig.htm?message=${modelUc.message}&error=${modelUc.error}"/>
  </c:if>
  <table align="center">
     <tr>
        <td>
           <form id="subscription_order_form" action="LdapConfig.htm" method="post"  >
              <table align="center">
                 <tr>
                    <td>
                      <div class="table-header" style="text-align:center;">
                        <h1>LDAP Configuration</h1>
                        <input type="hidden" name="user_request_action_param" value="save_action"/>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-12">LDAP URI</label>
                        <input class="col-lg-12" type="text" name="ldap_uri" value="${modelUc.ldapUri}" size="30" maxlength="100"/>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-12">Context Factory</label>
                        <input class="col-lg-12" type="text" name="context_factory" value="${modelUc.ldapContextFactory}" size="30" maxlength="100"/>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-12">User CN</label>
                        <input class="col-lg-12" type="text" name="user_cn" value="${modelUc.ldapUserCn}" size="30" maxlength="100"/>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-12">Security Authentication</label>
                        <input class="col-lg-12" type="text" name="security_authentication" value="${modelUc.ldapSecurityAuthentication}" size="30" maxlength="200" />
                      </div>
                      <div class="form-group">
                        <strong><font color="red">${modelUc.message} ${modelUc.error}</font></strong>
                      </div>
                      <div class="form-group">
                        <input class="col-lg-12 btn btn-success btn-raised" type="submit" value="Save" />
                      </div>
                    </td>
                 </tr>
              </table>
           </form>
        </td>
     </tr>
  </table>
	<script type= "text/javascript" src="jquery/bootstrap.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function () {
	        $('a').tooltip();
	    });
	</script>
<%@ include file="footer.jsp"%>
