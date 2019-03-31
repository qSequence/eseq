<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Reset password</title>
<style>

label {
color: gray;
font-weight: bold;
display: block;
width: 150px;
float: left;
}

</style>
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
<div id="container">
<div id="banner">


</div> 

<form action="ResetPassword.htm" method="post" onsubmit="return checkCheckBox(this)">
<!--<div style="position: fixed; left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6; ">-->
        	<table align="center">
				<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
			    <tr><td>&nbsp;</td><td><h1>Reset Password</h1></td></tr>
			    
        		<tr><td><label for="userNameEmail">UserName</label></td>
					<td>
            			<input id="userNameEmail" name="userNameEmail" type="text" maxlength="100" value="${modelUc.userNameEmail}" />
                		<font color="red">${modelUc.userNameEmailError}</font>
                	</td>
                </tr>
                <!-- Question Answers -->
                <c:if test="${not empty modelUc.credential.question1 and not empty modelUc.credential.question2 and not empty modelUc.credential.question3}">
					<tr><td><label for="userNameEmailQuestion1">Question1</label></td><td><input id="question1" name="question1" size="80" type="text" value="${modelUc.credential.question1}"  /></td></tr>
	         		<tr>
	         			<td><label for="userNameEmailQuestion1">Answer1</label></td>
	         			<td><input id="answer1" name="answer1" type="password" maxlength="100" /></td>
	                </tr>
	                <tr><td><label for="userNameEmailQuestion2">Question2</label></td><td><input id="question2" name="question2" size="80" type="text" value="${modelUc.credential.question2}"  /></td></tr>
	         		<tr>
	         			<td><label for="userNameEmailQuestion2">Answer2</label></td>
	         			<td><input id="answer2" name="answer2" type="password" maxlength="100" /></td>
	                </tr>
	                <tr><td><label for="userNameEmailQuestion3">Question3</label></td><td><input id="question3" name="question3" size="80" type="text" value="${modelUc.credential.question3}"  /></td></tr>
	         		<tr>
	         			<td><label for="userNameEmailQuestion3">Answer3</label></td>
	         			<td><input id="answer3" name="answer3" type="password" maxlength="100" /></td>
	                </tr>
	                
	                <!-- Set Password -->
	                <tr><td><label for="password">Password</label></td>
	         			<td>
	            			<input id="password" name="password" type="password" maxlength="100" />
	                	</td>
	                </tr>
	                <tr><td><label for="password">Confirm Password</label></td>
	         			<td>
	            			<input id="repeatPassword" name="repeatPassword" type="password" maxlength="100" />
	                	</td>
	                </tr>
	            </c:if>    
        		<tr><td colspan="2">
        		<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="reset_password_action" />
				<input type="submit" value="Submit form">
<!-- 				<input type="button" value="Exit" onclick="document.location.href='/index.html';"> -->
				</td></tr>                
       
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