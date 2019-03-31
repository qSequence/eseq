<%@ include file="header_for_seqdet.jsp"%>
<title>Installation Completed</title>
<meta name="description" content="qSequence contact"> 

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
<div class="container" id="md-frame1" style="padding-bottom:400px;">

		<br>

		<br>
		<h4 align="center">Configuration completed successfully! Login to start using qSequence!!</h4>
</div>
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
<p>Enterprise Efficiency Software in the cloud.&nbsp;
<br>© qSequence&nbsp;2016, All rights reserved</p>
</div>
</div>
<div class="col-lg-2 col-md-2 col-sm-6 text-left">
<div class="footerWidget">
<h3>Quicklinks</h3>
<ul class="list-unstyled">
<li>
<a href="www.qsequence.com/faq.htm">FAQ</a>
</li>
<li>
<a href="www.qsequence.com/Contact.htm">Contact us</a>
</li>
</ul>
</div>
</div>
<div class="col-lg-2 col-md-2 col-sm-6">
<div class="footerWidget">
<h3>qSequence</h3>
<ul class="list-unstyled">
<li>
<a href="GlobalViewSequenceList.htm">Examples</a>
</li>
<li>
<a href="Contact.htm">Request Demo</a>
</li>
</ul>
</div>
</div>
<div class="col-lg-2 col-md-2 col-sm-6">
<div class="footerWidget">
<h3>Legals</h3>
<ul class="list-unstyled">
<li>
<a href="PrivacyPolicy.htm">Privacy Policy</a>
</li>
<li>
<a href="TermsAndConditions.htm">Terms &amp; Conditions</a>
</li>
<li>
<a href="LegalStatement.htm">Legal Statement</a>
</li>
</ul>
</div>
</div>
</div>
</div>
</section>
</footer>
</body></html>
