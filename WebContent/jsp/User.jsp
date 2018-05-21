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
<%-- END 12 Oct added combogrid jquery libraries--%>
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
.bubble{
    background-color: green;
    border-radius: 5px;
    box-shadow: 0px 0px 6px #B2B2B2;
    height: 10px;
    margin: 10px;
	font: 10px sans-serif;
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
<div id="container">
    <c:if test="${modelUc.status=='SAVED'}">
        <c:redirect url="/MyMenu.htm?seq_mst_id_param=${modelUc.seq_mst_id_param}&message=${modelUc.message}&error=${modelUc.error}"/>
    </c:if>
    <table align="center" border="0" width=600>
        <tr>
            <td>
                <input type="hidden" id="team_id_param" name="team_id_param" value="${modelUc.editedUser.teamId}"/>
                <form id="subscription_order_form" action="User.htm" method="post"  >
                    <table align="center" border="0" width=600>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align:left;">
                                <h1>Users</h1>
                            </td>
                            <td style="text-align:right;">&nbsp;<input type="hidden" name="user_request_action_param" value="save_action"/></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="height:50px;text-align:left;">
                            <td ><label>First name </label></td>
                            <td> <input type="text" name="first_name_param" value="${modelUc.editedUser.firstName}" maxlength="100"/><input type="hidden" name="user_id_param" value="${modelUc.editedUser.id}" /></td>
                            <td><label>Last name </label></td>
                            <td> <input type="text" name="last_name_param" value="${modelUc.editedUser.lastName}" maxlength="100"/><input type="submit" value="Save" />
                            </td>
                        </tr>
                        <tr style="height:50px;text-align:left;">
                            <td ><label>Email Address </label> </td>
                            <td><input type="text" name="email_address_param" value="${modelUc.editedUser.userNameEmail}" maxlength="100"/></td>
                            <td><label>Phone </label> </td>
                            <td><input type="text" name="phone_param" value="${modelUc.editedUser.phone}" maxlength="30" />
                            </td>
                        </tr>
                        <tr style="height:50px;text-align:left;">
                            <td ><label>Username </label></td>
                            <td> <input type="text" name="username_param" value="${modelUc.editedUser.userName}" maxlength="100"/></td>
                            <td><label>User type</label></td>
                            <td>
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
                            </td>
                        </tr>
                        <tr style="height:50px;text-align:left;">
                            <td><label>Set Password</label></td>
                            <td colspan="2"> <input type="password" name="password_param" maxlength="100" /></td>
                            <td><label>Source</label></td>
                            <td>
                                <select name="source_param" id="source_param" >
                                    <option value=""></option>
                                    <option value="LDAP" selected>Ldap</option>
                                </select>
                            </td>
                        </tr>
                        <tr style="height:50px;text-align:left;">
                            <td colspan="4" >
                                <div id="div_id" style="overflow:auto;height:300px;width:700px;border: 2px solid grey;">
                                    <table >
                                        <tr>
                                            <td><label><strong>Add Teams</strong></label></td>
                                        </tr>
                                        <tr style="height:50px;text-align:left;">
                                            <td>
                                                <label>Team</label><input type="text" id="team_name_param" name="team_name_param"  maxlength="100" value="${modelUc.editedUser.userTeamName}"/><label>Team type</label>
                                                <select name="access_param" id="access_param" >
                                                    <option value="PT">Permanent team</option>
                                                    <option value="TT">Temporary team</option>
                                                </select>
                                                <button type="button" onclick="addLi(document.getElementById('team_name_param').value, document.getElementById('team_id_param').value, document.getElementById('access_param').value)">Add</button>
                                            </td>
                                        </tr>
                                    </table>
                                    <hr>
                                    <ul id="ul_id" style="width:100%">
                                        <c:forEach items='${modelUc.editedUser.accessList}' var="teamAccess">
                                            <li id="li_${teamAccess.id}" style="padding-left:10px"><a href="#" onclick="parentNode.parentNode.removeChild(parentNode)"> ${teamAccess.accessText }<input type="hidden" name="team_${teamAccess.id}" value="team_${teamAccess.id}_${teamAccess.access}" /> </a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div id="sometext" align="center" ><strong><font color="red">${modelUc.error}</font></strong></div>
                                <div id="sometext" align="center" ><strong>${modelUc.message}</strong></div>
                            </td>
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
    <table align="center" width="700">
        <c:if test="${modelUc.userList[0]!=null}">
            <c:forEach items='${modelUc.userList}' var="user">
                <c:set var="changed" value="false" />
                <c:if test="${x=='0' && changed=='false'}">
                    <tr style="background-color: #F0F0F0; color: black;">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="bottom seq-margin yellow-tooltip" href="<c:url value="User.htm?user_request_action_param=edit_action&user_id_param=${user.id}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${user.userNameEmail}">${user.userName}</a>
                        </td>
                        <td>${user.firstName} ${user.lastName}
                        </td>
                        <td>${user.userTeamName}
                        </td>
                        <td>${user.userType}
                        </td>
                        <td align="center"><a href="<c:url value="User.htm?user_request_action_param=delete_action&user_id_param=${user.id}"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${user.id}'  src="images/delete.png"/></a></td>
                        <c:set var="changed" value="true" />
                        <c:set var="x" value="1" />
                    </tr>
                </c:if>
                <c:if test="${x=='1' && changed=='false'}">
                    <tr style="background-color:#E8E8E8; color: black;">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="bottom seq-margin yellow-tooltip" href="<c:url value="User.htm?user_request_action_param=edit_action&user_id_param=${user.id}"/>"  data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${user.userNameEmail}">${user.userName}</a>
                        </td>
                        <td>${user.firstName} ${user.lastName}
                        </td>
                        <td>${user.userTeamName}
                        </td>
                        <td>${user.userType}
                        </td>
                        <td align="center">
                            <a href="<c:url value="User.htm?user_request_action_param=delete_action&user_id_param=${user.id}"/>" onclick="return confirm('Do you really want to DELETE?')"><img id='${user.id}'  src="images/delete.png"/></a>
                        </td>
                        </td>
                        <c:set var="x" value="0" />
                    </tr>
                </c:if>
            </c:forEach>
        </c:if>
    </table>
    <br /> <br />
    <br /> <br />
    <br /> <br />
    <br /> <br />
    <br /> <br />
    <br /> <br />
    <script type= "text/javascript" src="jquery/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('a').tooltip();
        });
    </script>
</div>

<%@ include file="footer.jsp"%>
