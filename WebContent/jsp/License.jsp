<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>License</title>

<meta name="description" content="qSequence License">

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/qSequence-Login.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css"/>
<link href="css/anirban.css" rel="stylesheet">

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
<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/ViewSequenceList.htm?user_request_action_param=default_action_param"/>
</c:if>
<div id="container" class="container license">
<form action="License.htm" method="post" onsubmit="return checkCheckBox(this)">
   <table align="center">
      <c:if test="${modelUc.userRequestAction!='requireConfirmation'}">
         <tr>
            <td>
              <div class="table-header" style="text-align:center;">
                <h1>Setup your new License</h1>
              </div>
              <div class="form-group">
                <label class="control-label">>Update New Product Key</label>
                <input class="col-lg-12" id="productKey" name="productKey" type="text" maxlength="500"/>
              </div>
              <div class="form-group">
                <input id="userRequestAction" name="userRequestAction" type="hidden" value="requireConfirmation" />
                <input class="col-lg-12" type="submit" value="Submit">
                <font class="col-lg-12" color="red">${modelUc.error}${modelUc.loginError}${modelUc.message}</font>
              </div>
            </td>
         </tr>
      </c:if>
      <c:if test="${modelUc.userRequestAction=='requireConfirmation'}">
         <tr>
            <td>
               <h1>Your License details</h1>
            </td>
         </tr>
         <tr>
            <td align="center"><b>${modelUc.message}</b></td>
         </tr>
         <input id="userRequestAction" name="userRequestAction" type="hidden" value="confirmation" />
         <input id="productKey" name="productKey" type="hidden" value="${modelUc.productKey}" />
         <tr>
            <td><input type="submit" value="Submit"><font color="red">${modelUc.error}${modelUc.loginError}</font></td>
         </tr>
      </c:if>
      <tr>
         <td>
            <hr>
         </td>
      </tr>
      <tr>
         <td >
            <b>
               <h4>Current License details</h4>
            </b>
         </td>
         <td>
            <a class="button" target="_blank" href="
            <c:url value="https://www.qsequence.com/Pricing.htm" />
            ">Upgrade software - get new product key</a>
         </td>
      </tr>
      <tr>
         <td><b>Product key : ${modelUc.currentCustomerSubscription.productKey}</b></td>
      </tr>
      <tr>
         <td><b>Customer Id : ${modelUc.currentCustomerSubscription.customerId}</b></td>
      </tr>
      <tr>
         <td><b>Downgrade key : ${modelUc.currentCustomerSubscription.downgradeKey}</b></td>
      </tr>
      <tr>
         <td><b>Number of users : ${modelUc.currentProductFeature.featureValue}</b></td>
      </tr>
      <tr>
         <td>
            <b>
               Subscription started :
               <fmt:formatDate value="${modelUc.currentCustomerSubscription.startDate}" pattern="MMM-yyyy" />
            </b>
         </td>
      </tr>
      <c:if test="${modelUc.currentCustomerSubscription.licenseType=='trial'}">
         <tr>
            <td><b>License type : Trial Subscription</b></td>
         </tr>
      </c:if>
      <c:if test="${modelUc.currentCustomerSubscription.licenseType!='trial'}">
         <tr>
            <td><b>License type : Subscription</b></td>
         </tr>
      </c:if>
   </table>
</form>
</div>
<%@ include file="footer.jsp"%>
