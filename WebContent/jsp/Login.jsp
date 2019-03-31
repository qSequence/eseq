<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Login</title>
<meta name="description" content="Login page"> 

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media
queries -->

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
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
<div class="container" style="padding-bottom:190px;">
<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/Dashboard.htm?user_request_action_param=default_action_param"/>
</c:if>

<form action="Login.htm" method="post" onsubmit="return checkCheckBox(this)">
<!--<div style="width: 300px; left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6; ">-->

        	<table align="center">
			<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
									<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
			    <tr><td>&nbsp;</td><td><h1>Login</h1></td>
        			</tr>
        		<tr><td>&nbsp;</td><td><label for="userNameEmail">UserName</label></td>
        			</tr>
         		<tr><td>&nbsp;</td><td>
            		<input id="userNameEmail" name="userNameEmail" type="text" maxlength="100" value="${modelUc.credential.userNameEmail}" />
            		
                </td><td>&nbsp;</td></tr>
        		<tr><td>&nbsp;</td><td><label for="password">Password</label></td>
        		<td>&nbsp;</font></td></tr>
        		<tr><td>&nbsp;</td><td>
            		<input id="password" name="password" type="password" maxlength="100" value="${modelUc.credential.password}"/>
                </td></tr>
         		<tr><td>&nbsp;</td><td colspan="2">
            		<font color="red">${modelUc.loginError}</font>
                </td></tr>
                <c:if test="${modelUc.captcha_enabled_param=='true'}">
                <input id="captcha_enabled_param" name="captcha_enabled_param" type="hidden" value="true" />
        		<tr><td>&nbsp;</td><td><label for="reCaptcha">Help us protect from a robot, please enter the characters you see</label></td>
        			</tr>
         		<tr><td>&nbsp;</td><td>
			        <%
			          ReCaptcha c = ReCaptchaFactory.newSecureReCaptcha("6LevxfMSAAAAADJEweea6gIaRXC3xVoJbOUq54Tq", "6LevxfMSAAAAADM7wLOctC9UhPz9oOk5qsa7FMzz", false);
			          out.print(c.createRecaptchaHtml(null, null));
			        %>
                </td><td><font color="red">${modelUc.reCaptchaError}</font></td></tr>
                </c:if>                
				<tr><td colspan="2"><font color="red">${modelUc.otherLoginError}</font></td></tr>        	
				<tr><td>&nbsp;</td><td>
        		<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="login_user_action" />
				<input type="submit" value="Login">
				
				</td></tr>                
       <tr><td>&nbsp;</td><td><a href="<c:url value="/ResetPassword.htm" />">Forgot your password ?</a></td></tr>
        	</table>
		<!--	</div>-->
        </form>
		</div>
<!-- jQuery -->
<script src="jquery/jquery-otherPages.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="jquery/bootstrap.min-otherPages.js"></script>
<footer id="footerWrapper" class="md-footer">
<section id="mainFooter">
<div class="container">
<div class="row">
<div class="col-lg-6 col-md-6 col-sm-6">
<div class="footerWidget">
<img src="images/logo.png" width="240px" alt="qSequence logo" id="footerLogo">
<p>Enterprise Efficiency Software.&nbsp;
<br>© qSequence&nbsp;2016, All rights reserved</p>
</div>
</div>
</div>
</div>
</section>
</footer>
</body></html>