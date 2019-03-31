<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media
queries -->
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
label {
color: gray;
font-weight: bold;
display: block;
width: 150px;
float: left;
}

div.terms {
	width:320px;
	height:300px;
	border:1px solid #ccc;
	background:#f2f2f2;
	padding-top: 15px;
	padding: 0px 40px;
	overflow:auto;
	position: relative;
	top: 20px;
	left: 90px;
}
div.terms p,
div.terms li {font:normal 11px/15px arial;color:#333;}
div.terms h3 {font:bold 14px/19px arial;color:#000;}
div.terms h4 {font:bold 12px/17px arial;color:#000;}
div.terms strong {color:#000;}
.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 3px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>
<title>My Profile</title>
<meta name="description" content="www.qSequence.com My Profile page"> 

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
<c:redirect url="/Profile.htm?successMessage=${modelUc.successMessage}"/>
</c:if>

      <SCRIPT language=JavaScript>
		<!--
		
		//Accept terms & conditions script (by InsightEye www.insighteye.com)
		//Visit JavaScript Kit (http://javascriptkit.com) for this script & more.
		
		function checkCheckBox(f){
			if (f.agree.checked == false )
			{
				alert('Please read and agree to the terms and conditions to continue.');
				return false;
			}else
				return true;
		}
	//-->
	</SCRIPT>
        <form action="Profile.htm" method="post" onsubmit="return checkCheckBox(this)">
<!-- 		<div style="position: fixed; left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6; "> 
		<table align="center" width="100%" style="position: relative; left: 20px;">-->

		<table align="center">
		<tbody>
					<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
		<tr><td colspan="2"><h1>My Profile</h1></td></tr>
		<tr><td>
        	<table border="0" align="right" width="100%" style="position: relative; top: 0px; left: -55px;">
        		<tbody><tr><td width="40%"><label style="width: 200px;" for="userName">Username</label></td><td>&nbsp;</td></tr><!-- 	***NOTE: note if you are allowing user to change these then check if username or email is already used-->
         		<tr><td width="40%"><input id="userName" name="userName" type="text" value="${modelUc.credential.userName}" disabled /></td>
         			<td><font color="red">${modelUc.userNameError}</font></td>
         		</tr>
         		<tr><td width="40%"><label style="width: 200px;" for="userName">Team</label></td><td>&nbsp;</td></tr>
         		<tr><td width="40%"><input id="teamName" name="teamName" type="text" value="${modelUc.credential.userTeamName}" disabled /></td>
         			<td><font color="red">${modelUc.userTeamNameError}</font></td>
         		</tr>
         		<!-- 	***NOTE: note if you are allowing user to change these then check if username or email is already used-->
         		<tr><td width="40%"><label style="width: 200px;" for="userNameEmail">User (Email)</label></td><td>&nbsp;</td></tr>
         		<tr><td width="40%"><input id="userNameEmail" name="userNameEmail" type="text" value="${modelUc.credential.userNameEmail}" disabled /></td>
         			<td><font color="red">${modelUc.userNameEmailError}</font></td>
         		</tr>
         		<!-- 
        		<tr><td width="40%"><label for="password">Create a password</label>*</td>
        			<td><label for="passwordReEntered">Re-enter password</label>*</td>
        		</tr>
        		
        		
         		<tr><td width="40%"><input id="password" name="password" type="password" maxlength="100" value="${modelUc.credential.password}"/></td>
                	<td><input id="passwordReEntered" name="passwordReEntered" type="password" maxlength="100" value="${modelUc.passwordReEntered}"/>
                		<font color="red">${modelUc.passwordError}${modelUc.passwordReEnteredError}</font>
                	</td>
                </tr>
                 -->
        		<tr><td width="40%"><label for="firstName">First Name</label></td><td><label for="firstName">Last Name</label></td>
        		</tr>
        		<tr>
        			<td width="40%"><input id="firstName" name="firstName" type="text" maxlength="40" value="${modelUc.credential.firstName}" /></td>
            		<td><input id="lastName" name="lastName" type="text" maxlength="40" value="${modelUc.credential.lastName}"  /></td>
                </tr>
        		<tr><td width="40%"><label for="phone">Phone number</label></td><td><label for="mobile">Mobile</label></td>
        		</tr>
        		<tr><td width="40%"><input id="phone" name="phone" type="text" maxlength="40"  value="${modelUc.credential.phone}"/></td>
        			<td><input id="mobile" name="mobile" type="text" maxlength="40" value="${modelUc.credential.mobile}"/></td>
        		</tr>
         		
        		<tr><td width="40%"><label for="company">Company</label></td><td>&nbsp;</td></tr>
         		<tr><td width="40%"><input id="company" name="company" type="text" maxlength="100" value="${modelUc.credential.company}"/></td>
         		    <td>&nbsp;</td>
         		</tr>                
        		<tr><td width="40%"><label for="company">Security Question1</label></td><td><label for="company">Security Answer1</label></td></tr>
         		<tr><td width="40%">
		         		 <select id="question1" name="question1">
		         		 <c:forEach items="${modelUc.securityQuestionList}" var="securityQuestion1" >
		         		 	<c:if test="${securityQuestion1 != modelUc.credential.question1}">
						  		<option value="${securityQuestion1}">${securityQuestion1}</option>
						  	</c:if>
						  	<c:if test="${securityQuestion1 == modelUc.credential.question1}">
						  		<option value="${securityQuestion1}" selected="selected">${securityQuestion1}</option>
						  	</c:if>
						  </c:forEach>
						 </select> 
				         		
         			</td>
         		    <td><input id="answer1" name="answer1" type="text" maxlength="50" value="${modelUc.credential.answer1}"/></td>
         		</tr>
         		<tr><td width="40%"><label for="company">Security Question2</label></td><td><label for="company">Security Answer2</label></td></tr>
         		<tr><td width="40%">
         				<select id="question2" name="question2">
		         		 <c:forEach items="${modelUc.securityQuestionList}" var="securityQuestion2" >
		         		 	<c:if test="${securityQuestion2 != modelUc.credential.question2}">
						  		<option value="${securityQuestion2}">${securityQuestion2}</option>
						  	</c:if>
						  	<c:if test="${securityQuestion2 == modelUc.credential.question2}">
						  		<option value="${securityQuestion2}" selected="selected">${securityQuestion2}</option>
						  	</c:if>
						  </c:forEach>
						 </select>
					</td>
         		    <td><input id="answer2" name="answer2" type="text" maxlength="50" value="${modelUc.credential.answer2}"/></td>
         		</tr>
         		<tr><td width="40%"><label for="company">Security Question3</label></td><td><label for="company">Security Answer3</label></td></tr>
         		<tr><td width="40%">
         				<select id="question3" name="question3">
		         		 <c:forEach items="${modelUc.securityQuestionList}" var="securityQuestion3" >
		         		 	<c:if test="${securityQuestion3 != modelUc.credential.question3}">
						  		<option value="${securityQuestion3}">${securityQuestion3}</option>
						  	</c:if>
						  	<c:if test="${securityQuestion3 == modelUc.credential.question3}">
						  		<option value="${securityQuestion3}" selected="selected">${securityQuestion3}</option>
						  	</c:if>
						  </c:forEach>
						 </select>
					</td>
         		    <td><input id="answer3" name="answer3" type="text" maxlength="50" value="${modelUc.credential.answer3}"/></td>
         		</tr>
        		<tr><td colspan="2">
        		<input id="user_request_action_param" name="user_request_action_param" type="hidden" value="save_profile_action" />
				</td></tr>                
				<tr><td colspan="2">  
					<input type="submit" value="Submit form">
				</td></tr>
				
				    
        	</tbody></table>
			</td>			
			</tr>
			</tbody></table>


        </form>
      <br /> <br /> 
		<br /> <br /> 
		<br /> <br /> 
		<br /> <br /> 
<%@ include file="footer.jsp"%>
