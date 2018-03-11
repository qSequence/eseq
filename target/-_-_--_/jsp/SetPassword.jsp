<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<title>Set password</title>
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
label {
color: gray;
font-weight: bold;
display: block;
width: 150px;
float: left;
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
<div id="container">

<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/ViewSequenceList.htm?sequenceSaveError=${modelUc.successMessage}"/>
</c:if>
<c:if test="${modelUc.status=='ERROR'}">
<c:redirect url="/SetPassword.htm?userNameEmail=${modelUc.credential.userNameEmail}&successMessage=${modelUc.successMessage}&userNameEmailError=${modelUc.userNameEmailError}&tempPasswordError=${modelUc.tempPasswordError}&passwordError=${modelUc.passwordError}&passwordReEnteredError=${modelUc.passwordReEnteredError}"/>
</c:if>
<form action="SetPassword.htm" method="post" onsubmit="return checkCheckBox(this)">
<!--<div style="position: fixed; left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6; ">-->
        	<table align="center">
				<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
			    <tr><td colspan="2"><h1>Set Password</h1></td></tr>
               <tr><td colspan="2"><font color="red">${modelUc.successMessage}</font></td></tr>
        		<tr><td><label for="userNameEmail">UserName</label></td>
        		<c:if test="${modelUc.loginSuccessful!='SUCCESSFUL'}">
					<td><input id="userNameEmail" name="userNameEmail" type="text" maxlength="100" value="${modelUc.credential.userNameEmail}" />*&nbsp;<font color="red">${modelUc.userNameEmailError}</font></td>
				</c:if>
				<c:if test="${modelUc.loginSuccessful=='SUCCESSFUL'}">
					<td><input id="userNameEmailDisplay" name="userNameEmailDisplay" type="text" maxlength="100" value="${modelUc.credential.userNameEmail}" disabled />
					<input id="userNameEmail" name="userNameEmail" type="hidden" maxlength="100" value="${modelUc.credential.userNameEmail}" />
					&nbsp;<font color="red">${modelUc.userNameEmailError}</font></td>
				</c:if>
				</tr>
				<c:if test="${modelUc.loginSuccessful!='SUCCESSFUL'}">
        		<tr><td><label for="tempPassword">Enter temperory password</label></td>
					<td><input id="tempPassword" name="tempPassword" type="password" maxlength="100"/>*&nbsp;<font color="red">${modelUc.tempPasswordError}</font></td>
				</tr>
				</c:if>
                <tr><td><label for="password">Enter new password</label></td>
					<td><input id="password" name="password" type="password" maxlength="100" value="${modelUc.credential.password}"/>*&nbsp;<font color="red">${modelUc.passwordError}</font></td>
				</tr>
        		<tr><td><label for="passwordReEntered">Reenter new password</label></td>
					<td><input id="passwordReEntered" name="passwordReEntered" type="password" maxlength="100" value="${modelUc.passwordReEntered}"/>*&nbsp;<font color="red">${modelUc.passwordReEnteredError}</font></td>
				</tr>
                
                <c:if test="${modelUc.captcha_enabled_param=='true' and modelUc.loginSuccessful!='SUCCESSFUL'}">
                <input id="captcha_enabled_param" name="captcha_enabled_param" type="hidden" value="true" />
        		<tr><td colspan="2"><label for="reCaptcha">Help us protect from a robot, please enter the characters you see</label></td></tr>
         		<tr><td>
			        <%
			          ReCaptcha c = ReCaptchaFactory.newSecureReCaptcha("6LevxfMSAAAAADJEweea6gIaRXC3xVoJbOUq54Tq", "6LevxfMSAAAAADM7wLOctC9UhPz9oOk5qsa7FMzz", false);
			          out.print(c.createRecaptchaHtml(null, null));
			        %>*
                    </td>
                    <td>
                       <font color="red">${modelUc.reCaptchaError}</font>
                    </td>
               </tr>
               </c:if>                

        	   <tr><td colspan="2">
        	          <input id="user_request_action_param" name="user_request_action_param" type="hidden" value="set_password_action" />
				      <input type="submit" value="Submit form">
				      
				   </td>
			   </tr>                
       
        	</table>
			<!--</div>-->
        </form>
      <br /> <br /> 
		<br /> <br /> 
      <br /> <br /> 
		<br /> <br /> 
      <br /> <br /> 
		<br /> <br /> 		
<%@ include file="footer.jsp"%>