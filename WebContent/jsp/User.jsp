<%@ include file="header_for_seqdet.jsp"%>
<title>Users</title>
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
  <div id="container" class="container user">
     <c:if test="${modelUc.status=='SAVED'}">
        <c:redirect url="/MyMenu.htm?seq_mst_id_param=${modelUc.seq_mst_id_param}&message=${modelUc.message}&error=${modelUc.error}"/>
     </c:if>

		 <table align="center" width="100%">
         <tr>
             <td>
                 <input type="hidden" id="team_id_param" name="team_id_param" value="${modelUc.editedUser.teamId}"/>
                 <form id="subscription_order_form" action="User.htm" method="post"  >
                     <table align="center"  width="100%">
                         <tr>
													 <div class="table-header">
														 	<h1>Users</h1>
															<input type="hidden" name="user_request_action_param" value="save_action"/>
													 </div>
                         </tr>
                         <tr>
														 <div class="form-group">
					                       <label class="control-label">First name</label>
					                       <input type="text" name="first_name_param" value="${modelUc.editedUser.firstName}" maxlength="100"/><input type="hidden" name="user_id_param" value="${modelUc.editedUser.id}" />
					                   </div>
														 <div class="form-group">
					                       <label class="control-label">Last name</label>
					                       <input type="text" name="last_name_param" value="${modelUc.editedUser.lastName}" maxlength="100"/>
					                   </div>
														 <div class="form-group">
					                       <label class="control-label">Email Address</label>
					                       <input type="text" name="email_address_param" value="${modelUc.editedUser.userNameEmail}" maxlength="100"/>
					                   </div>
														 <div class="form-group">
					                       <label class="control-label">Phone</label>
					                       <input type="text" name="phone_param" value="${modelUc.editedUser.phone}" maxlength="30" />
					                   </div>
														 <div class="form-group">
					                       <label class="control-label">Username</label>
					                       <input type="text" name="username_param" value="${modelUc.editedUser.userName}" maxlength="100"/>
					                   </div>
														 <div class="form-group">
					                       <label class="control-label">User type</label>
																 <select name="user_type_param" id="user_type_param" >
                                     <option value=""></option>
                                     <c:if test="${modelUc.editedUser.userType=='ADMIN'}">
                                         <option value="ADMIN" selected>Admin</option>
                                     </c:if>
                                     <c:if test="${modelUc.editedUser.userType=='ENTERPRISE_ARCHITECT'}">
                                         <option value="ENTERPRISE_ARCHITECT"  selected>Enterprise Architect</option>
                                     </c:if>
                                     <c:if test="${modelUc.editedUser.userType=='DELETED'}">
                                         <option value="DELETED" selected>Deleted</option>
                                     </c:if>
                                     <c:if test="${modelUc.editedUser.userType!='ADMIN'}">
                                         <option value="ADMIN">Admin</option>
                                     </c:if>
                                     <c:if test="${modelUc.editedUser.userType!='ENTERPRISE_ARCHITECT'}">
                                         <option value="ENTERPRISE_ARCHITECT">Enterprise Architect</option>
                                     </c:if>
                                     <c:if test="${modelUc.editedUser.userType!='DELETED'}">
                                         <option value="DELETED">Deleted</option>
                                     </c:if>
                                 </select>
					                   </div>
														 <div class="form-group">
					                       <label class="control-label">Set Password</label>
					                       <input type="password" name="password_param" maxlength="100" />
					                   </div>
														 <div class="form-group">
					                       <label class="control-label">Source</label>
																 <select name="source_param" id="source_param" >
                                     <c:if test="${modelUc.ldapConfig=='false'}">
                                     	<option value="" selected></option>
	                                    <option value="LDAP">Ldap</option>
	                                 </c:if>
                                     <c:if test="${modelUc.ldapConfig=='true'}">
	                                     <option value="LDAP" selected>Ldap</option>
	                                     <option value=""></option>
	                                 </c:if>
                                 </select>
					                   </div>
                         </tr>
                         <tr>
                             <td>
															 <div class="jumbotron">
																	 <div id="div_id">
	 																		<table width="100%">
	 																				<tr>
	 																						<td><h3><strong>Add Teams</strong></h3></td>
	 																				</tr>
	 																				<tr>
	 																						<td>
																									<div class="form-group">
										 					                       <label class="control-label">Team</label>
										 					                       <input type="text" id="team_name_param" name="team_name_param"  maxlength="100" value="${modelUc.editedUser.userTeamName}"/>
										 					                   	</div>
																									<div class="form-group">
										 					                       <label class="control-label">Team type</label>
																										 <select name="access_param" id="access_param" >
	 	 																										<option value="PT">Permanent team</option>
	 	 																										<option value="TT">Temporary team</option>
	 	 																								</select>
										 					                   	</div>
																									<div class="form-group">
																											<button class="btn btn-info btn-raised" type="button" onclick="addLi(document.getElementById('team_name_param').value, document.getElementById('team_id_param').value, document.getElementById('access_param').value)">Add</button>
																									</div>
	 																						</td>
	 																				</tr>
	 																		</table>
	 																		<hr>
	 																		<ul id="ul_id" style="width:100%">
	 																				<c:forEach items='${modelUc.editedUser.accessList}' var="teamAccess">
	 																						<li id="li_${teamAccess.id}"><a href="#" onclick="parentNode.parentNode.removeChild(parentNode)"> ${teamAccess.accessText }<input type="hidden" name="team_${teamAccess.id}" value="team_${teamAccess.id}_${teamAccess.access}" /> </a></li>
	 																				</c:forEach>
	 																		</ul>
	 																</div>
															 </div>
                             </td>
                         </tr>
                         <tr>
                             <td>
                                 <div id="sometext" align="center" ><strong><font color="red">${modelUc.error}</font></strong></div>
                                 <div id="sometext" align="center" ><strong>${modelUc.message}</strong></div>
                             </td>
                         </tr>
												 <tr>
												 		<td><input style="width: 100%;" class="btn btn-success btn-raised" type="submit" value="Save" /></td>
												 </tr>
                     </table>
                 </form>
             </td>
         </tr>
         <tr>
             <td></td>
         </tr>
     </table>
     <c:set var="x" value="0" />
     <div class="row">
        <div class="col-lg-12">
          <table class="table-striped table-hover">
             <c:if test="${modelUc.userList[0]!=null}">
                <c:forEach items='${modelUc.userList}' var="user">
                   <c:set var="changed" value="false" />
                   <c:if test="${x=='0' && changed=='false'}">
                      <tr>
                         <td>
                            <a class="bottom seq-margin yellow-tooltip" href="<c:url value="User.htm?user_request_action_param=edit_action&user_id_param=${user.id}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${user.userNameEmail}">${user.userName}</a>
                         </td>
                         <td>${user.firstName} ${user.lastName}
                         </td>
                         <td>${user.userTeamName}
                         </td>
                         <td>${user.userType}
                         </td>
                         <td align="center"><a href="<c:url value="User.htm?user_request_action_param=delete_action&user_id_param=${user.id}"/>" onclick="return confirm('Do you really want to DELETE?')"><i class="mdi-action-delete"></i></a></td>
                         <c:set var="changed" value="true" />
                         <c:set var="x" value="1" />
                      </tr>
                   </c:if>
                   <c:if test="${x=='1' && changed=='false'}">
                      <tr>
                         <td>
                            <a class="bottom seq-margin yellow-tooltip" href="<c:url value="User.htm?user_request_action_param=edit_action&user_id_param=${user.id}"/>"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${user.userNameEmail}">${user.userName}</a>
                         </td>
                         <td>${user.firstName} ${user.lastName}
                         </td>
                         <td>${user.userTeamName}
                         </td>
                         <td>${user.userType}
                         </td>
                         <td align="center">
                            <a href="<c:url value="User.htm?user_request_action_param=delete_action&user_id_param=${user.id}"/>" onclick="return confirm('Do you really want to DELETE?')"><i class="mdi-action-delete"></i></a>
                         </td>
                         </td>
                         <c:set var="x" value="0" />
                      </tr>
                   </c:if>
                </c:forEach>
             </c:if>
          </table>

        </div>
     </div>




  </div>

	<script type= "text/javascript" src="jquery/bootstrap.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function () {
	        $('a').tooltip();
	    });
	</script>
<%@ include file="footer.jsp"%>
