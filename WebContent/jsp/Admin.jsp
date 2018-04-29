<%@ include file="include.jsp"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<title>qSequence - Admin</title>
<meta name="description" content="Admin page">

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/qSequence-Login.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css"/>
<link href="css/anirban.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media
queries -->

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

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
<div class="container admin" id="md-frame1" style="padding-top:100px;padding-bottom:190px;">
<c:if test="${modelUc.role=='ADMIN' or modelUc.role=='ENTERPRISE_ARCHITECT' }">
    <div class="buttons-nav">
      <div class="row">
          <div class="col-lg-12">
            <div class="bs-component">
              <ul class="nav nav-pills nav-stacked" style="max-width: 300px;">
                <li><a class="button" href="<c:url value="/User.htm" />">Users</a></li>
                <li><a class="button" href="<c:url value="/Team.htm" />">Teams</a></li>
                <li><a class="button" href="<c:url value="/Category.htm" />">Categories</a></li>
                <li><a class="button" href="<c:url value="/MyMenu.htm" />">Setup Menu</a></li>
                <li><a class="button" href="<c:url value="/LdapConfig.htm" />">LDAP configuration</a></li>
              </ul>
            </div>
          </div>
      </div>
    </div>
				<c:if test="${modelUc.currentCustomerSubscription!=null}">
<table align="center">
					<tr style="height:50px;"><td ><b><h4>Current License details</h4></b>  <a class="button" href="<c:url value="/License.htm" />">Upgrade/Downgrade</a><font color="red">${modelUc.error}</font></td></tr>

					<tr><td><hr></td></tr>
					<tr style="height:50px;"><td><b>Product key : ${modelUc.currentCustomerSubscription.productKey}</b></td></tr>
					<tr style="height:50px;"><td><b>Customer Id : ${modelUc.currentCustomerSubscription.customerId}</b></td></tr>
					<tr style="height:50px;"><td><b>Downgrade key : ${modelUc.currentCustomerSubscription.downgradeKey}</b></td></tr>
					<tr style="height:50px;"><td><b>Number of users : ${modelUc.currentProductFeature.featureValue}</b></td></tr>
					<tr style="height:50px;"><td><b>Subscription started : <fmt:formatDate value="${modelUc.currentCustomerSubscription.startDate}" pattern="MMM-yyyy" /></b></td></tr>
					<c:if test="${modelUc.currentCustomerSubscription.licenseType=='trial'}">
						<tr style="height:50px;"><td><b>License type : Trial Subscription</b></td></tr>
					</c:if>
					<c:if test="${modelUc.currentCustomerSubscription.licenseType!='trial'}">
						<tr style="height:50px;"><td><b>License type : Subscription</b></td></tr>
					</c:if>
</table>
				</c:if>
</c:if>
</div>

</body></html>
