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
.button {
    background-color: gray;
    border: none;
    color: black;
    padding: 3px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    width: 300px;
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
<div class="container" id="md-frame1" style="padding-top:100px;padding-bottom:190px;">
<c:if test="${modelUc.role=='ADMIN' or modelUc.role=='ENTERPRISE_ARCHITECT' }">
<table align="center" >
        <tr><td><a class="button" href="<c:url value="/User.htm" />">Users</a></td></tr>
        <tr><td><a class="button" href="<c:url value="/Team.htm" />">Teams</a></td></tr>
        <tr><td><a class="button" href="<c:url value="/Category.htm" />">Categories</a></td></tr>
        <tr><td><a class="button" href="<c:url value="/MyMenu.htm" />">Setup Menu</a></td></tr>
        <tr><td><a class="button" href="<c:url value="/LdapConfig.htm" />">LDAP configuration</a></td></tr>
        <tr><td><hr></td></tr>
</table>
        
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

