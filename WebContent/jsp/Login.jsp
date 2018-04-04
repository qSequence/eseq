<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Login</title>
<meta name="description" content="Login page">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css" />
<!-- Custom CSS -->
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<link href="css/anirban.css" rel="stylesheet">

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
<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/Dashboard.htm?user_request_action_param=default_action_param"/>
</c:if>

<form action="Login.htm" method="post" onsubmit="return checkCheckBox(this)">
    <div class="loginCenter">
      <h2>Login</h2>
      <div class="row">
        <div class="col-lg-12">
            <div class="form-group">
              <div class="form-control-wrapper">
                <input class="form-control empty" id="userNameEmail" name="userNameEmail" type="text" maxlength="100" value="${modelUc.credential.userNameEmail}">
                <div class="floating-label">User Name</div>
                <span class="material-input"></span>
              </div>
            </div>
            <div class="form-group">
              <div class="form-control-wrapper">
                <input class="form-control empty" id="password" name="password" type="password" maxlength="100" value="${modelUc.credential.password}">
                <div class="floating-label">Password</div>
                <span class="material-input"></span>
              </div>
            </div>
            <div class="form-group">
              <div class="form-control-wrapper">
                    <c:if test="${modelUc.captcha_enabled_param=='true'}">
                      <input id="captcha_enabled_param" name="captcha_enabled_param" type="hidden" value="true" />
                      <label for="reCaptcha">Help us protect from a robot, please enter the characters you see</label>
                        <%
                        ReCaptcha c = ReCaptchaFactory.newSecureReCaptcha("6LevxfMSAAAAADJEweea6gIaRXC3xVoJbOUq54Tq", "6LevxfMSAAAAADM7wLOctC9UhPz9oOk5qsa7FMzz", false);
                        out.print(c.createRecaptchaHtml(null, null));
                        %>
                      <font color="red">${modelUc.reCaptchaError}</font>
                    </c:if>
                    <font color="red">${modelUc.otherLoginError}</font>
                    <input id="user_request_action_param" name="user_request_action_param" type="hidden" value="login_user_action" />
              </div>
            </div>
            <font color="red">${modelUc.loginError}</font>
            <div class="form-group">
              <div class="form-control-wrapper">
                <a class="passforgot" href="<c:url value="/ResetPassword.htm" />">Forgot your password ?</a>
                <button type="submit" class="btn btn-primary" value="Login">Submit</button>
              </div>
            </div>
        </div>
      </div>
    </div>
</form>
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
