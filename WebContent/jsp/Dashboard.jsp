<%@ include file="header_for_seqdet.jsp"%>
    <script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="jquery/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="jquery/jquery-ui.css">
    <link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/a.css" />"  type="text/css">
<%--  12 Oct added combogrid jquery libraries--%>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
<script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>
<link href="css/anirban.css" rel="stylesheet">
<%-- END 12 Oct added combogrid jquery libraries--%>
<title>Dashboard</title>
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
<div class="container">
<h1 style="font-size:43px;color: green;" align="center">Dashboard</h1>
<c:if test="${modelUc.demoDB=='derby'}">
<div id="tool_tip" class="bubble" style="width:500px;height:60px;">Note : You are using evaluation and demonstration purpose derrby database. Change to your own <a href="<c:url value="Install.htm"/>">database</a></div>
</c:if>
<div class="main">
<a style="display:block" href="<c:url value="ViewSequenceList.htm"/>">
<div class="sequences_div" style="background-color:${modelUc.divcolor1}">
	<h1>${modelUc.sequencesCreated}</h1>
	<h4>Sequences created</h4>
<p>
	<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${modelUc.seqId1}&sequenceVersion=${modelUc.seqVer1}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${modelUc.seqDesc1}"> ${modelUc.seqName1}</a> ${modelUc.seqElapsedTime1}
</p>
<p>
	<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${modelUc.seqId2}&sequenceVersion=${modelUc.seqVer2}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${modelUc.seqDesc2}">${modelUc.seqName2}</a> ${modelUc.seqElapsedTime2}
</div>
</p>
</a>
<a style="display:block" href="<c:url value="LearnedCapabilities.htm?user_request_action_param=LearnedCapabilities"/>">
<div class="capabilities_div" style="background-color:${modelUc.divcolor2}">
	<h1>${modelUc.capabilitiesLearnt}</h1>
	<h4>Learned Capabilities</h4>
<p>	<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${modelUc.sysSeqId1}&sequenceVersion=${modelUc.sysSeqVer1}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${modelUc.sysSeqDesc1}"> ${modelUc.sysSeqName1}</a> ${modelUc.sysSeqElapsedTime1}
</p><p>
	<a class="bottom seq-margin yellow-tooltip" href="<c:url value="SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${modelUc.sysSeqId2}&sequenceVersion=${modelUc.sysSeqVer2}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${modelUc.sysSeqDesc2}">${modelUc.sysSeqName2}</a> ${modelUc.sysSeqElapsedTime2}
</p>
</div>
</a>
</div>

</div>
</body>
</html>
