<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>License</title>

<meta name="description" content="qSequence License"> 

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
label {
color: gray;
font-weight: bold;
display: block;
width: 150px;
float: left;
}
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
<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/ViewSequenceList.htm?user_request_action_param=default_action_param"/>
</c:if>
<div id="container">
<form action="License.htm" method="post" onsubmit="return checkCheckBox(this)"  style="position: relative; left: -50px; top: -10px;">
<!--<div style="width: 300px; left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6; ">-->

        	<table align="center">
			<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
									<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
			    
        		<c:if test="${modelUc.userRequestAction!='requireConfirmation'}">
	        		<tr><td colspan="2"><h1>Setup your new License</h1></td>
	        			</tr>	
									<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
	        		<tr><td colspan="2"><label for="userNameEmail">Update New Product Key</label></td></tr>
	         		<tr><td colspan="2"><input id="productKey" name="productKey" type="text" maxlength="500" /></td></tr>
	                <tr><td colspan="2"  width="300">
        		<input id="userRequestAction" name="userRequestAction" type="hidden" value="requireConfirmation" />
				<input type="submit" value="Submit"><font color="red">${modelUc.error}${modelUc.loginError}${modelUc.message}</font>
				
				</td></tr>
        		</c:if>
        		<c:if test="${modelUc.userRequestAction=='requireConfirmation'}">
        			<tr><td>&nbsp;</td><td><h1>Your License details</h1></td></tr>
        			<tr><td colspan="2" align="center"><b>${modelUc.message}</b></td></tr>
        			<input id="userRequestAction" name="userRequestAction" type="hidden" value="confirmation" />
        			<input id="productKey" name="productKey" type="hidden" value="${modelUc.productKey}" />
					<tr><td>&nbsp;</td><td><input type="submit" value="Submit"><font color="red">${modelUc.error}${modelUc.loginError}</font></td></tr>
        		</c:if>

        		<tr><td colspan="2"><hr></td></tr>
				<tr style="height:50px;"><td ><b><h4>Current License details</h4></b></td><td><a class="button" target="_blank" href="<c:url value="https://www.qsequence.com/Pricing.htm" />">Upgrade software - get new product key</a></td></tr>
        		<tr style="height:50px;"><td colspan="2"><b>Product key : ${modelUc.currentCustomerSubscription.productKey}</b></td></tr>
					<tr style="height:50px;"><td colspan="2"><b>Customer Id : ${modelUc.currentCustomerSubscription.customerId}</b></td></tr>
					<tr style="height:50px;"><td colspan="2"><b>Downgrade key : ${modelUc.currentCustomerSubscription.downgradeKey}</b></td></tr>
					<tr style="height:50px;"><td colspan="2"><b>Number of users : ${modelUc.currentProductFeature.featureValue}</b></td></tr>
					<tr style="height:50px;"><td colspan="2"><b>Subscription started : <fmt:formatDate value="${modelUc.currentCustomerSubscription.startDate}" pattern="MMM-yyyy" /></b></td></tr>
					
					<c:if test="${modelUc.currentCustomerSubscription.licenseType=='trial'}">
						<tr style="height:50px;"><td colspan="2"><b>License type : Trial Subscription</b></td></tr>
					</c:if>
					<c:if test="${modelUc.currentCustomerSubscription.licenseType!='trial'}">
						<tr style="height:50px;"><td colspan="2"><b>License type : Subscription</b></td></tr>
					</c:if>
				<tr><td colspan="2"><hr></td></tr>	
         	
        	</table>
		<!--	</div>-->
        </form>
		<br /> <br /> 
		<br /> <br /> 
		<br /> <br /> 
		<br /> <br /> 
		<br /> <br /> 
		<br /> <br /> 		
<%@ include file="footer.jsp"%>

