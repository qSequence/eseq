<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Reset password</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css" />
<!-- Custom CSS -->
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<link href="css/anirban.css" rel="stylesheet">
<style media="screen">
.md-footer {
position: relative !important;
margin-top: 50px;
}
</style>
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
<div class="container" >
  <div class="loginCenter reset-pass">
    <div class="row">
      <div class="col-lg-12">
        <h1>Reset Password</h1>
        <form action="ResetPassword.htm" method="post" onsubmit="return checkCheckBox(this)">
          <div class="form-group">
            <div class="form-control-wrapper">
              <input class="form-control empty" id="userNameEmail" name="userNameEmail" type="text" maxlength="100" value="${modelUc.userNameEmail}">
              <div class="floating-label">User Name</div>
              <span class="material-input"></span>
            </div>
          </div>
          <font color="red">${modelUc.userNameEmailError}</font>
          <!-- Question Answers -->
          <c:if test="${not empty modelUc.credential.question1 and not empty modelUc.credential.question2 and not empty modelUc.credential.question3}">
          <div class="form-group">
            <div class="form-control-wrapper">
              <input class="form-control empty" id="question1" name="question1" size="80" type="text" value="${modelUc.credential.question1}"  />
              <div class="floating-label">Question1</div>
              <span class="material-input"></span>
            </div>
          </div>
          <div class="form-group">
            <div class="form-control-wrapper">
              <input class="form-control empty" id="answer1" name="answer1" type="password" maxlength="100" />
              <div class="floating-label">Answer1</div>
              <span class="material-input"></span>
            </div>
          </div>
          <div class="form-group">
            <div class="form-control-wrapper">
              <input class="form-control empty" id="question2" name="question2" size="80" type="text" value="${modelUc.credential.question2}"/>
              <div class="floating-label">Question2</div>
              <span class="material-input"></span>
            </div>
          </div>
          <div class="form-group">
            <div class="form-control-wrapper">
              <input class="form-control empty" id="answer2" name="answer2" type="password" maxlength="100" />
              <div class="floating-label">Answer2</div>
              <span class="material-input"></span>
            </div>
          </div>
          <div class="form-group">
            <div class="form-control-wrapper">
              <input class="form-control empty" id="question3" name="question3" size="80" type="text" value="${modelUc.credential.question3}"/>
              <div class="floating-label">Question3</div>
              <span class="material-input"></span>
            </div>
          </div>
          <div class="form-group">
            <div class="form-control-wrapper">
              <input class="form-control empty" id="answer3" name="answer3" type="password" maxlength="100" />
              <div class="floating-label">Answer3</div>
              <span class="material-input"></span>
            </div>
          </div>
          <div class="form-group">
            <div class="form-control-wrapper">
              <input class="form-control empty" id="password" name="password" type="password" maxlength="100" />
              <div class="floating-label">Password</div>
              <span class="material-input"></span>
            </div>
          </div>
          <div class="form-group">
            <div class="form-control-wrapper">
              <input class="form-control empty" id="repeatPassword" name="repeatPassword" type="password" maxlength="100" />
              <div class="floating-label">Confirm Password</div>
              <span class="material-input"></span>
            </div>
          </div>
        </c:if>
        <div class="form-group">
          <div class="form-control-wrapper">
            <input class="form-control empty" id="user_request_action_param" name="user_request_action_param" type="hidden" value="reset_password_action" />
            <div class="floating-label"></div>
            <span class="material-input"></span>
          </div>
        </div>
        <div class="form-group">
          <div class="form-control-wrapper">
            <button type="submit" value="Submit form" class="btn btn-primary">Submit</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</div>
<!-- jQuery -->
<script src="jquery/jquery-otherPages.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="jquery/bootstrap.min-otherPages.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/js/material.js"></script>
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
<script src="javascript/anirbanJS.js"></script>
</body></html>
