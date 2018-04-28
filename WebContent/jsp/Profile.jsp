<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css"/>
<link href="css/anirban.css" rel="stylesheet">
<title>My Profile</title>
<meta name="description" content="www.qSequence.com My Profile page">

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
<div id="container" class="container profile">
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
      <table style="margin: 0px auto;width: 660px;">
         <tbody>
            <tr>
               <td>
                  <div class="table-header">
                    <h1>My Profile</h1>
                  </div>
               </td>
            </tr>
            <tr>
              <td>
                <div class="form-group">
                  <div class="col-lg-12">
                    <label class="control-label" for="userName">Username</label>
                    <input id="userName" class="col-lg-12" name="userName" type="text" value="${modelUc.credential.userName}" disabled />
                    <font color="red">${modelUc.userNameError}</font>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                    <label class="control-label" for="userName">Team</label>
                    <input id="teamName" class="col-lg-12" name="teamName" type="text" value="${modelUc.credential.userTeamName}" disabled />
                    <font color="red">${modelUc.userTeamNameError}</font>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                    <label class="control-label" for="userNameEmail">User (Email)</label>
                    <input id="userNameEmail" class="col-lg-12" name="userNameEmail" type="text" value="${modelUc.credential.userNameEmail}" disabled />
                    <font color="red">${modelUc.userNameEmailError}</font>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                    <label class="control-label" for="firstName">First Name</label>
                    <input id="firstName" class="col-lg-12" name="firstName" type="text" maxlength="40" value="${modelUc.credential.firstName}" />
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                    <label class="control-label" for="firstName">Last Name</label>
                    <input id="lastName" class="col-lg-12" name="lastName" type="text" maxlength="40" value="${modelUc.credential.lastName}"  />
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                    <label class="control-label" for="phone">Phone number</label>
                    <input class="col-lg-12" id="phone" name="phone" type="text" maxlength="40"  value="${modelUc.credential.phone}"/>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                    <label class="control-label" for="mobile">Mobile</label>
                    <input class="col-lg-12" id="mobile" name="mobile" type="text" maxlength="40" value="${modelUc.credential.mobile}"/>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                    <label class="control-label" for="company">Company</label>
                    <input class="col-lg-12" id="company" name="company" type="text" maxlength="100" value="${modelUc.credential.company}"/>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-6">
                      <label for="company" class="control-label">Security Question1</label>
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
                  </div>
                  <div class="col-lg-6">
                      <label for="company" class="control-label">Security Answer1</label>
                      <input class="col-lg-12" id="answer1" name="answer1" type="text" maxlength="50" value="${modelUc.credential.answer1}"/>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-6">
                      <label class="control-label" for="company">Security Question2</label>
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
                  </div>
                  <div class="col-lg-6">
                      <label class="control-label" for="company">Security Answer2</label>
                      <input class="col-lg-12" id="answer2" name="answer2" type="text" maxlength="50" value="${modelUc.credential.answer2}"/>
                  </div>
                </div>

                <div class="form-group">
                  <div class="col-lg-6">
                      <label class="control-label" for="company">Security Question3</label>
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
                  </div>
                  <div class="col-lg-6">
                      <label class="control-label" for="company">Security Answer3</label>
                      <input class="col-lg-12" id="answer3" name="answer3" type="text" maxlength="50" value="${modelUc.credential.answer3}"/>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                    <input id="user_request_action_param" name="user_request_action_param" type="hidden" value="save_profile_action" />
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-lg-12">
                    <input class="btn btn-success btn-raised" type="submit" value="Submit form">
                  </div>
                </div>
              </td>
            </tr>
         </tbody>
      </table>
   </form>
</div>

<%@ include file="footer.jsp"%>
