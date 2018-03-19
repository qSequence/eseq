<%@ include file="include.jsp"%>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8">
  <title>qSequence</title>
  <meta name="description" content="Index page">

  <!-- Bootstrap Core CSS -->
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
  <link href="css/bootstrap.css" rel="stylesheet">
  <link href="css/anirban.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="css/qSequence-Login.css" rel="stylesheet">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media
  queries -->

  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
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
</style>
</head>
<body class="homeBG">
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
    <div class="wrap-content">
      <div class="home-cont">
        <div class="wrap-item">
          <h1 align="center">Welcome to qSequence</h1>
          <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis </p>
        </div>
      </div>
    </div>
    <!-- jQuery -->
    <script src="jquery/jquery-otherPages.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="jquery/bootstrap.min-otherPages.js"></script>
    <%-- <footer id="footerWrapper" class="md-footer">
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
</footer> --%>
</body>
</html>
