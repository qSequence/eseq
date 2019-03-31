<%@ include file="include.jsp"%>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="content-type" content="text/html;charset=UTF-8">
  <title>qSequence</title>
  <meta name="description" content="Index page">

  <!-- Bootstrap Core CSS -->
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
  /* ---- reset ---- */
body {
 margin: 0;
 font: normal 75% Arial, Helvetica, sans-serif;
}
canvas {
 display: block;
 vertical-align: bottom;
} 
#particles-js {
 position: absolute;
 width: 100%;
 height: 100%;
 background-color: #0c200b;
 background-image: url("");
 background-repeat: no-repeat;
 background-size: cover;
 background-position: 50% 50%;
}
.count-particles {
 background: #000022;
 position: absolute;
 top: 48px;
 left: 0;
 width: 80px;
 color: #13e8e9;
 font-size: 0.8em;
 text-align: left;
 text-indent: 4px;
 line-height: 14px;
 padding-bottom: 2px;
 font-family: Helvetica, Arial, sans-serif;
 font-weight: bold;
}
.js-count-particles {
 font-size: 1.1em;
}
#stats,
.count-particles {
 -webkit-user-select: none;
 margin-top: 5px;
 margin-left: 5px;
}
#stats {
 border-radius: 3px 3px 0 0;
 overflow: hidden;
}
.count-particles {
 border-radius: 0 0 3px 3px;
}

</style>
</head>
<body class="homeBG">
<div id="particles-js"></div>
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
    <script src="http://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script src="javascript/anirbanJS.js"></script>

</body>
</html>
